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

require 'fileutils'
require 'json'
require 'open3'
require 'rbconfig'
require 'tmpdir'
require_relative '../validate_membership.rb/validate_membership'

# 用途：在临时 Git 工程中验证同步组路径门禁，覆盖大小写、未跟踪、缺文件及非源码边界。
# 运行：ruby 执行本文件；只在临时仓库暂存夹具，不改业务索引，不安装依赖或执行 Xcode 构建。
checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end

Dir.mktmpdir('jobs-project-membership-') do |root|
  invoke = lambda do |*command|
    output, status = Open3.capture2e(*command, chdir: root)
    raise "夹具命令失败: #{command.inspect}\n#{output}" unless status.success?
    output
  end
  invoke.call('git', 'init', '-q')
  sources = [
    'App/计时器/JobsTImer/JobsTimer.m',
    'App/Controllers/JobsTabbarVC/JobsTabBarVC.mm',
    'App/NSObject/NSObject+image/NSObject+Image.m',
    'App/Swift Demo/Example.swift',
    'App/Native/Example.c',
    'App/Native/Example.cc',
    'App/Native/Example.cpp',
    'App/Native/Example.cxx'
  ]
  sources.each do |path|
    FileUtils.mkdir_p(File.dirname(File.join(root, path)))
    File.write(File.join(root, path), '// fixture source')
  end
  invoke.call('git', 'add', '--', *sources)
  tracked = invoke.call('git', 'ls-files', '-z').split("\0")
  project = {
    'objects' => {
      'root' => { 'isa' => 'PBXGroup', 'children' => ['app'] },
      'app' => { 'isa' => 'PBXFileSystemSynchronizedRootGroup', 'path' => 'App', 'sourceTree' => '<group>', 'exceptions' => ['members'] },
      'members' => { 'isa' => 'PBXFileSystemSynchronizedBuildFileExceptionSet', 'target' => 'target',
                     'membershipExceptions' => sources.map { |path| path.sub('App/', '') } },
      'target' => { 'isa' => 'PBXNativeTarget', 'name' => 'FixtureApp' }
    }
  }
  validate = lambda { |value| JobsProjectMembership.validate(root, value, tracked) }
  baseline = validate.call(project)
  assert.call(baseline.fetch('checked') == sources.size && baseline.fetch('failures').empty?, '精确 Git 路径或源码扩展未通过')

  [
    ['计时器/JobsTImer/JobsTimer.m', '计时器/JobsTimer/JobsTimer.m'],
    ['Controllers/JobsTabbarVC/JobsTabBarVC.mm', 'Controllers/JobsTabBarVC/JobsTabBarVC.mm'],
    ['NSObject/NSObject+image/NSObject+Image.m', 'NSObject/NSObject+Image/NSObject+Image.m']
  ].each do |original, wrong|
    altered = Marshal.load(Marshal.dump(project))
    altered['objects']['members']['membershipExceptions'].map! { |path| path == original ? wrong : path }
    failures = validate.call(altered).fetch('failures')
    assert.call(failures.size == 1 && failures.first.fetch('git_paths') == ['App/' + original], "大小写错误未指向 Git 原路径: #{wrong}")
  end

  untracked = 'App/Untracked/StillHere.m'
  FileUtils.mkdir_p(File.dirname(File.join(root, untracked)))
  File.write(File.join(root, untracked), '// deliberately untracked')
  altered = Marshal.load(Marshal.dump(project))
  altered['objects']['members']['membershipExceptions'] << untracked.sub('App/', '')
  failures = validate.call(altered).fetch('failures')
  assert.call(failures.size == 1 && failures.first.fetch('git_paths').empty?, '磁盘存在但未跟踪的源码被误接受')

  File.delete(File.join(root, sources.last))
  failures = validate.call(project).fetch('failures')
  assert.call(failures.size == 1 && failures.first.fetch('reason').include?('工作区缺失'), '已跟踪但工作区缺失的源码被误接受')
  File.write(File.join(root, sources.last), '// fixture source')

  altered = Marshal.load(Marshal.dump(project))
  altered['objects']['members']['membershipExceptions'].concat([
    'Resources/Absent.bundle', 'Resources/Absent.png', '/Localized: Locale/FalseSource.m', 'Headers/Absent.h'
  ])
  result = validate.call(altered)
  assert.call(result.fetch('checked') == sources.size && result.fetch('failures').empty?, '资源、头文件或 Localized 特殊路径误报')

  altered['objects']['target']['fileSystemSynchronizedGroups'] = ['app']
  assert.call(validate.call(altered).fetch('checked').zero?, '自动包含组的排除清单被误当启用源码')

  project_dir = File.join(root, 'JobsOCBaseConfigDemo.xcodeproj')
  FileUtils.mkdir_p(project_dir)
  File.write(File.join(project_dir, 'project.pbxproj'), JSON.generate(project))
  validator = File.expand_path('../validate_membership.rb/validate_membership.rb', __dir__)
  text, status = Open3.capture2e(RbConfig.ruby, validator, root)
  assert.call(status.success? && text.include?('PASS 8 explicit'), "真实 CLI 未能通过 Git/plutil 夹具: #{text}")
  project['objects']['members']['membershipExceptions'][0] = '计时器/JobsTimer/JobsTimer.m'
  File.write(File.join(project_dir, 'project.pbxproj'), JSON.generate(project))
  text, status = Open3.capture2e(RbConfig.ruby, validator, root)
  assert.call(!status.success? && text.include?('Git 路径: App/计时器/JobsTImer/JobsTimer.m'), "真实 CLI 未拒绝大小写错误: #{text}")

  altered = Marshal.load(Marshal.dump(project))
  altered['objects']['app']['path'] = '../Outside'
  File.write(File.join(project_dir, 'project.pbxproj'), JSON.generate(altered))
  text, status = Open3.capture2e(RbConfig.ruby, validator, root)
  assert.call(!status.success? && text.include?('越过仓库'), '真实 CLI 未拒绝越界同步组路径')
end


# 自动成员与传统 Pod Sources 也接受相同的 Git 精确路径门禁。
Dir.mktmpdir('jobs-project-membership-automatic-') do |root|
  source='App/Source/ExactName.m'
  vendor='JobsByPods/Fixture@Pods/Core/Source.m'
  [source,vendor].each do |path|
    FileUtils.mkdir_p(File.dirname(File.join(root,path)))
    File.write(File.join(root,path),'// fixture source')
  end
  tracked=[source,vendor]
  project={ 'objects'=>{
    'root'=>{'isa'=>'PBXGroup','children'=>['app']},
    'app'=>{'isa'=>'PBXFileSystemSynchronizedRootGroup','path'=>'App','sourceTree'=>'<group>','exceptions'=>['exclusions']},
    'exclusions'=>{'isa'=>'PBXFileSystemSynchronizedBuildFileExceptionSet','target'=>'target','membershipExceptions'=>[]},
    'target'=>{'isa'=>'PBXNativeTarget','name'=>'FixtureApp','fileSystemSynchronizedGroups'=>['app']}
  }}
  result=JobsProjectMembership.validate(root,project,tracked,include_automatic:true)
  assert.call(result.fetch('checked')==1 && result.fetch('failures').empty?, '自动包含组未校验实际源码')
  result=JobsProjectMembership.validate(root,project,tracked.map(&:downcase),include_automatic:true)
  assert.call(result.fetch('failures').length==1 && result.fetch('failures').first.fetch('reason').include?('大小写'), '自动包含组未保留Git大小写门禁')
  project['objects']['exclusions']['membershipExceptions']=['Source']
  assert.call(JobsProjectMembership.validate(root,project,tracked,include_automatic:true).fetch('checked').zero?, '自动包含组目录排除没有生效')

  pod_project={ 'objects'=>{
    'root'=>{'isa'=>'PBXGroup','children'=>['pod']},
    'pod'=>{'isa'=>'PBXGroup','path'=>'../JobsByPods/Fixture@Pods/Core','sourceTree'=>'<group>','children'=>['source']},
    'source'=>{'isa'=>'PBXFileReference','path'=>'Source.m','sourceTree'=>'<group>'},
    'build'=>{'isa'=>'PBXBuildFile','fileRef'=>'source'},
    'sources'=>{'isa'=>'PBXSourcesBuildPhase','files'=>['build']},
    'target'=>{'isa'=>'PBXNativeTarget','name'=>'Fixture','buildPhases'=>['sources']}
  }}
  result=JobsProjectMembership.validate(root,pod_project,tracked,source_root:'Pods',include_build_phases:true,only_roots:['JobsByPods/'])
  assert.call(result.fetch('checked')==1 && result.fetch('failures').empty?, 'Pod Sources相对根解析未通过')
  pod_project['objects']['source']['path']='source.m'
  result=JobsProjectMembership.validate(root,pod_project,tracked,source_root:'Pods',include_build_phases:true,only_roots:['JobsByPods/'])
  assert.call(result.fetch('failures').length==1 && result.fetch('failures').first.fetch('git_paths')==[vendor], 'Pod Sources大小写差异未指向Git真实路径')
  pod_project['objects']['source']['path']='Source.m'
  File.delete(File.join(root,vendor))
  result=JobsProjectMembership.validate(root,pod_project,tracked,source_root:'Pods',include_build_phases:true,only_roots:['JobsByPods/'])
  assert.call(result.fetch('failures').length==1 && result.fetch('failures').first.fetch('reason').include?('工作区缺失'), 'Pod Sources磁盘缺失未拒绝')
  pod_project['objects']['pod']['path']='../../Outside'
  rejected=false
  begin
    JobsProjectMembership.validate(root,pod_project,tracked,source_root:'Pods',include_build_phases:true)
  rescue RuntimeError => error
    rejected=error.message.include?('越过仓库')
  end
  assert.call(rejected,'Pod source root越界未拒绝')
end

puts "PASS #{checks} isolated project membership checks; no business index, installation or build changed"
