# Created by Jobs on 2026年11月18日，星期三.
# CI 专用：只回收本 run/attempt 的已结束缓存；保留源码、Products 和原始验收证据。
require 'digest'
require 'fileutils'
require 'find'
require 'json'
require 'open3'
require 'pathname'
require 'rbconfig'
require 'time'

module JobsStabilityCIDisk
  ROOT = File.expand_path('../../../..', __dir__).freeze
  HELPER = 'ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_stability_ci_disk.rb/jobs_stability_ci_disk.rb'.freeze
  TEST = 'ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/Tests/ci_disk_regression.rb/ci_disk_regression.rb'.freeze
  BASELINE = 'ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_audit.rb/baseline.json'.freeze
  DIAGNOSTICS = [
    'Pods.build/*/ReactiveObjC.build/Objects-normal/arm64/*.resp',
    'Pods.build/*/ReactiveObjC.build/*.hmap',
    'Pods.build/*/*VFS*/*.yaml'
  ].freeze
  GIB = 1024**3
  # 4 GiB 是阶段进入下限，非后续完整编译的空间保证；实测采样另存回执。
  BUILD_FLOOR = 4 * GIB

  class CommandFailure < StandardError
    attr_reader :exit_status
    # 保留工具本身的失败状态，不用清理错误覆盖原始非零。
    def initialize(command, output, status)
      @exit_status = status.exitstatus || 128 + status.termsig.to_i
      super("#{command.inspect} failed (#{@exit_status}): #{output}")
    end
  end
  # 精确登记生产 helper 与它的行为回归；未知项、缺失或字节变化均须复审。
  def self.verify_trust!(root)
    known = JSON.parse(File.read(File.join(root, BASELINE))).fetch('ci_helpers')
    raise 'CI helper trust inventory changed' unless known.keys.sort == [HELPER, TEST].sort
    known.each do |relative, sha|
      path = File.join(root, relative)
      raise "Untrusted CI helper: #{relative}" unless File.file?(path) && !File.symlink?(path) && Digest::SHA256.file(path).hexdigest == sha
    end
  end

  class Manager
    # 所有可删除路径均由固定子目录构造，不接受任意目标目录。
    def initialize(root:, temp:, run:, attempt:)
      raise 'Invalid run/attempt' unless [run, attempt].all? { |v| v.to_s.match?(/\A[1-9][0-9]*\z/) }
      @root = File.realpath(root)
      @temp = File.realpath(temp)
      raise 'Runner temp must be outside source tree' if @temp == @root || @temp.start_with?(@root + '/') || @root.start_with?(@temp + '/')
      @identity = { 'repository' => 'JobsKits/JobsOCBaseConfigDemo', 'run' => run.to_s, 'attempt' => attempt.to_s, 'workspace' => @root }
      @state = File.join(@temp, "JobsCIDisk-#{run}-#{attempt}")
      @cache = File.join(@temp, "JobsOCRSourceCache-#{run}-#{attempt}")
      @output = File.join(@temp, 'JobsOCStability')
      @owner = File.join(@state, 'owner.json')
    end
    # 逐层检查目录与现存子树，禁止通过符号链接或特殊文件越出归属。
    def safe_tree!(path)
      expanded = File.expand_path(path)
      raise "Path escapes runner temp: #{path}" unless expanded.start_with?(@temp + '/')
      cursor = @temp
      expanded.delete_prefix(@temp + '/').split('/').each do |part|
        cursor = File.join(cursor, part)
        raise "Symlink rejected: #{cursor}" if File.symlink?(cursor)
      end
      return unless File.exist?(expanded)
      Find.find(expanded) do |entry|
        stat = File.lstat(entry)
        if stat.symlink?
          resolved = File.realpath(entry)
          raise "Symlink escapes owned tree: #{entry}" unless resolved.start_with?(expanded + '/')
          next
        end
        raise "Symlink/special file rejected: #{entry}" unless stat.file? || stat.directory?
        raise "Foreign device rejected: #{entry}" unless stat.dev == File.stat(@temp).dev
      end
    end
    # 原生命令使用参数数组；stderr 与真实退出状态一并保存。
    def capture!(*command)
      output, status = Open3.capture2e(*command)
      raise CommandFailure.new(command, output, status) unless status.success?
      output
    end
    # 只采样本次专有目录；df 为所在卷，du 不扫描其它任务或系统缓存。
    def sample
      df = capture!('/bin/df', '-Pk', @temp)
      available = Integer(df.lines.last.split.fetch(3)) * 1024
      owned = [@cache, @output].select { |p| File.exist?(p) }
      owned.each { |p| safe_tree!(p) }
      du = owned.empty? ? '' : capture!('/usr/bin/du', '-sk', *owned)
      allocation = du.lines.to_h do |line|
        blocks, path = line.chomp.split("\t", 2)
        raise 'Invalid du receipt' unless path && owned.include?(path)
        [path, Integer(blocks) * 1024]
      end
      { 'observed_at' => Time.now.utc.iso8601, 'available_bytes' => available, 'df' => df,
        'du_owned' => du, 'owned_allocated_bytes' => allocation }
    end
    # 只按实际当前余量放行；不能推断后续大构建一定收敛或空间足够。
    def require_space!(available, minimum)
      raise "Insufficient disk: available=#{available}, required=#{minimum} bytes" if available < minimum
    end
    # 记录初始化时的设备/inode，拒绝同名目录被其它进程替换后继续清理。
    def directory_identity(path)
      stat = File.stat(path)
      { 'device' => stat.dev, 'inode' => stat.ino }
    end
    # 必须先有本 run 的精确归属记录；不认领已有未知目录。
    def prepare
      [@state, @cache, @output].each do |path|
        safe_tree!(path)
        raise "Existing unowned directory: #{path}" if File.exist?(path)
      end
      [@state, @cache, @output].each { |path| Dir.mkdir(path, 0o700) }
      data = @identity.merge('directories' => [@state, @cache, @output].to_h { |path| [path, directory_identity(path)] })
      File.write(@owner, JSON.pretty_generate(data) + "\n")
      @owner_verified = true
    end
    # 只复用初始化时登记的输出根，缓存删除后仍核对未变的输出根。
    def verify_owner!
      safe_tree!(@state)
      data = JSON.parse(File.read(@owner))
      raise 'CI disk ownership mismatch' unless @identity.all? { |k, v| data[k] == v }
      raise 'CI disk owned path inventory changed' unless data.fetch('directories').keys.sort == [@state, @cache, @output].sort
      data.fetch('directories').each do |path, expected|
        next if path == @cache && !File.exist?(@cache)
        safe_tree!(path)
        raise "Owned directory replaced: #{path}" unless directory_identity(path) == expected
      end
      @owner_verified = true
    end
    # 列举真实文件字节，供 SDK 自包含核验与诊断文件清理前后比较。
    def hashes(paths)
      paths.sort.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
    end
    # 构建器已把归档/Headers复制到SDK；逐文件回执及资源不允许指向缓存。
    def verify_sdk!
      sdk = File.join(@root, 'JobsByPods/JobsRustOCR@Pods')
      framework = File.join(sdk, 'Frameworks/JobsOCRCore.xcframework')
      receipt = File.join(sdk, 'Frameworks/.JobsOCRCore-build.sha256')
      inputs = [framework, File.join(sdk, 'Resource/JobsRustOCRResources.bundle'), File.join(sdk, 'Source/JobsOCR/include'), File.join(sdk, 'Core')]
      inputs.each do |folder|
        raise "Missing SDK export: #{folder}" unless File.directory?(folder)
        raise "SDK export ancestor escapes SDK: #{folder}" unless File.realpath(folder).start_with?(sdk + '/')
        Find.find(folder) do |path|
          raise "SDK export symlink: #{path}" if File.symlink?(path)
          next unless File.file?(path) && path.match?(/\.(?:h|plist|modulemap)\z/)
          raise "SDK export references cache: #{path}" if File.binread(path).include?(@cache)
        end
      end
      rows = File.readlines(receipt, chomp: true)
      raise 'Invalid SDK input receipt' unless rows.shift.to_s.match?(/\A[0-9a-f]{64}\z/)
      expected = rows.to_h do |row|
        match = /\A([0-9a-f]{64})  (JobsOCRCore\.xcframework\/.+)\z/.match(row)
        raise 'Invalid SDK file receipt' unless match
        relative = match[2]
        path = File.expand_path(relative, File.join(sdk, 'Frameworks'))
        raise 'SDK receipt path escapes export' unless path.start_with?(framework + '/')
        [path, match[1]]
      end
      raise 'Duplicate SDK receipt member' unless expected.size == rows.size
      files = Dir.glob(File.join(framework, '**/*'), File::FNM_DOTMATCH).select { |p| File.file?(p) }
      raise 'SDK export byte receipt mismatch' unless !files.empty? && hashes(files) == expected
      %w[ios-arm64 ios-arm64_x86_64-simulator macos-arm64_x86_64].each do |slice|
        %w[libJobsOCRCore.a Headers/JobsOCRCore.h].each do |file|
          raise "SDK slice missing: #{slice}/#{file}" unless File.size?(File.join(framework, slice, file))
        end
      end
      { 'verified_export_files' => files.size, 'receipt_sha256' => Digest::SHA256.file(receipt).hexdigest,
        'cache_dependency' => false, 'export_directories' => inputs }
    end
    # 清理前核当前记录的真实成功状态；不把退出0或旧配置误作完整阶段成功。
    def successful_rows!(kind, expected)
      record = JSON.parse(File.read(File.join(@output, 'results.json')))
      rows = record.fetch('results').select { |r| r['kind'] == kind }
      actual = rows.map { |r| [r['name'], r['configuration']] }
      raise "Incomplete #{kind} inventory" unless actual.sort == expected.sort && rows.all? do |r|
        r['source_fingerprint'] == record['source_fingerprint'] && r['source_consistent'] == true &&
          r['exit_status'] == 0 && r['process_exit_status'] == 0 && r['process_signal'].nil? &&
          r['process_status_collected'] == true && r['timed_out'] == false
      end
      rows
    end
    # 文件删除使用安全目录API，精确重验归属，不借助全局rm或跟随链接。
    def remove!(path)
      allowed = [@cache, File.join(@output, 'DerivedData'), File.join(@output, 'Intermediates'),
                 File.join(@output, 'ApplicationTests/DerivedData'), File.join(@output, 'ApplicationTests/Intermediates')]
      expanded = File.expand_path(path)
      raise "Not a disposable build directory: #{path}" unless allowed.any? { |p| expanded == p || expanded.start_with?(p + '/') }
      safe_tree!(path)
      FileUtils.remove_entry_secure(path) if File.exist?(path)
    end
    # 仅递归移除未被诊断保留清单覆盖的节点，原件保持在原路径。
    def prune!(path, keep)
      return if keep.include?(path)
      unless keep.any? { |p| p.start_with?(path + '/') }
        remove!(path)
        return
      end
      Dir.children(path).each { |name| prune!(File.join(path, name), keep) }
    end
    # 打包余量按实际App未压缩文件字节×2，加1GiB压缩/上传/Worker日志余量。
    def package_requirement
      app = File.join(@output, 'Products/Debug-iphonesimulator/JobsOCBaseConfigDemo.app')
      safe_tree!(app)
      raise 'Main Debug App missing' unless File.file?(File.join(app, 'Info.plist'))
      bytes = 0
      Find.find(app) { |path| bytes += File.size(path) if File.file?(path) }
      { 'app_logical_bytes' => bytes, 'minimum_free_bytes' => 2 * bytes + GIB }
    end
    # 回执只写已核归属目录；写入失败单独报告，不能覆盖先前主命令状态。
    def write_report(phase, report)
      return unless @owner_verified
      safe_tree!(@state)
      File.write(File.join(@state, "#{phase}.json"), JSON.pretty_generate(report) + "\n")
    end
    # 阶段成功后才回收；失败也写回执，后续构建/打包由真实非零停止。
    def run(phase)
      raise 'Invalid phase' unless %w[prepare rust tests app].include?(phase)
      @owner_verified = false
      report = { 'phase' => phase, 'identity' => @identity, 'valid' => false,
                 'ruby' => { 'executable' => RbConfig.ruby, 'version' => RUBY_VERSION, 'description' => RUBY_DESCRIPTION } }
      failure = nil
      begin
        if phase == 'prepare'
          prepare
        else
          verify_owner!
        end
        report['before'] = sample
        case phase
        when 'prepare'
          report['minimum_free_bytes'] = BUILD_FLOOR
        when 'rust'
          report['sdk'] = verify_sdk!
          remove!(@cache)
          report['minimum_free_bytes'] = BUILD_FLOOR
        when 'tests'
          baseline = JSON.parse(File.read(File.join(@root, BASELINE)))
          specs = Dir.glob(File.join(@root, 'JobsByPods/*@Pods/*.podspec')).reject { |p| p.include?('/ManualBy') }
          expected = specs.select { |p| File.read(p).match?(/\.test_spec\s+['"]Stability['"]/) }.flat_map do |path|
            name = File.basename(path, '.podspec')
            raise "Unknown test Pod: #{name}" unless baseline.fetch('expected_pods').include?(name)
            (name == 'JobsOCSnowflake' ? %w[Debug Release] : ['Debug']).map { |config| [name, config] }
          end
          raise 'Pod test configuration inventory changed' unless expected.size == 51 && expected.uniq.size == 51
          expected << ['ApplicationTests', 'Debug']
          rows = successful_rows!('test', expected)
          %w[JobsBaseUI ApplicationTests].each do |name|
            raise "Host signature not verified: #{name}" unless rows.find { |r| r['name'] == name }.dig('host_signature', 'valid') == true
          end
          %w[DerivedData Intermediates].each { |name| remove!(File.join(@output, 'ApplicationTests', name)) }
          report['minimum_free_bytes'] = BUILD_FLOOR
        when 'app'
          successful_rows!('app', %w[Debug Release].map { |config| ['JobsOCBaseConfigDemo', config] })
          middle = File.join(@output, 'Intermediates')
          safe_tree!(middle)
          keep = DIAGNOSTICS.flat_map { |pattern| Dir.glob(File.join(middle, pattern)) }.sort
          keep.each { |path| safe_tree!(path) }
          before = hashes(keep)
          remove!(File.join(@output, 'DerivedData'))
          prune!(middle, keep) if File.exist?(middle)
          raise 'Diagnostic evidence changed' unless hashes(keep) == before
          report['preserved_diagnostics'] = before
          report.merge!(package_requirement)
        else
          raise "Unknown CI disk phase: #{phase}"
        end
        report['after'] = sample
        report['owned_allocated_bytes_reclaimed'] = report['before']['owned_allocated_bytes'].values.sum - report['after']['owned_allocated_bytes'].values.sum
        require_space!(report['after']['available_bytes'], report['minimum_free_bytes'])
        report['valid'] = true
        report['exit_status'] = 0
      rescue StandardError => error
        failure = error
        report['error'] = "#{error.class}: #{error.message}"
        report['exit_status'] = error.is_a?(CommandFailure) ? error.exit_status : 1
      ensure
        begin
          write_report(phase, report)
        rescue StandardError => error
          report['receipt_error'] = "#{error.class}: #{error.message}"
          report['valid'] = false
          report['exit_status'] = 1 unless failure
          failure ||= error
          warn "CI disk receipt failed: #{error.message}"
        end
        puts JSON.generate(report)
      end
      raise failure if failure
      report
    end
  end
  # 生产入口要求显式CI参数、官方运行身份及冻结helper；非TTY不算授权。
  def self.main(arguments)
    puts JSON.generate('ruby_executable' => RbConfig.ruby, 'ruby_version' => RUBY_VERSION, 'ruby_description' => RUBY_DESCRIPTION)
    raise 'Usage: ruby jobs_stability_ci_disk.rb --ci prepare|rust|tests|app' unless arguments.size == 2 && arguments.first == '--ci' && %w[prepare rust tests app].include?(arguments.last)
    raise 'GitHub Actions CI only' unless ENV['CI'] == 'true' && ENV['GITHUB_ACTIONS'] == 'true' && ENV['GITHUB_REPOSITORY'] == 'JobsKits/JobsOCBaseConfigDemo'
    raise 'Workspace identity mismatch' unless File.realpath(ENV.fetch('GITHUB_WORKSPACE')) == ROOT
    verify_trust!(ROOT)
    puts 'CI disk: reclaim only completed, owned cache; preserve Products and original validation records.'
    Manager.new(root: ROOT, temp: ENV.fetch('RUNNER_TEMP'), run: ENV.fetch('GITHUB_RUN_ID'), attempt: ENV.fetch('GITHUB_RUN_ATTEMPT')).run(arguments.last)
    0
  rescue StandardError => error
    warn error.message
    error.is_a?(CommandFailure) ? error.exit_status : 1
  end
end

exit JobsStabilityCIDisk.main(ARGV) if $PROGRAM_NAME == __FILE__
