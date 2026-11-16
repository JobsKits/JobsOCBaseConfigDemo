#!/usr/bin/env ruby
# frozen_string_literal: true

# Xcode 非交互构建工具：把仓库内 Jobs 自有 Markdown 与其本地资源打入固定 Bundle。

# JOBS_TERMINAL_STYLE_GUARD_V1_BEGIN
if $PROGRAM_NAME == __FILE__
  # 直接运行时由 fork 父进程保护配色；子进程继续原文件，不重放 Ruby 参数和预载模块。
  def jobs_terminal_style_bootstrap_v1
    return unless $PROGRAM_NAME == __FILE__
    plain = lambda do
      ENV.update('PLAIN_OUTPUT' => '1', 'NO_COLOR' => '1', 'FORCE_COLOR' => '0',
                 'CLICOLOR' => '0', 'ANSI_COLORS_DISABLED' => '1', 'npm_config_color' => 'false')
    end
    notify = lambda do |message|
      encoding = $stderr.external_encoding || Encoding::UTF_8
      $stderr.write((message + "\n").encode(encoding, invalid: :replace, undef: :replace))
    end
    return unless $stdin.tty? && $stdout.tty?
    return if ENV.key?('NO_COLOR') || ENV['PLAIN_OUTPUT'] == '1' ||
              ENV['IS_SOURCETREE_RUNTIME'] == '1' ||
              ENV.keys.any? { |key| key.match?(/\A(?:SOURCETREE|SOURCE_TREE)/i) }
    return if ['', 'dumb'].include?(ENV.fetch('TERM', ''))
    if File::ALT_SEPARATOR == '\\' || !Process.respond_to?(:fork) ||
       Thread.list.length > 1 || ENV['TMUX'] || ENV['STY']
      plain.call
      return
    end
    tty_name = IO.popen(['tty'], err: File::NULL, &:read).strip
    groups = IO.popen(['ps', '-o', 'pgid=', '-o', 'tpgid=', '-p', Process.pid.to_s], err: File::NULL, &:read).split
    unless tty_name.match?(%r{\A/dev/[A-Za-z0-9_./-]+\z}) && groups.length == 2 &&
           groups.all? { |group| group.match?(/\A\d+\z/) } && groups[0].to_i > 0 && groups[0] == groups[1]
      plain.call
      return
    end
    owner = ENV['JOBS_TERMINAL_STYLE_OWNER']
    if ENV['JOBS_TERMINAL_STYLE_TTY'] == tty_name && owner && owner.match?(/\A\d+\z/)
      begin
        Process.kill(0, owner.to_i)
        return
      rescue Errno::ESRCH, Errno::EPERM
      end
    end
    require 'io/console'
    require 'tmpdir'
    if Thread.list.length > 1
      plain.call
      return
    end
    tty = File.open('/dev/tty', 'r+')
    tty.binmode
    tty.sync = true
    keys = ['10', '11', '12'] + (0..15).map { |index| "4;#{index}" }
    palette = %w[000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee
                 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff]
    targets = { '10' => 'ffffff', '11' => '000000', '12' => 'ffffff' }
    palette.each_with_index { |color, index| targets["4;#{index}"] = color }
    query = lambda do |key|
      tty.write("\e]#{key};?\a")
      bytes = ''.b
      deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 0.3
      loop do
        remaining = deadline - Process.clock_gettime(Process::CLOCK_MONOTONIC)
        return nil if remaining <= 0 || !IO.select([tty], nil, nil, remaining)
        piece = tty.read_nonblock(256, exception: false)
        next if piece == :wait_readable
        return nil unless piece && !piece.empty?
        bytes << piece
        return nil if bytes.bytesize > 256 || !bytes.start_with?("\e".b)
        break if bytes.end_with?("\a".b) || bytes.end_with?("\e\\".b)
      end
      match = bytes.match(/\A\e\]#{Regexp.escape(key)};rgb:([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})(?:\a|\e\\)\z/n)
      return nil unless match
      components = match.captures.map { |hex| (hex.to_i(16) * 65535.0 / (16**hex.length - 1)).round }
      { raw: bytes, rgb: components }
    rescue IOError, SystemCallError
      nil
    end
    snapshot = lambda do
      values = {}
      tty.raw(min: 0, time: 0, intr: true) do
        keys.each do |key|
          value = query.call(key)
          return nil unless value
          values[key] = value
        end
      end
      values
    rescue IOError, SystemCallError, ArgumentError
      nil
    end
    original = snapshot.call
    unless original
      notify.call('终端不支持完整配色保存，或启动时收到其它输入；保留原配色并使用纯文本。')
      tty.close
      plain.call
      return
    end
    directory = Dir.mktmpdir('jobs-terminal-style-')
    recovery = File.join(directory, 'restore.sh')
    original_bytes = keys.map { |key| original.fetch(key).fetch(:raw) }.join
    recovery_source = "#!/bin/sh\n" \
      "[ -t 0 ] && [ \"$(tty)\" = '#{tty_name}' ] || { printf '请在原终端运行恢复入口。\\n' >&2; exit 1; }\n" \
      "printf '本操作会覆盖此终端当前配色。确认恢复脚本启动前的配色，请输入 YES：' >&2\n" \
      "IFS= read -r jobs_restore_choice\n[ \"$jobs_restore_choice\" = YES ] || exit 1\n" \
      "printf '%s\\033[0m' '#{original_bytes}' > /dev/tty\n"
    File.open(recovery, File::WRONLY | File::CREAT | File::EXCL, 0o600) do |file|
      file.binmode
      file.write(recovery_source.b)
    end
    notify.call("本次终端临时使用黑底白字；强退后恢复入口：sh \"#{recovery}\"")
    changed = false
    applied = nil
    # 比较仍生效的本轮颜色，只恢复未被用户另行修改的项。
    cleanup = lambda do
      current = applied && snapshot.call
      unless current
        notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
        return false
      end
      conflicts = []
      restore_bytes = ''.b
      keys.each do |key|
        if current.fetch(key).fetch(:rgb) == applied.fetch(key).fetch(:rgb)
          restore_bytes << original.fetch(key).fetch(:raw)
        else
          conflicts << key
        end
      end
      tty.write(restore_bytes + "\e[0m".b)
      if conflicts.empty?
        File.unlink(recovery)
        Dir.rmdir(directory)
        true
      else
        notify.call("检测到运行期间的配色变更，已保留这些项：#{conflicts.join(' ')}")
        notify.call("确认要覆盖后续改色时才使用恢复入口：sh \"#{recovery}\"")
        false
      end
    rescue IOError, SystemCallError
      notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
      false
    end
    child_pid = nil
    guardian = false
    interrupted = nil
    previous_signals = {}
    %w[INT TERM HUP].each do |name|
      previous_signals[name] = Signal.trap(name) do
        interrupted = name
        if child_pid && name != 'INT'
          begin
            Process.kill(name, child_pid)
          rescue Errno::ESRCH
          end
        end
      end
    end
    begin
      changed = true
      tty.write(targets.map { |key, color| "\e]#{key};##{color}\a" }.join + "\e[0m")
      applied = snapshot.call
      unless applied
        notify.call('无法核实本次临时配色，已停止启动业务。')
        raise SystemExit, 1
      end
      desired = targets.all? do |key, hex|
        rgb = hex.scan(/../).map { |component| component.to_i(16) * 257 }
        applied.fetch(key).fetch(:rgb).zip(rgb).all? { |actual, expected| (actual - expected).abs <= 255 }
      end
      unless desired
        notify.call('终端未接受本次配色，恢复后使用纯文本。')
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      if interrupted
        raise SystemExit, 128 + Signal.list.fetch(interrupted)
      end
      if Thread.list.length > 1
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      $stdout.flush
      $stderr.flush
      begin
        child_pid = Process.fork
      rescue NotImplementedError, SystemCallError
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      unless child_pid
        changed = false
        ENV['JOBS_TERMINAL_STYLE_TTY'] = tty_name
        ENV['JOBS_TERMINAL_STYLE_OWNER'] = Process.ppid.to_s
        raise SystemExit, 128 + Signal.list.fetch(interrupted) if interrupted
        return
      end
      guardian = true
      result = nil
      loop do
        begin
          _, result = Process.wait2(child_pid)
          break
        rescue Interrupt, Errno::EINTR
        end
      end
      status_code = result.exitstatus || 128 + result.termsig
      %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
      restored = cleanup.call
      changed = false
      status_code = 1 if !restored && status_code.zero?
      tty.close
      Process.exit!(status_code)
    ensure
      if changed
        %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
        cleanup.call
      end
      previous_signals.each { |name, handler| Signal.trap(name, handler) } unless guardian
      tty.close unless tty.closed?
    end
  rescue IOError, SystemCallError, LoadError => error
    if guardian
      notify.call("终端保护监督进程异常：#{error.message}")
      Process.exit!(1)
    end
    raise SystemExit, 1 if changed
    notify.call("终端保护不可用，使用纯文本：#{error.message}")
    plain.call
  end
  jobs_terminal_style_bootstrap_v1

end
# JOBS_TERMINAL_STYLE_GUARD_V1_END

require 'digest'
require 'fileutils'
require 'json'
require 'pathname'
require 'time'
require 'uri'

class JobsMarkdownPackager
  OUTPUT_BUNDLE_NAME = 'JobsMarkdownDocuments.bundle'
  IMAGE_EXTENSIONS = %w[.png .jpg .jpeg .gif .webp .svg .heic .heif .bmp .tif .tiff .ico .avif .apng].freeze
  EXCLUDED_COMPONENTS = [
    '.git',
    '.gitkeep',
    '.codegraph',
    '.dart_tool',
    '.build',
    '.DerivedDataUnity',
    'Pods',
    'node_modules',
    'build',
    'DerivedData',
    'Products',
    'Intermediates',
    'JobsMarkdownDocuments.bundle',
    'PodspecDependencyReport',
    'Unity'
  ].freeze
  EXCLUDED_PREFIXES = [
    'JobsByPods/ManualByOCPods@Pods',
    'JobsByPods/ManualBySwiftPods@Pods',
    'JobsByPods/PodsManual',
    'work/JobsPodsStability/full'
  ].freeze

  def initialize(project_root, output_bundle, project_name)
    @project_root = normalized_pathname(project_root)
    @output_bundle = normalized_pathname(output_bundle)
    normalized_project_name = utf8_string(project_name, '项目名')
    @project_name = normalized_project_name.empty? ? @project_root.basename.to_s : normalized_project_name
    @documents = []
    @missing_resources = []
    @copied_resources = {}
  end

  # 编排参数校验、Markdown 扫描、资源复制和清单写入。
  def run
    validate_paths!
    prepare_output
    markdown_paths.each { |path| package_document(path) }
    write_manifest
    puts "✅ Markdown 文档已打包：#{@documents.length} 个，缺失本地资源 #{@missing_resources.length} 个"
  end

  private

  # Xcode 的非交互 Shell 可能没有 UTF-8 locale，需要主动纠正路径编码标签。
  def utf8_string(value, description)
    string = value.to_s.dup
    if [Encoding::ASCII_8BIT, Encoding::US_ASCII].include?(string.encoding)
      string.force_encoding(Encoding::UTF_8)
    else
      string.encode!(Encoding::UTF_8)
    end
    raise "#{description}不是有效的 UTF-8" unless string.valid_encoding?

    string
  rescue Encoding::InvalidByteSequenceError, Encoding::UndefinedConversionError => e
    raise "#{description}无法转换为 UTF-8：#{e.message}"
  end

  # expand_path 会再次套用进程默认编码，因此在展开后重新标记为 UTF-8。
  def normalized_pathname(value)
    expanded = Pathname(value.to_s).expand_path.cleanpath
    Pathname(utf8_string(expanded.to_s, '路径'))
  end

  # 限制输入必须是仓库目录，输出必须是构建产物内的固定 Bundle 名。
  def validate_paths!
    raise "项目目录不存在：#{@project_root}" unless @project_root.directory?
    unless @output_bundle.basename.to_s == OUTPUT_BUNDLE_NAME
      raise "拒绝写入非固定 Bundle：#{@output_bundle}"
    end
    raise '拒绝把输出写到项目根目录或文件系统根目录' if @output_bundle == @project_root || @output_bundle.to_s == '/'
  end

  # 只清理本次构建产物中的固定 Markdown Bundle。
  def prepare_output
    FileUtils.rm_rf(@output_bundle)
    FileUtils.mkdir_p(documents_root)
  end

  # 返回排除第三方、构建产物和生成目录后的 Markdown 文件。
  def markdown_paths
    Dir.glob(@project_root.join('**', '*').to_s, File::FNM_DOTMATCH)
       .map { |path| Pathname(utf8_string(path, '扫描路径')) }
       .select(&:file?)
       .select { |path| path.extname.casecmp('.md').zero? }
       .reject { |path| excluded?(relative_path(path)) }
       .sort_by { |path| relative_path(path) }
  end

  # 判定相对路径是否落入明确排除范围。
  def excluded?(relative)
    components = Pathname(relative).each_filename.to_a
    return true if (components & EXCLUDED_COMPONENTS).any?
    return true if components.any? { |component| component.match?(/\AManualBy.*Pods@Pods\z/) }

    EXCLUDED_PREFIXES.any? { |prefix| relative == prefix || relative.start_with?("#{prefix}/") }
  end

  # 文档附件同样遵守宿主图片边界，保留自建 Pod 的独立资源归属。
  def excluded_image_resource?(relative)
    return false unless IMAGE_EXTENSIONS.include?(File.extname(relative).downcase)
    return false if relative.start_with?('JobsOCBaseConfigDemo/其他/libs/')
    return false if relative.match?(%r{\AJobsByPods/[^/]+@Pods/})

    true
  end

  # 复制单个 Markdown，生成标题，并继续收集它引用的本地资源。
  def package_document(source_path)
    relative = relative_path(source_path)
    content = read_text(source_path)
    destination = documents_root.join(relative)
    copy_file(source_path, destination)
    @documents << {
      id: Digest::SHA256.hexdigest(relative),
      title: document_title(content, source_path),
      relativePath: relative,
      resourcePath: "Documents/#{relative}"
    }
    referenced_local_paths(content, source_path).each do |resource_path|
      package_resource(resource_path, relative)
    end
  end

  # 读取 UTF-8 文本，并用替换字符容忍极少数损坏字节。
  def read_text(path)
    path.binread.force_encoding(Encoding::UTF_8).scrub
  end

  # 优先取 YAML title 和首个一级标题，否则退回文件名。
  def document_title(content, source_path)
    front_matter = content.match(/\A\uFEFF?---\s*\n(.*?)\n---\s*(?:\n|\z)/m)&.captures&.first.to_s
    yaml_title = front_matter.each_line.map do |line|
      match = line.match(/\Atitle\s*:\s*(.+?)\s*\z/i)
      match && match[1].sub(/\A(['"])(.*)\1\z/, '\\2')
    end.compact.first
    return clean_title(yaml_title) unless yaml_title.to_s.strip.empty?

    heading = content.each_line.map do |line|
      match = line.match(/\A#\s+(.+?)\s*#*\s*\z/)
      match && match[1].gsub(/<[^>]+>/, '').strip
    end.compact.first
    return clean_title(heading) unless heading.to_s.empty?

    source_path.basename(source_path.extname).to_s
  end

  # 去掉标题里的常见 Markdown 行内标记，保证 Cell 标题直接可读。
  def clean_title(title)
    title.to_s
         .gsub(/!\[([^\]]*)\]\([^)]+\)/, '\\1')
         .gsub(/\[([^\]]+)\]\([^)]+\)/, '\\1')
         .gsub(/`([^`]*)`/, '\\1')
         .gsub(/[*_~]+/, '')
         .gsub(/\s+/, ' ')
         .strip
  end

  # 收集 Markdown 和 HTML 标签里的本地 src/href，并按 Typora root URL 解析。
  def referenced_local_paths(content, source_path)
    values = []
    content.scan(/!?\[[^\]]*\]\(\s*<?([^\s)>]+)>?(?:\s+["'][^"']*["'])?\s*\)/) { |match| values << match.first }
    content.scan(/<(?:img|video|audio|source|iframe|a)\b[^>]*?\b(?:src|href)\s*=\s*["']([^"']+)["']/i) do |match|
      values << match.first
    end
    typora_root = content.match(/\A\uFEFF?---\s*\n.*?^\s*typora-root-url\s*:\s*(.+?)\s*$.*?^---\s*$/mi)&.captures&.first
    values.map { |value| resolve_local_reference(value, source_path, typora_root) }.compact.uniq
  end

  # 将单个引用解析到仓库内；远程、锚点和越界路径不会进入 Bundle。
  def resolve_local_reference(value, source_path, typora_root)
    decoded = URI.decode_www_form_component(value.to_s).split(/[?#]/, 2).first.to_s.strip
    return nil if decoded.empty? || decoded.start_with?('#')
    return nil if decoded.match?(/\A[a-z][a-z0-9+.-]*:/i)

    base = if decoded.start_with?('/')
             root_from_typora_setting(source_path, typora_root)
           else
             source_path.dirname
           end
    candidate = base.join(decoded.sub(%r{\A/+}, '')).cleanpath
    return nil unless within_project?(candidate)
    return nil if candidate.extname.casecmp('.md').zero?

    candidate
  rescue ArgumentError
    nil
  end

  # 解析 Typora 的 typora-root-url；未声明时以仓库根目录作为绝对引用根。
  def root_from_typora_setting(source_path, typora_root)
    value = typora_root.to_s.strip.sub(/\A(['"])(.*)\1\z/, '\\2')
    return @project_root if value.empty?

    source_path.dirname.join(value).cleanpath
  end

  # 只允许读取仓库内部文件。
  def within_project?(path)
    path.to_s == @project_root.to_s || path.to_s.start_with?("#{@project_root}/")
  end

  # 复制被 Markdown 引用的本地文件，并记录找不到的引用。
  def package_resource(source_path, document_relative_path)
    key = source_path.to_s
    return if @copied_resources[key]
    @copied_resources[key] = true
    unless source_path.file?
      @missing_resources << "#{document_relative_path} -> #{relative_path(source_path)}"
      return
    end
    relative = relative_path(source_path)
    return if excluded?(relative) || excluded_image_resource?(relative)

    copy_file(source_path, documents_root.join(relative))
  end

  # 创建父目录并保留文件时间戳复制。
  def copy_file(source, destination)
    FileUtils.mkdir_p(destination.dirname)
    FileUtils.copy_file(source, destination, true)
  end

  # 写入稳定排序、便于原生端解析的 JSON 清单。
  def write_manifest
    manifest = {
      schemaVersion: 1,
      projectName: @project_name,
      generatedAt: Time.now.iso8601,
      documents: @documents,
      missingResources: @missing_resources.uniq.sort
    }
    @output_bundle.join('manifest.json').open('w:UTF-8') do |file|
      file.write(JSON.pretty_generate(manifest))
    end
  end

  # 返回相对仓库根目录的 POSIX 路径。
  def relative_path(path)
    utf8_string(path.relative_path_from(@project_root).to_s, '相对路径')
  end

  # 返回 Bundle 内保存文档原目录结构的根目录。
  def documents_root
    @output_bundle.join('Documents')
  end
end

# 校验 Xcode 传入的三个固定参数并运行打包器。
def main(arguments)
  unless arguments.length == 3
    warn '用法：JobsMarkdownPackager.rb <项目根目录> <输出 Bundle> <项目名>'
    return 64
  end
  JobsMarkdownPackager.new(arguments[0], arguments[1], arguments[2]).run
  0
rescue StandardError => e
  warn "❌ Markdown 文档打包失败：#{e.message}"
  1
end

exit(main(ARGV))
