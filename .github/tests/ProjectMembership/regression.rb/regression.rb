#!/usr/bin/env ruby
# frozen_string_literal: true

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

puts "PASS #{checks} isolated project membership checks; no business index, installation or build changed"
