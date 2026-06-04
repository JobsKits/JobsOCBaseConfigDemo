require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCRuntimeKits.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  source_file_extensions = 'h,m,mm'
  resource_file_extensions = 'png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict'

  glob_pattern = lambda do |relative_path, recursive, extensions|
    recursive ? "#{relative_path}/**/*.{#{extensions}}" : "#{relative_path}/*.{#{extensions}}"
  end

  glob_exists = lambda do |pattern|
    Dir.glob(File.join(__dir__, pattern)).any?
  end

  has_pod_content = lambda do |relative_path, recursive|
    [
      glob_pattern.call(relative_path, recursive, source_file_extensions),
      glob_pattern.call(relative_path, recursive, resource_file_extensions)
    ].any? { |pattern| glob_exists.call(pattern) }
  end

  folder_subspec_names = lambda do |relative_path|
    absolute_path = File.join(__dir__, relative_path)

    next [] unless Dir.exist?(absolute_path)

    Dir.children(absolute_path).select do |name|
      child_path = File.join(absolute_path, name)
      next false unless File.directory?(child_path)
      next false if name.start_with?('.') || name.start_with?('__')

      has_pod_content.call("#{relative_path}/#{name}", true)
    end.sort
  end

  configure_files = lambda do |ss, relative_path, recursive|
    source_files = glob_pattern.call(relative_path, recursive, source_file_extensions)
    public_header_files = recursive ? "#{relative_path}/**/*.h" : "#{relative_path}/*.h"
    resources = glob_pattern.call(relative_path, recursive, resource_file_extensions)

    ss.source_files = source_files if glob_exists.call(source_files)
    ss.public_header_files = public_header_files if glob_exists.call(public_header_files)
    ss.resources = resources if glob_exists.call(resources)
  end

  collect_leaf_subspec_paths = nil
  collect_leaf_subspec_paths = lambda do |relative_path, pod_path|
    child_names = folder_subspec_names.call(relative_path)

    if child_names.empty?
      [pod_path]
    else
      child_names.flat_map do |subspec_name|
        collect_leaf_subspec_paths.call(
          "#{relative_path}/#{subspec_name}",
          "#{pod_path}/#{subspec_name}"
        )
      end
    end
  end

  support_dependency_paths = folder_subspec_names.call('Support').flat_map do |subspec_name|
    collect_leaf_subspec_paths.call(
      "Support/#{subspec_name}",
      "JobsOCRuntimeKits/Support/#{subspec_name}"
    )
  end

  add_support_dependencies = lambda do |ss|
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
  end

  build_nested_subspecs = nil
  build_nested_subspecs = lambda do |parent_spec, relative_path, pod_path|
    configure_files.call(parent_spec, relative_path, false)
    add_support_dependencies.call(parent_spec)

    folder_subspec_names.call(relative_path).each do |subspec_name|
      parent_spec.subspec subspec_name do |child_spec|
        build_nested_subspecs.call(
          child_spec,
          "#{relative_path}/#{subspec_name}",
          "#{pod_path}/#{subspec_name}"
        )
      end
    end
  end

  spec.name             = 'JobsOCRuntimeKits'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C runtime helper kits for Jobs projects.'
  spec.description      = <<-DESC
JobsOCRuntimeKits is a local Objective-C runtime utility library providing
dynamic invocation, runtime inspection, method swizzling, and NSValue helpers
for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsOCRuntimeKits'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.source_files = [
    'JobsOCRuntimeKits.h'
  ]

  spec.public_header_files = [
    'JobsOCRuntimeKits.h'
  ]

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsOCRuntimeKits.apply_standard_exclude_files(
    spec,
    [
      '**/.DS_Store',
      '**/._*',
      '__MACOSX/**/*',
      '.git/**/*',
      '.svn/**/*',
      'Pods/**/*',
      'Podfile',
      'Podfile.lock',
      '*.podspec',
      '*.xcodeproj/**/*',
      '*.xcworkspace/**/*',
      'DerivedData/**/*',
      'build/**/*',
      'Demo/**/*',
      'Demos/**/*',
      'Example/**/*',
      'Examples/**/*',
      'Sample/**/*',
      'Samples/**/*',
      'Test/**/*',
      'Tests/**/*',
      'UnitTests/**/*',
      'UITests/**/*',
      'README*',
      'CHANGELOG*',
      'LICENSE*',
      'Docs/**/*',
      'doc/**/*',
      'Documentation/**/*',
      'Screenshots/**/*',
      'Images/**/*',
      'fastlane/**/*',
      '.github/**/*',
      '.gitlab/**/*',
      '.circleci/**/*',
      '.travis.yml',
      'Jenkinsfile',
      'tmp/**/*',
      'temp/**/*',
      '.tmp/**/*',
      '.temp/**/*',
      '*.log',
      '*.bak',
      '*.swp',
      '*.zip',
      '*.tar',
      '*.tar.gz',
      '*.tgz',
      '*.rar',
      '*.7z',
      '*.mht'
    ]
  )
  JobsPodspecKitForJobsOCRuntimeKits.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsOCRuntimeKits.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets}'

    support_dependency_paths.each do |subspec_path|
      ss.dependency subspec_path
    end

    ss.dependency 'WHToastExtra'
    ss.dependency 'JobsModelDSL'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsClass'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsTimeUtils'
    ss.dependency 'JobsOCSnowflake'
    ss.dependency 'JobsRandomUtils'
    ss.dependency 'JobsOCProtocols'
    ss.dependency 'JobsLanMgr'

  end

  JobsPodspecKitForJobsOCRuntimeKits.apply_standard_xcconfig(spec)

end
