#!/usr/bin/env ruby
# frozen_string_literal: true

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
