#!/usr/bin/env ruby
# clang真正生成Simulator Mach-O，验证权限来自二进制全部架构；不启动iOS或xcodebuild。
require 'fileutils'
require 'json'
require 'open3'
require 'tmpdir'
require_relative '../jobs_stability_host_entitlements'

# 失败立即退出，保留系统工具的真实诊断。
def assert(condition, message)
  raise message unless condition
end

# 执行fixture编译/读取工具，任何实际失败均不当作成功。
def run_tool(*command)
  output, error, status = Open3.capture3(*command)
  raise "#{command.inspect} failed (#{status.exitstatus}): #{output}\n#{error}" unless status.success?
  output.strip
end

# 真实clang链接Simulator executable，刻意不附加codesign签名。
def build_binary(folder, name, architecture, plist: nil)
  source = File.join(folder, 'main.c')
  File.write(source, "int main(void) { return 0; }\n") unless File.exist?(source)
  binary = File.join(folder, name)
  command = [$fixture_clang, '-target', "#{architecture}-apple-ios16.6-simulator", '-isysroot', $fixture_sdk,
    source, '-o', binary, '-Wl,-no_adhoc_codesign']
  if plist
    path = File.join(folder, name + '.plist')
    File.write(path, plist)
    command << "-Wl,-sectcreate,__TEXT,__entitlements,#{path}"
  end
  run_tool(*command)
  binary
end

# fixture生成数据与audit实现无关：只声明预期的宿主权限值。
def entitlement_xml(identifier, empty: false)
  content = empty ? '' : <<~XML
    <key>application-identifier</key><string>#{identifier}</string>
    <key>keychain-access-groups</key><array><string>#{identifier}</string></array>
    <key>get-task-allow</key><true/>
  XML
  '<?xml version="1.0" encoding="UTF-8"?><plist version="1.0"><dict>' + content + '</dict></plist>'
end

# 每个arch独立检查，防止只读取fat首片就接受整个宿主。
def assert_valid(result, architectures)
  assert(result['valid'], JSON.pretty_generate(result))
  assert(result.fetch('architectures').map { |row| row['architecture'] }.sort == architectures.sort, 'architecture coverage differs')
  assert(result['architectures'].all? { |row| row['valid'] && row['section']['size'].positive? }, 'compiled section proof missing')
end

# 负向结果必须保留具体架构诊断，而不是仅返回空字典。
def assert_invalid(result, text = nil)
  assert(!result['valid'], 'invalid compiled permissions accepted')
  errors = ([result['error']] + result['architectures'].map { |row| row['error'] }).compact.join('\n')
  assert(!errors.empty?, 'invalid compiled permissions lost error evidence')
  assert(errors.include?(text), "missing error #{text}: #{errors}") if text
end

$fixture_clang = run_tool('/usr/bin/xcrun', '--sdk', 'iphonesimulator', '--find', 'clang')
$fixture_sdk = run_tool('/usr/bin/xcrun', '--sdk', 'iphonesimulator', '--show-sdk-path')
identifier = 'org.jobs.StabilityFixture'
passed = 0
Dir.mktmpdir('jobs-host-entitlements-regression-') do |folder|
  arm64 = build_binary(folder, 'valid-arm64', 'arm64', plist: entitlement_xml(identifier))
  x86 = build_binary(folder, 'valid-x86_64', 'x86_64', plist: entitlement_xml(identifier))
  _, _, thin_signature = Open3.capture3('/usr/bin/codesign', '--verify', '--strict', arm64)
  assert(!thin_signature.success?, 'permission extractor must be tested independently of a valid code signature')
  assert_valid(JobsStabilityHostEntitlements.audit(arm64, bundle_identifier: identifier), ['arm64'])
  puts 'PASS real unsigned thin Simulator binary contains valid compiled entitlement bytes'
  passed += 1

  fat = File.join(folder, 'valid-fat')
  run_tool('/usr/bin/lipo', '-create', arm64, x86, '-output', fat)
  assert_valid(JobsStabilityHostEntitlements.audit(fat, bundle_identifier: identifier), %w[arm64 x86_64])
  puts 'PASS real fat Simulator binary validates every architecture'
  passed += 1

  missing = build_binary(folder, 'missing', 'arm64')
  # 相邻源权限文件存在不能使缺少compiled section的executable通过。
  File.write(missing + '.xcent', entitlement_xml(identifier))
  _, _, signature = Open3.capture3('/usr/bin/codesign', '--verify', '--strict', missing)
  assert(!signature.success?, 'unsigned fixture unexpectedly has a valid signature')
  assert_invalid(JobsStabilityHostEntitlements.audit(missing, bundle_identifier: identifier), 'exactly one __TEXT,__entitlements')
  puts 'PASS actual unsigned binary without section rejects adjacent xcent source proof'
  passed += 1

  empty = build_binary(folder, 'empty', 'arm64', plist: entitlement_xml(identifier, empty: true))
  assert_invalid(JobsStabilityHostEntitlements.audit(empty, bundle_identifier: identifier), 'do not match')
  puts 'PASS compiled empty dictionary is rejected'
  passed += 1

  wrong = build_binary(folder, 'wrong-x86_64', 'x86_64', plist: entitlement_xml('org.jobs.WrongHost'))
  assert_invalid(JobsStabilityHostEntitlements.audit(wrong, bundle_identifier: identifier), 'do not match')
  puts 'PASS compiled wrong bundle identifier is rejected'
  passed += 1

  mixed = File.join(folder, 'mixed-fat')
  run_tool('/usr/bin/lipo', '-create', arm64, wrong, '-output', mixed)
  mixed_result = JobsStabilityHostEntitlements.audit(mixed, bundle_identifier: identifier)
  assert_invalid(mixed_result, 'do not match')
  assert(mixed_result['architectures'].count { |row| row['valid'] } == 1, 'mixed fat architecture isolation not proven')
  puts 'PASS valid first architecture cannot hide invalid sibling architecture'
  passed += 1

  malformed = build_binary(folder, 'malformed', 'arm64', plist: 'not a property list')
  assert_invalid(JobsStabilityHostEntitlements.audit(malformed, bundle_identifier: identifier), 'plutil failed')
  puts 'PASS actual compiled non-plist section is rejected'
  passed += 1

  beyond = File.join(folder, 'out-of-bounds')
  bytes = File.binread(arm64)
  record = bytes.index('__entitlements'.ljust(16, "\0"))
  assert(record, 'real section_64 fixture record missing')
  # Apple section_64布局中offset位于记录+48；修改实际load-command，不伪造otool输出。
  bytes[record + 48, 4] = [bytes.bytesize + 4096].pack('V')
  File.binwrite(beyond, bytes)
  beyond_result = JobsStabilityHostEntitlements.audit(beyond, bundle_identifier: identifier)
  assert_invalid(beyond_result)
  assert(beyond_result['architectures'].all? { |row| !row.key?('entitlements') }, 'out-of-bounds section was read as permissions')
  puts 'PASS actual Mach-O section offset beyond EOF is rejected'
  passed += 1

  assert_invalid(JobsStabilityHostEntitlements.audit(File.join(folder, 'does-not-exist'), bundle_identifier: identifier), 'readable file')
  assert_invalid(JobsStabilityHostEntitlements.audit(nil, bundle_identifier: identifier))
  puts 'PASS missing/non-path input is rejected without source fallback'
  passed += 1
end

# 当前任务真正生成的signed宿主，两架构提取必须与Info.plist标识一致。
root = File.expand_path('../../..', __dir__)
app = File.join(root, 'work', 'JobsPodsStability', 'full', 'Products', 'Debug-iphonesimulator', 'AppHost-JobsBaseUI-Unit-Tests.app')
binary = ARGV.first || File.join(app, 'AppHost-JobsBaseUI-Unit-Tests')
bundle_identifier = run_tool('/usr/bin/plutil', '-extract', 'CFBundleIdentifier', 'raw', '-o', '-', File.join(File.dirname(binary), 'Info.plist'))
actual = JobsStabilityHostEntitlements.audit(binary, bundle_identifier: bundle_identifier)
assert_valid(actual, run_tool('/usr/bin/lipo', '-archs', binary).split)
puts "PASS real task AppHost compiled permissions (#{actual['architectures'].map { |row| row['architecture'] }.join(',')})"
passed += 1
puts JSON.pretty_generate(actual)
puts "#{passed} real-Mach-O scenarios passed; no Xcode build/install or iOS launch executed."
