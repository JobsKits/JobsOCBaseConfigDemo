#!/usr/bin/env ruby
# frozen_string_literal: true

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

require 'json'
require 'open3'
require 'pathname'
require 'set'

# 用途：按 Git 精确路径检查同步组逐项启用的源码，避免 MacOS 大小写不敏感掩盖云端漏编译。
# 运行：ruby 执行本文件，可传工程根目录；只读项目、Git 索引和文件，不调用安装或构建。
module JobsProjectMembership
  SOURCE_EXTENSIONS = %w[.m .mm .c .cc .cpp .cxx .swift].freeze
  PROJECT_PATH = 'JobsOCBaseConfigDemo.xcodeproj/project.pbxproj'.freeze

  def self.capture!(*command)
    output, error, status = Open3.capture3(*command)
    raise "#{command.first} 读取失败: #{error.strip}" unless status.success?

    output
  end

  def self.group_path(objects, identifier, parents, visiting = [])
    raise "同步组父链存在循环: #{identifier}" if visiting.include?(identifier)

    object = objects.fetch(identifier)
    tree = object.fetch('sourceTree', '<group>')
    raise "同步组路径无法按仓库解析: #{tree}" unless %w[<group> SOURCE_ROOT].include?(tree)

    parent = parents[identifier]
    prefix = tree == '<group>' && parent ? group_path(objects, parent, parents, visiting + [identifier]) : ''
    path = Pathname.new(prefix).join(object.fetch('path', '')).cleanpath.to_s
    raise "同步组路径越过仓库: #{path}" if Pathname.new(path).absolute? || path == '..' || path.start_with?('../')

    path == '.' ? '' : path
  end

  def self.source_members(project)
    objects = project.fetch('objects')
    parents = {}
    objects.each do |identifier, object|
      Array(object['children']).each { |child| parents[child] = identifier }
    end
    members = []
    objects.each do |group_id, group|
      next unless group['isa'] == 'PBXFileSystemSynchronizedRootGroup'

      prefix = group_path(objects, group_id, parents)
      Array(group['exceptions']).each do |exception_id|
        exception = objects.fetch(exception_id)
        next unless exception['isa'] == 'PBXFileSystemSynchronizedBuildFileExceptionSet'

        target = objects.fetch(exception.fetch('target'))
        # 根组默认不属于 target 时，这份清单才是逐项启用；自动包含组的清单代表排除项。
        next if Array(target['fileSystemSynchronizedGroups']).include?(group_id)

        Array(exception['membershipExceptions']).each do |relative|
          next if relative.start_with?('/Localized: ')
          next unless SOURCE_EXTENSIONS.include?(File.extname(relative).downcase)

          path = Pathname.new(prefix).join(relative).cleanpath.to_s
          raise "源码成员路径越过仓库: #{relative}" if Pathname.new(relative).absolute? || path == '..' || path.start_with?('../')

          members << { 'path' => path, 'target' => target.fetch('name') }
        end
      end
    end
    members.uniq
  end

  def self.validate(root, project, tracked_files)
    tracked = tracked_files.to_set
    folded = tracked_files.group_by(&:downcase)
    members = source_members(project)
    failures = members.map do |member|
      path = member.fetch('path')
      if !tracked.include?(path)
        candidates = folded.fetch(path.downcase, [])
        member.merge('reason' => candidates.empty? ? '源码成员未被 Git 精确跟踪' : '源码成员与 Git 路径大小写不一致',
                     'git_paths' => candidates)
      elsif !File.file?(File.join(root, path))
        member.merge('reason' => 'Git 已跟踪的源码成员在工作区缺失', 'git_paths' => [path])
      end
    end.compact
    { 'checked' => members.size, 'failures' => failures }
  end

  def self.run(root, output: $stdout, errors: $stderr)
    root = File.realpath(root)
    project = JSON.parse(capture!('/usr/bin/plutil', '-convert', 'json', '-o', '-', File.join(root, PROJECT_PATH)))
    tracked = capture!('git', '-C', root, 'ls-files', '-z', '--').force_encoding(Encoding::UTF_8).split("\0")
    result = validate(root, project, tracked)
    raise '未找到同步组逐项启用的源码成员，无法执行本工程门禁' if result.fetch('checked').zero?

    result.fetch('failures').each do |failure|
      errors.puts "FAIL #{failure.fetch('target')}: #{failure.fetch('reason')}"
      errors.puts "  项目路径: #{failure.fetch('path')}"
      errors.puts "  Git 路径: #{failure.fetch('git_paths').empty? ? '不存在' : failure.fetch('git_paths').join(', ')}"
    end
    output.puts "#{result.fetch('failures').empty? ? 'PASS' : 'FAIL'} #{result.fetch('checked')} explicit synchronized source memberships; #{result.fetch('failures').size} failures"
    result.fetch('failures').empty? ? 0 : 1
  rescue JSON::ParserError, KeyError, RuntimeError, SystemCallError => error
    errors.puts "FAIL 项目源码成员校验: #{error.message}"
    1
  end
end

if $PROGRAM_NAME == __FILE__
  abort '用法: ruby validate_membership.rb [工程根目录]' if ARGV.size > 1
  exit JobsProjectMembership.run(ARGV.first || File.expand_path('../../../..', __dir__))
end
