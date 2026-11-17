#!/usr/bin/env ruby
require 'digest'
require 'fileutils'
require 'shellwords'
require 'tmpdir'

root = File.expand_path('../../..', __dir__)
podfile = File.join(root, 'Podfile')
production = File.read(podfile)[/^def configure_zfplayer_public_ipv6_header\(target\)\n.*?^end\n/m]
abort 'Missing production ZFPlayer compatibility helper' unless production
eval(production, TOPLEVEL_BINDING, podfile)

checks = 0
check = lambda do |condition, message|
  abort message unless condition
  checks += 1
end
config = Struct.new(:build_settings)
target = Struct.new(:name, :build_configurations)
compatibility = '$(PODS_ROOT)/../JobsByPods/ZFPlayerExtra@Pods/Compatibility'
debug = config.new('CLANG_ENABLE_MODULES' => 'YES', 'OTHER_CFLAGS' => '$(inherited) -Werror')
release = config.new('HEADER_SEARCH_PATHS' => '$(inherited) "a path with spaces"')
selected = target.new('ZFPlayer', [debug, release])
2.times { configure_zfplayer_public_ipv6_header(selected) }
check.call(debug.build_settings['HEADER_SEARCH_PATHS'] == [compatibility, '$(inherited)'], 'Default paths or idempotence changed')
check.call(release.build_settings['HEADER_SEARCH_PATHS'] == [compatibility, '$(inherited)', 'a path with spaces'], 'Existing quoted paths were lost')
check.call(debug.build_settings['CLANG_ENABLE_MODULES'] == 'YES', 'Modules must stay enabled')
check.call(debug.build_settings['OTHER_CFLAGS'] == '$(inherited) -Werror', 'Diagnostics must remain unchanged')
other = target.new('OtherPod', [config.new('HEADER_SEARCH_PATHS' => ['original'])])
before = Marshal.dump(other.build_configurations.map(&:build_settings))
configure_zfplayer_public_ipv6_header(other)
check.call(Marshal.dump(other.build_configurations.map(&:build_settings)) == before, 'Another target was modified')

require File.join(root, 'ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_stability_sources.rb/jobs_stability_sources.rb')
relative = 'JobsByPods/ZFPlayerExtra@Pods/Compatibility/netinet6/in6.h'
check.call(JobsStabilitySources.paths(root).include?(File.join(root, relative)), 'Compatibility header is outside source freeze inputs')
Dir.mktmpdir('jobs-zf-source-freeze-') do |fixture|
  header = File.join(fixture, relative)
  FileUtils.mkdir_p(File.dirname(header))
  FileUtils.cp(File.join(root, relative), header)
  fingerprint = JobsStabilitySources.fingerprint(fixture, 'Xcode fixture', architecture: 'arm64')
  File.open(header, 'a') { |file| file.write("\n// changed input\n") }
  check.call(JobsStabilitySources.fingerprint(fixture, 'Xcode fixture', architecture: 'arm64') != fingerprint, 'Header changes must invalidate source freeze')
end
puts "PASS: #{checks} ZF-only public IPv6 compatibility and source-freeze checks"
