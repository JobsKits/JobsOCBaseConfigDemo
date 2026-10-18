#!/usr/bin/env ruby
# 只读保存 ReactiveObjC 的生成配置与宏头清单；所有诊断产物仅写入指定输出目录。
require 'digest'
require 'fileutils'
require 'json'
require 'pathname'

abort '用法：ruby record_reactiveobjc.rb PROJECT_ROOT OUTPUT_DIRECTORY' unless ARGV.size == 2
root = File.realpath(ARGV.fetch(0))
output = File.expand_path(ARGV.fetch(1))
project_path = File.join(root, 'Pods', 'Pods.xcodeproj')
project_file = File.join(project_path, 'project.pbxproj')
raise "Pods 工程不存在：#{project_file}" unless File.file?(project_file)

begin
  require 'xcodeproj'
rescue LoadError
  prefix = %w[/opt/homebrew /usr/local].find do |path|
    File.file?("#{path}/opt/ruby/bin/ruby") && File.directory?("#{path}/opt/cocoapods/libexec")
  end
  abort '需要已安装的 Xcodeproj；不会自动安装工具。' unless prefix
  exec({ 'GEM_HOME' => "#{prefix}/opt/cocoapods/libexec", 'GEM_PATH' => nil },
       "#{prefix}/opt/ruby/bin/ruby", __FILE__, *ARGV)
end

project = Xcodeproj::Project.open(project_path)
targets = project.targets.select { |target| target.name == 'ReactiveObjC' }
unless targets.size == 1 && targets.first.isa == 'PBXNativeTarget'
  raise 'Pods 工程中没有唯一的 ReactiveObjC native target'
end
target = targets.first
existing_parent = Pathname.new(output).ascend.find(&:exist?)
output = File.expand_path(Pathname.new(output).relative_path_from(existing_parent).to_s, existing_parent.realpath.to_s)
raise '诊断输出目录不能位于待诊断工程内' if output == root || output.start_with?(root + '/')
FileUtils.mkdir_p(output)
FileUtils.cp(project_file, File.join(output, 'project.pbxproj'))

configurations = target.build_configurations.each_with_index.map do |configuration, index|
  path = configuration.base_configuration_reference&.real_path&.expand_path&.to_s
  exists = path && File.file?(path)
  copied_name = "ReactiveObjC-config-#{index + 1}.xcconfig" if exists
  FileUtils.cp(path, File.join(output, copied_name)) if exists
  {
    'name' => configuration.name,
    'HEADER_SEARCH_PATHS' => configuration.build_settings['HEADER_SEARCH_PATHS'],
    'USE_HEADERMAP' => configuration.build_settings['USE_HEADERMAP'],
    'base_configuration' => path, 'base_configuration_exists' => !!exists,
    'copied_xcconfig' => copied_name
  }
end
macro_files = Dir.glob(File.join(root, 'Pods', 'ReactiveObjC', '**', '*')).select do |path|
  File.basename(path).downcase.include?('metamacros') && (File.file?(path) || File.symlink?(path))
end.sort.map do |path|
  {
    'path' => Pathname.new(path).relative_path_from(Pathname.new(root)).to_s,
    'exists' => File.file?(path),
    'sha256' => File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil
  }
end
header_macros = Array(target.headers_build_phase&.files).each_with_object([]) do |build_file, rows|
  reference = build_file.file_ref
  next unless reference && File.basename(reference.path.to_s).downcase.include?('metamacros')
  path = reference.real_path.expand_path.to_s
  rows << {
    'file_ref' => reference.path, 'real_path' => path,
    'exists' => File.file?(path),
    'sha256' => File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil
  }
end
record = {
  'root' => root, 'project' => project_file,
  'project_sha256' => Digest::SHA256.file(project_file).hexdigest,
  'target' => { 'name' => target.name, 'isa' => target.isa, 'uuid' => target.uuid },
  'configurations' => configurations, 'macro_files' => macro_files,
  'headers_phase' => target.headers_build_phase&.isa, 'headers_phase_macros' => header_macros
}
json = JSON.pretty_generate(record) + "\n"
File.write(File.join(output, 'reactiveobjc.json'), json)
puts json
