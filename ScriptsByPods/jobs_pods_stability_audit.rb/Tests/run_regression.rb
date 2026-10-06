#!/usr/bin/env ruby
# frozen_string_literal: true

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

require_relative '../jobs_pods_stability_audit'

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
