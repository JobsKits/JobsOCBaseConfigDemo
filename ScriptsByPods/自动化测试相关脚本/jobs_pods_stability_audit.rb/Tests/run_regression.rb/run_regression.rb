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

require 'tmpdir'
require 'fileutils'
require 'json'
require 'digest'

begin
  require 'cocoapods'
rescue LoadError
  prefix = %w[/opt/homebrew /usr/local].find do |home|
    File.file?("#{home}/opt/ruby/bin/ruby") && File.directory?("#{home}/opt/cocoapods/libexec")
  end
  abort '需要已安装 CocoaPods；不会安装依赖。' unless prefix
  exec({ 'GEM_HOME' => "#{prefix}/opt/cocoapods/libexec", 'GEM_PATH' => nil },
       "#{prefix}/opt/ruby/bin/ruby", __FILE__)
end

require_relative '../../jobs_pods_stability_audit'

# 用途：在临时 Pod 工程验证源码所有权、目录、依赖及稳定性审计规则，不安装依赖或执行 Xcode 构建。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

def write_fixture(root, relative, content)
  path = File.join(root, relative)
  FileUtils.mkdir_p(File.dirname(path))
  File.write(path, content)
end

def header(filename)
  "//\n//  #{filename}\n//  JobsPodsAuditFixture\n//\n//  Created by Jobs on 2026年10月5日，星期一.\n//\n\n"
end

def specification(name, dependency = nil, resources = false)
  <<~RUBY
    Pod::Spec.new do |spec|
      spec.name = '#{name}'
      spec.version = '1.0.0'
      spec.summary = 'Temporary read-only audit regression fixture.'
      spec.homepage = 'https://example.invalid'
      spec.license = { type: 'MIT' }
      spec.author = 'Jobs'
      spec.source = { path: '.' }
      spec.platform = :ios, '12.0'
      spec.source_files = ['Core/**/*.{h,m}', 'Support/**/*.{h,m}']
      spec.public_header_files = 'Core/**/*.h'
      spec.private_header_files = 'Support/**/*.h'
      #{"spec.dependency '#{dependency}'" if dependency}
      #{"spec.resources = 'Resource/**/*'" if resources}
    end
  RUBY
end

def evaluate(root, baseline, expected_codes, label)
  baseline_path = File.join(root, 'baseline.json')
  output_path = File.join(root, 'output.json')
  File.write(baseline_path, JSON.pretty_generate(baseline))
  result = JobsPodsAudit.run(root: root, output: output_path, baseline: baseline_path)
  report = JSON.parse(File.read(output_path))
  actual = report['findings'].select { |entry| entry['status'] == 'failure' }.map { |entry| entry['code'] }.uniq.sort
  expected = expected_codes.sort
  raise "#{label}: expected #{expected}, got #{actual}" unless actual == expected
  raise "#{label}: wrong exit status #{result}" unless result == (expected.empty? ? 0 : 1)
  puts "PASS #{label}"
  report
end

Dir.mktmpdir('jobs-pods-stability-audit-') do |root|
  block = 'JobsByPods/JobsBlock@Pods'
  fixture = 'JobsByPods/Fixture@Pods'
  baseline = { 'expected_pods' => %w[Fixture JobsBlock], 'helpers' => {}, 'exceptions' => {} }
  write_fixture(root, "#{block}/JobsBlock.podspec", specification('JobsBlock'))
  write_fixture(root, "#{fixture}/Fixture.podspec", specification('Fixture'))
  write_fixture(root, "#{block}/Core/Owner.h", header('Owner.h') + '#import <Foundation/Foundation.h>')
  write_fixture(root, "#{block}/Core/Owner.m", header('Owner.m') + "#import \"Owner.h\"\n@implementation NSObject (FixtureOwner)\n- (id)byObjBlock { return nil; }\n@end\n")
  write_fixture(root, "#{fixture}/Core/Exported.h", header('Exported.h') + '#import <Foundation/Foundation.h>')
  write_fixture(root, "#{fixture}/Core/Exported.m", header('Exported.m') + "#import \"Exported.h\"\n")
  evaluate(root, baseline, [], 'clean actual CocoaPods fixture')

  write_fixture(root, "#{fixture}/Core/Exported.m", header('Exported.m') + "#import \"Exported.h\"\n@implementation NSObject (Duplicate)\n- (id)byObjBlock { return nil; }\n@end\n")
  evaluate(root, baseline, ['I01'], 'duplicate IMP blocks gate')
  write_fixture(root, "#{fixture}/Core/Exported.m", header('Exported.m') + "#import \"Exported.h\"\n")

  write_fixture(root, "#{block}/JobsBlock.podspec", specification('JobsBlock', 'Fixture'))
  write_fixture(root, "#{fixture}/Fixture.podspec", specification('Fixture', 'JobsBlock'))
  evaluate(root, baseline, ['D01'], 'dependency cycle blocks gate')
  write_fixture(root, "#{block}/JobsBlock.podspec", specification('JobsBlock'))
  write_fixture(root, "#{fixture}/Fixture.podspec", specification('Fixture'))

  write_fixture(root, "#{fixture}/Core/Other/Exported.h", header('Exported.h') + '#import <Foundation/Foundation.h>')
  evaluate(root, baseline, ['H01'], 'same-module public header collision blocks gate')
  File.delete(File.join(root, fixture, 'Core/Other/Exported.h'))

  aggregate_spec = specification('Fixture')
    .sub("spec.source_files = [", "spec.source_files = ['Fixture.h', ")
    .sub("spec.public_header_files = 'Core/**/*.h'", "spec.public_header_files = ['Fixture.h', 'Core/Exported.h']")
    .sub("spec.private_header_files = 'Support/**/*.h'", "spec.private_header_files = ['Support/**/*.h', 'Core/_FixtureEntry/*.h']")
  write_fixture(root, "#{fixture}/Fixture.h", header('Fixture.h') + "#import <Fixture/Exported+DSL.h>\n")
  write_fixture(root, "#{fixture}/Core/Exported+DSL/Exported+DSL.h", header('Exported+DSL.h') + "#import <Foundation/Foundation.h>\n")
  write_fixture(root, "#{fixture}/Core/_FixtureEntry/_FixtureEntry.h", header('_FixtureEntry.h') + "#import <Foundation/Foundation.h>\n")
  write_fixture(root, "#{fixture}/Core/_FixtureEntry/_FixtureEntry.m", header('_FixtureEntry.m') + "#import \"_FixtureEntry.h\"\n")
  write_fixture(root, "#{fixture}/Fixture.podspec", aggregate_spec)
  report = evaluate(root, baseline, ['H03'], 'root aggregate cannot import Project sibling DSL header')
  finding = report['findings'].find { |entry| entry['code'] == 'H03' }
  raise 'H03 must identify the sibling DSL Core header' unless finding.dig('evidence', 'targets', 0, 'path').end_with?('/Core/Exported+DSL/Exported+DSL.h')
  refused_baseline = Marshal.load(Marshal.dump(baseline))
  refused_baseline['exceptions'][finding['id']] = { 'key' => finding['key'], 'reason' => 'An export omission cannot be baseline debt.' }
  evaluate(root, refused_baseline, ['H03'], 'public Core export omission cannot be baselined')
  public_dsl_spec = aggregate_spec.sub("'Core/Exported.h']", "'Core/Exported.h', 'Core/Exported+DSL/*.h']")
  write_fixture(root, "#{fixture}/Fixture.podspec", public_dsl_spec)
  report = evaluate(root, baseline, [], 'public sibling DSL passes while implementation-only Entry stays private')
  fixture_row = report['pods'].find { |entry| entry['name'] == 'Fixture' }
  entry_header = "#{fixture}/Core/_FixtureEntry/_FixtureEntry.h"
  raise 'internal Entry must remain private' unless fixture_row['private_headers'].include?(entry_header) && !fixture_row['public_headers'].include?(entry_header)
  write_fixture(root, "#{fixture}/Fixture.h", header('Fixture.h') + "/*\n#import <Fixture/_FixtureEntry.h>\n*/\n#import <Fixture/Exported+DSL.h>\n")
  evaluate(root, baseline, [], 'commented private import is not an aggregate contract')
  write_fixture(root, "#{fixture}/Fixture.h", header('Fixture.h') + "#import <Fixture/_FixtureEntry.h>\n")
  evaluate(root, baseline, ['H03'], 'root aggregate cannot publish a private Core Entry import')
  write_fixture(root, "#{fixture}/Support/_FixtureEntry.h", header('_FixtureEntry.h') + "#import <Foundation/Foundation.h>\n")
  public_support_spec = public_dsl_spec
    .sub("'Core/Exported+DSL/*.h']", "'Core/Exported+DSL/*.h', 'Support/_FixtureEntry.h']")
    .sub("spec.private_header_files = ['Support/**/*.h', 'Core/_FixtureEntry/*.h']", "spec.private_header_files = 'Core/_FixtureEntry/*.h'")
  write_fixture(root, "#{fixture}/Fixture.podspec", public_support_spec)
  evaluate(root, baseline, [], 'explicit public Support export is not mistaken for a private Core import')
  File.delete(File.join(root, fixture, 'Support/_FixtureEntry.h'))
  FileUtils.rm_r(File.join(root, fixture, 'Core/Exported+DSL'))
  FileUtils.rm_r(File.join(root, fixture, 'Core/_FixtureEntry'))
  File.delete(File.join(root, fixture, 'Fixture.h'))
  write_fixture(root, "#{fixture}/Fixture.podspec", specification('Fixture'))

  write_fixture(root, "#{fixture}/Support/Internal.h", header('Internal.h') + '#import <Foundation/Foundation.h>')
  write_fixture(root, "#{fixture}/Core/Exported.h", header('Exported.h') + "#import \"Internal.h\"\n")
  report = evaluate(root, baseline, ['H02'], 'new Core to private Support boundary blocks gate')
  finding = report['findings'].find { |entry| entry['code'] == 'H02' }
  baseline['exceptions'][finding['id']] = { 'key' => finding['key'], 'reason' => 'Temporary existing fixture boundary, reviewed explicitly.' }
  evaluate(root, baseline, [], 'exact reviewed structural baseline accepted')
  write_fixture(root, "#{fixture}/Support/NewInternal.h", header('NewInternal.h') + '#import <Foundation/Foundation.h>')
  write_fixture(root, "#{fixture}/Core/Exported.h", header('Exported.h') + "#import \"Internal.h\"\n#import \"NewInternal.h\"\n")
  evaluate(root, baseline, ['H02'], 'baseline does not absorb a new private import')
  write_fixture(root, "#{fixture}/Core/Exported.h", header('Exported.h') + '#import <Foundation/Foundation.h>')

  write_fixture(root, "#{block}/JobsBlock.podspec", specification('JobsBlock', nil, true))
  write_fixture(root, "#{fixture}/Fixture.podspec", specification('Fixture', nil, true))
  write_fixture(root, "#{block}/Resource/config.json", '{"pod":"JobsBlock"}')
  write_fixture(root, "#{fixture}/Resource/config.json", '{"pod":"Fixture"}')
  evaluate(root, baseline, ['R01'], 'different resource bytes with same output name block gate')
  write_fixture(root, "#{fixture}/Resource/config.json", '{"pod":"JobsBlock"}')
  evaluate(root, baseline, [], 'identical shared resource is informational')

  write_fixture(root, "#{fixture}/JobsPodspecKit.rb", 'module JobsPodspecKitForFixture; end')
  evaluate(root, baseline, ['K01'], 'new helper requires fingerprint review')
  helper_path = "#{fixture}/JobsPodspecKit.rb"
  normalized = File.read(File.join(root, helper_path)).gsub(/JobsPodspecKitFor\w+/, 'JobsPodspecKitForPOD')
  baseline['helpers'][helper_path] = { 'normalized_sha256' => Digest::SHA256.hexdigest(normalized) }
  evaluate(root, baseline, [], 'reviewed helper fingerprint accepted')
  write_fixture(root, helper_path, 'module JobsPodspecKitForFixture; def self.changed; true; end; end')
  evaluate(root, baseline, ['K01'], 'changed helper fingerprint blocks gate')
  File.delete(File.join(root, helper_path))
  evaluate(root, baseline, ['K02'], 'deleted reviewed helper requires explicit migration review')
  baseline['helpers'].clear
  privacy_path = File.join(root, fixture, 'Resource/PrivacyInfo.xcprivacy')
  plist = {
    'NSPrivacyTracking' => false,
    'NSPrivacyCollectedDataTypes' => [],
    'NSPrivacyAccessedAPITypes' => [{
      'NSPrivacyAccessedAPIType' => 'NSPrivacyAccessedAPICategoryUserDefaults',
      'NSPrivacyAccessedAPITypeReasons' => ['35F9.1']
    }]
  }
  Xcodeproj::Plist.write_to_path(plist, privacy_path)
  evaluate(root, baseline, ['V01'], 'reason belonging to a different API category blocks gate')
  plist['NSPrivacyAccessedAPITypes'][0]['NSPrivacyAccessedAPITypeReasons'] = ['CA92.1']
  Xcodeproj::Plist.write_to_path(plist, privacy_path)
  evaluate(root, baseline, [], 'valid declared reason and actual resource coverage accepted')
  write_fixture(root, "#{fixture}/Fixture.podspec", specification('Fixture'))
  evaluate(root, baseline, ['V02'], 'manifest omitted from production resources blocks gate')
  File.delete(privacy_path)
  write_fixture(root, "#{fixture}/Core/Exported.m", header('Exported.m') + "#import \"Exported.h\"\nvoid candidate(void) { [NSProcessInfo processInfo].systemUptime; }\n")
  evaluate(root, baseline, ['V03'], 'unexplained required-reason API candidate blocks gate')

end
