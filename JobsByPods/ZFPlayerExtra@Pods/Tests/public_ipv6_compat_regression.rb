#!/usr/bin/env ruby
require 'digest'
require 'fileutils'
require 'open3'
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
Dir.mktmpdir('jobs-zf-cold-modules-') do |fixture|
  sdk, error, status = Open3.capture3('xcrun', '--sdk', 'iphonesimulator', '--show-sdk-path')
  abort "Simulator SDK is required: #{error}" unless status.success?
  sdk = sdk.strip
  pch = File.join(fixture, 'Prefix.pch')
  source = File.join(fixture, 'ColdIPv6.m')
  File.write(pch, "#import <UIKit/UIKit.h>\n")
  File.write(source, <<~OBJC)
    //
    //  ColdIPv6.m
    //  ZFPlayerExtraTests
    //
    //  Created by Jobs on 2026年11月17日，星期二.
    //

    #import <netinet/in.h>
    #import <netinet6/in6.h>
    #import <UIKit/UIKit.h>
    _Static_assert(sizeof(struct in6_addr) == 16, "IPv6 declarations must remain complete");
  OBJC
  previous = File.join(fixture, 'previous', 'netinet6')
  FileUtils.mkdir_p(previous)
  File.write(File.join(previous, 'in6.h'), "#pragma once\n#include <netinet/in.h>\n")
  base = ['xcrun', '--sdk', 'iphonesimulator', 'clang', '-target', 'arm64-apple-ios16.6-simulator',
          '-isysroot', sdk, '-std=gnu11', '-fmodules', '-fobjc-arc', '-fblocks', '-fsyntax-only']
  compile = lambda do |label, header_path, optimization, prefix|
    cache = File.join(fixture, "cache-#{label}")
    command = base + [optimization, "-fmodules-cache-path=#{cache}"]
    command += ["-I#{header_path}"] if header_path
    command += ['-include', pch] if prefix
    output, error, status = Open3.capture3(*(command + [source]))
    [status.success?, output + error, cache]
  end
  success, output, = compile.call('original', nil, '-O0', true)
  check.call(!success && output.match?(/private header|do not include netinet6\/in6\.h/), 'Original private-header negative control did not fail as expected')
  success, output, = compile.call('previous', File.dirname(previous), '-O0', true)
  check.call(!success && output.include?("incomplete type 'struct in6_addr'"), 'Public-only shim no longer reproduces the cold Darwin failure')
  compatibility_path = File.join(root, 'JobsByPods/ZFPlayerExtra@Pods/Compatibility')
  { 'Debug' => '-O0', 'Release' => '-Os' }.each do |configuration, optimization|
    { 'pch-first' => true, 'public-first' => false }.each do |order, prefix|
      label = "#{configuration}-#{order}"
      success, output, cache = compile.call(label, compatibility_path, optimization, prefix)
      check.call(success && !Dir.glob(File.join(cache, '**', 'Darwin-*.pcm')).empty?, "#{label} cold module build failed: #{output}")
      success, output, = compile.call(label, compatibility_path, optimization, prefix)
      check.call(success, "#{label} warm module build failed: #{output}")
    end
  end
end
puts "PASS: #{checks} ZF-only configuration, source-freeze and actual cold/warm Darwin module checks"
