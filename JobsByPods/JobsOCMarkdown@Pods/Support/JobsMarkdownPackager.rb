#!/usr/bin/env ruby
# frozen_string_literal: true

# Xcode 非交互构建工具：把仓库内 Jobs 自有 Markdown 与其本地资源打入固定 Bundle。

require 'digest'
require 'fileutils'
require 'json'
require 'pathname'
require 'time'
require 'uri'

class JobsMarkdownPackager
  OUTPUT_BUNDLE_NAME = 'JobsMarkdownDocuments.bundle'
  EXCLUDED_COMPONENTS = [
    '.git',
    '.codegraph',
    '.dart_tool',
    '.build',
    '.DerivedDataUnity',
    'Pods',
    'node_modules',
    'build',
    'DerivedData',
    'PodspecDependencyReport',
    'Unity'
  ].freeze
  EXCLUDED_PREFIXES = [
    'JobsByPods/ManualByOCPods@Pods',
    'JobsByPods/ManualBySwiftPods@Pods',
    'JobsByPods/PodsManual'
  ].freeze

  def initialize(project_root, output_bundle, project_name)
    @project_root = Pathname(project_root).expand_path.cleanpath
    @output_bundle = Pathname(output_bundle).expand_path.cleanpath
    @project_name = project_name.to_s.empty? ? @project_root.basename.to_s : project_name.to_s
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
       .map { |path| Pathname(path) }
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
    return if excluded?(relative)

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
    @output_bundle.join('manifest.json').write(JSON.pretty_generate(manifest))
  end

  # 返回相对仓库根目录的 POSIX 路径。
  def relative_path(path)
    path.relative_path_from(@project_root).to_s
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
