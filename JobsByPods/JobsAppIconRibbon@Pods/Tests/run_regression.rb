require 'tmpdir'
require 'fileutils'
require 'json'
require 'digest'
require 'open3'

pod_root = File.expand_path('..', __dir__)
source = File.join(pod_root, 'Scripts', 'JobsAppIconRibbonGenerator.swift')
fixture_image = File.expand_path('../JobsBlock@Pods/Resource/icon.png', pod_root)

Dir.mktmpdir('jobs-ribbon-regression-') do |root|
  executable = File.join(root, 'generator')
  output, status = Open3.capture2e('swiftc', source, '-o', executable)
  abort output unless status.success?
  input = File.join(root, 'AppIcon.appiconset')
  FileUtils.mkdir_p(input)
  FileUtils.cp(fixture_image, File.join(input, 'icon.png'))
  contents = { images: [{ filename: 'icon.png', idiom: 'universal', size: '1024x1024', scale: '1x' }], info: { version: 1, author: 'Jobs' } }
  File.write(File.join(input, 'Contents.json'), JSON.generate(contents))
  config = File.join(root, 'Ribbon.conf')
  generated = File.join(root, 'JobsAppIconRibbon-Debug.appiconset')
  write_config = lambda do |source_name, prefix|
    File.write(config, "SOURCE_APPICONSET=#{source_name}\nOUTPUT_NAME_PREFIX=#{prefix}\n")
  end
  run = lambda do
    Open3.capture2e(executable, '--project-root', root, '--config', config, '--configuration', 'Debug')
  end
  write_config.call('AppIcon.appiconset', 'JobsAppIconRibbon')
  2.times do
    output, status = run.call
    abort output unless status.success?
  end
  last_good = Digest::SHA256.file(File.join(generated, 'icon.png')).hexdigest
  File.write(File.join(input, 'Contents.json'), JSON.generate(contents.merge(images: contents[:images] + [{ filename: 'missing.png' }])))
  output, status = run.call
  abort 'Missing image must fail' if status.success?
  abort 'Failed render replaced last good output' unless last_good == Digest::SHA256.file(File.join(generated, 'icon.png')).hexdigest
  File.write(File.join(input, 'Contents.json'), JSON.generate(contents.merge(images: [{ filename: '../icon.png' }])))
  _, status = run.call
  abort 'Traversal must fail' if status.success?
  write_config.call('AppIcon.appiconset', '../escape')
  _, status = run.call
  abort 'Unsafe prefix must fail' if status.success?
  write_config.call('JobsAppIconRibbon-Debug.appiconset', 'JobsAppIconRibbon')
  _, status = run.call
  abort 'Input/output alias must fail' if status.success?
  abort 'Alias deleted input' unless File.exist?(File.join(generated, 'Contents.json'))
  abort 'Staging directories leaked' unless Dir.glob(File.join(root, '.JobsAppIconRibbon-*')).empty?
  puts 'PASS: first render, atomic replacement, missing image, traversal, unsafe prefix, alias, staging cleanup'
end
