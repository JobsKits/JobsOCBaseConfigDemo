#!/usr/bin/env ruby
# 核验两种安装合同及真实生成的模拟器依赖图；不下载依赖或修改第三方源码。
require 'json'
require 'optparse'

begin
  require 'cocoapods'
rescue LoadError
  prefix = %w[/opt/homebrew /usr/local].find do |path|
    File.file?("#{path}/opt/ruby/bin/ruby") && File.directory?("#{path}/opt/cocoapods/libexec")
  end
  abort '需要已安装 CocoaPods；不会自动安装工具。' unless prefix
  exec({ 'GEM_HOME' => "#{prefix}/opt/cocoapods/libexec", 'GEM_PATH' => nil },
       "#{prefix}/opt/ruby/bin/ruby", __FILE__, *ARGV)
end

# 每次重新解析真实 podspec，并恢复调用方原有安装模式。
def dependencies(path, mode)
  previous = ENV['JOBS_SIMULATOR_ONLY']
  ENV['JOBS_SIMULATOR_ONLY'] = mode
  Pod::Specification.from_file(path).dependencies.map(&:name)
ensure
  ENV['JOBS_SIMULATOR_ONLY'] = previous
end

root = File.expand_path('../../..', __dir__)
options = {}
OptionParser.new do |parser|
  parser.on('--installed-root PATH', '同时核验 pod install 后的锁文件和 Pods 工程') { |path| options[:installed_root] = File.expand_path(path) }
end.parse!
checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
%w[JobsByOCPods ZFPlayerExtra].each do |name|
  path = File.join(root, 'JobsByPods', "#{name}@Pods", "#{name}.podspec")
  regular = dependencies(path, nil)
  simulator = dependencies(path, '1')
  assert.call(regular.include?('ZFPlayer/ijkplayer'), "#{name}: default installation lost device IJK support")
  assert.call(!simulator.include?('ZFPlayer/ijkplayer'), "#{name}: Simulator installation still requires device IJK")
  %w[ZFPlayer/AVPlayer ZFPlayer/ControlView].each do |dependency|
    assert.call(regular.include?(dependency) && simulator.include?(dependency), "#{name}: lost #{dependency}")
  end
  assert.call((regular - simulator) == ['ZFPlayer/ijkplayer'] && (simulator - regular).empty?, "#{name}: unexpected dependency change")
end
if options[:installed_root]
  installed = options[:installed_root]
  lock = Pod::Lockfile.from_file(Pathname.new(File.join(installed, 'Podfile.lock')))
  assert.call(lock && !lock.pod_names.include?('IJKMediaFramework'), 'installed graph still contains IJKMediaFramework')
  entries = lock.to_hash.fetch('PODS').flat_map { |row| row.is_a?(Hash) ? row.keys : [row] }.map { |row| row.split(' ').first }
  assert.call(!entries.include?('ZFPlayer/ijkplayer'), 'installed graph still contains ZFPlayer/ijkplayer')
  assert.call(%w[ZFPlayer/AVPlayer ZFPlayer/ControlView].all? { |name| entries.include?(name) }, 'installed graph lost AVPlayer/ControlView')
  project = Xcodeproj::Project.open(File.join(installed, 'Pods', 'Pods.xcodeproj'))
  assert.call(project.root_object.isa == 'PBXProject', 'generated Pods project is invalid')
  assert.call(project.targets.none? { |target| target.name == 'IJKMediaFramework' }, 'generated project still builds IJK')
  player = project.targets.find { |target| target.name == 'ZFPlayer' }
  assert.call(player && player.source_build_phase.files_references.none? { |file| file.real_path.to_s.include?('/ijkplayer/') }, 'generated ZFPlayer still compiles IJK integration')
  umbrella = File.read(File.join(installed, 'Pods', 'Target Support Files', 'ZFPlayer', 'ZFPlayer-umbrella.h'))
  assert.call(!umbrella.include?('ZFIJKPlayerManager.h'), 'generated umbrella still imports IJK')
end
puts "Simulator Pod dependencies: #{checks} checks PASS"
