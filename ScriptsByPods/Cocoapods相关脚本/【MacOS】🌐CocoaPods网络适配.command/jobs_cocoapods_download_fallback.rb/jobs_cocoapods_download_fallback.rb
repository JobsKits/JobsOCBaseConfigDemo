# frozen_string_literal: true

# Jobs 自维护适配器：仅在已审发布版本的 Git 连接失败后尝试 GitHub 官方归档。
require 'fileutils'
require 'pathname'
require 'tmpdir'
require 'uri'

module JobsCocoaPodsDownloadFallback
  # 新增条目前须审查 prepare、Git 子模块、LFS 及 archive 导出属性，不能只补一个域名。
  AUDITED_RELEASES = {
    ['AMPopTip', '4.12.0'].freeze => {
      :repository => 'andreamazz/AMPopTip',
      :tag => '4.12.0',
      :commit => 'db495eea0747a3493ca8b3c737d037c0090973db'
    }.freeze
  }.freeze
  CONTEXT_KEY = :jobs_cocoapods_archive_request
  CONNECT_TIMEOUT = 5
  DOWNLOAD_TIMEOUT = 60

  # 请求上下文按线程隔离；缓存、并行下载和递归调用不会串用其它 Pod 的权限。
  module RequestContext
    def download_request(request, target)
      previous = Thread.current[CONTEXT_KEY]
      Thread.current[CONTEXT_KEY] = request
      super
    ensure
      Thread.current[CONTEXT_KEY] = previous
    end
  end

  # 只接管 clone 阶段的网络错误，checkout、校验和准备命令仍按原流程失败。
  module GitArchiveFallback
    def clone(force_head = false, shallow_clone = true)
      super
    rescue Pod::Downloader::DownloaderError => original_error
      release = JobsCocoaPodsDownloadFallback.allowed_release(self)
      raise if force_head || !release || !JobsCocoaPodsDownloadFallback.network_error?(original_error)

      JobsCocoaPodsDownloadFallback.archive_after_failure(self, release, original_error)
    end

    # 归档已经是核验的完整 commit；不能再对不存在的 .git 执行 checkout。
    def checkout_commit
      return if @jobs_archive_commit

      super
    end

    # 保持直接 downloader API 的精确检出身份；CocoaPods 安装仍返回原 request.params。
    def checkout_options
      return { :git => url, :commit => @jobs_archive_commit } if @jobs_archive_commit

      super
    end

    private :clone, :checkout_commit
  end

  class << self
    # Podfile 仅在 install/update 阶段挂载；未知 downloader API 保留官方行为。
    def install!
      return false unless enabled?
      return true if @installed

      require 'cocoapods/downloader'
      unless compatible_api?
        warning('当前 CocoaPods 下载 API 未验证，跳过官方归档回退。')
        return false
      end

      build_archive_downloader
      Pod::Downloader.singleton_class.prepend(RequestContext)
      Pod::Downloader::Git.prepend(GitArchiveFallback)
      @installed = true
    rescue LoadError, StandardError
      warning('归档适配器无法加载，继续使用原 CocoaPods 下载流程。')
      false
    end

    # 环境开关在每次失败处重新读取，当前进程也能立即关闭回退。
    def enabled?
      ENV['JOBS_POD_GITHUB_ARCHIVE_FALLBACK'] != '0'
    end

    # 同时验证版本与方法签名，不把未来内部实现误认为兼容。
    def compatible_api?
      git = Pod::Downloader::Git
      http = Pod::Downloader::Http
      Pod::Downloader::VERSION.to_s == '2.1' &&
        Pod::Downloader.method(:download_request).arity == 2 &&
        git.instance_method(:clone).arity == -1 &&
        git.instance_method(:checkout_commit).arity == 0 &&
        git.instance_method(:checkout_options).arity == 0 &&
        git.instance_method(:clone).owner == git &&
        http.instance_method(:initialize).arity == 3 &&
        http.instance_method(:download).arity == 0 &&
        http.instance_method(:download_file).arity == 1
    rescue NameError
      false
    end

    # 仅放行有原始已发布 spec、无准备命令且 source 完全匹配的已审版本。
    def allowed_release(downloader)
      return unless enabled?

      request = Thread.current[CONTEXT_KEY]
      return unless request && request.released_pod? && request.spec

      spec = request.spec
      return unless spec.prepare_command.to_s.strip.empty?

      release = AUDITED_RELEASES[[spec.name.to_s, spec.version.to_s]]
      return unless release

      params = symbolize(request.params)
      return unless params && symbolize(spec.source) == params
      return unless (params.keys - [:git, :tag, :commit, :submodules]).empty?
      return if params[:submodules]
      return unless repository(params[:git]) == release[:repository]
      return unless params[:git] == downloader.url && params.reject { |key, _| key == :git } == downloader.options

      tag_only = params[:tag].to_s == release[:tag] && !params.key?(:commit)
      commit_only = params[:commit].is_a?(String) &&
        params[:commit].match?(/\A[0-9a-f]{40}\z/) &&
        params[:commit] == release[:commit] && !params.key?(:tag)
      release if tag_only || commit_only
    rescue StandardError
      nil
    end

    # 严格限定无凭据、无自定义端口、无 query 的 GitHub HTTPS 公共仓库地址。
    def repository(value)
      return unless value.is_a?(String)

      uri = URI.parse(value)
      return unless uri.scheme == 'https' && uri.host == 'github.com' && uri.port == 443
      return if uri.userinfo || uri.query || uri.fragment || value.match?(/[\s\\]/)

      match = %r{\A/([A-Za-z0-9][A-Za-z0-9-]*)/([A-Za-z0-9][A-Za-z0-9._-]*?)(?:\.git)?\z}.match(uri.path)
      return unless match && !['.', '..'].include?(match[2])

      "#{match[1]}/#{match[2]}"
    rescue URI::InvalidURIError
      nil
    end

    # 错误正文只用于判定，不输出正文，避免代理地址或凭据进入新增日志。
    def network_error?(error)
      message = error.message.to_s
      denied = /authentication|could not read username|repository not found|remote branch .*not found|couldn't find remote ref|not our ref|reference is not a tree|unknown revision|pathspec .*did not match|requested url returned error:\s*(?:401|403|404)|http\s+(?:401|403|404)|checksum|certificate (?:verify failed|has expired)|ssl certificate problem|invalid object|index-pack|unpack-objects/i
      return false if message.match?(denied)

      message.match?(/failed to connect to .+ port \d+|could not resolve (?:host|proxy)|connection (?:timed out|refused|reset)|operation timed out|ssl_connect|tls connect error|gnutls_handshake|ssl_error_(?:syscall|zero_return)|tls connection was non-properly terminated|http\/2 stream .*(?:not closed cleanly|cancel)|empty reply from server/i)
    end

    # 先在独立临时目录下载和验证；失败时保留原 Git 目标与原错误对象。
    def archive_after_failure(downloader, release, original_error)
      warning("#{release[:repository]} #{release[:tag]}：Git 连接失败，尝试官方 codeload 归档。")
      target = downloader.target_path
      stage = '创建临时目录'
      temporary = Dir.mktmpdir('jobs-pod-archive-', target.parent.to_s)
      payload = Pathname(temporary).join('payload')
      payload.mkpath
      stage = 'HTTPS 下载与解包'
      archive_url = "https://codeload.github.com/#{release[:repository]}/tar.gz/#{release[:commit]}"
      @archive_downloader_class.new(payload, archive_url, :type => :tgz, :flatten => true).download
      stage = '归档内容验证'
      validate_payload!(payload)
      stage = '替换下载暂存目录'
      replace_target!(payload, target, Pathname(temporary).join('original-git-attempt'))
      downloader.instance_variable_set(:@jobs_archive_commit, release[:commit])
      warning("官方归档成功（#{release[:commit][0, 12]}），原 Pod 版本、spec 与锁参数保持。")
      nil
    rescue StandardError
      warning("官方归档在“#{stage}”失败；继续报告原 Git 错误，请检查终端代理或网络。")
      raise original_error
    ensure
      cleanup_temporary(temporary)
    end

    # 只接受已审发布版本的必要源码；拒绝新增 Git/LFS/导出属性依赖。
    def validate_payload!(payload)
      raise '缺少发布源码' if payload.glob('Source/*.swift').empty? || !payload.join('LICENSE').file?

      payload.find do |path|
        raise '归档包含符号链接' if path.symlink?
        raise '归档包含 Git 元数据或子模块' if ['.git', '.gitmodules'].include?(path.basename.to_s)
        next unless path.file?

        if path.basename.to_s == '.gitattributes' && path.read.match?(/export-ignore|export-subst|filter\s*=\s*lfs/i)
          raise '归档需要特殊 Git 导出语义'
        end
        next unless path.extname == '.swift'

        raise '归档仅包含 LFS 指针' if path.open('rb') { |file| file.read(100).to_s }.start_with?('version https://git-lfs.github.com/spec/v1')
      end
    end

    # 下载目录替换失败时恢复原 Git 暂存，避免把半次归档当作成功。
    def replace_target!(payload, target, backup)
      moved_original = false
      if target.exist? || target.symlink?
        FileUtils.move(target, backup)
        moved_original = true
      end
      FileUtils.move(payload, target)
    rescue StandardError
      FileUtils.move(backup, target) if moved_original && backup.exist? && !target.exist?
      raise
    end

    # Hash 副本仅用于比较，不修改原 source、请求参数或锁定对象。
    def symbolize(value)
      return unless value.is_a?(Hash)

      value.each_with_object({}) { |(key, entry), copy| copy[key.to_sym] = entry }
    end

    # 复用官方 Http 下载和解包流程，仅对这条新链路补充 HTTPS 与超时限制。
    def build_archive_downloader
      @archive_downloader_class = Class.new(Pod::Downloader::Http) do
        # 匿名子类仍须向官方 Base 的 UI 提供有效策略名称。
        def name
          'Jobs GitHub archive'
        end

        # 不读取 curlrc/netrc，不附加认证信息，保留当前进程已配置的代理环境。
        def download_file(full_filename)
          curl! ['--disable', '--fail', '--location', '--max-redirs', '0',
                 '--output', full_filename, url, '--create-dirs',
                 '--connect-timeout', CONNECT_TIMEOUT.to_s, '--max-time', DOWNLOAD_TIMEOUT.to_s,
                 '--retry', '0', '--proto', '=https', '--proto-redir', '=https',
                 '--user-agent', Pod::Downloader::Http.user_agent_string]
        end

        private :download_file
      end
    end

    # 清理异常不能覆盖原始下载错误或把成功结果误报为下载失败。
    def cleanup_temporary(path)
      FileUtils.remove_entry(path) if path && File.directory?(path)
    rescue StandardError
      warning('归档临时目录未能清理，请按系统临时目录策略处理。')
    end

    # 新增日志仅包含受控阶段和审计常量，不回显外部错误消息。
    def warning(message)
      $stderr.puts("[Jobs Pod 下载] #{message}")
    end
  end
end
