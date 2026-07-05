module JobsPodspecKitForJobsCountdownBtn
  STANDARD_EXCLUDE_FILES = [
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
    '*.7z'
  ].freeze

  module_function

  def build_support_context(podspec_dir:, support_dir: 'Support', support_dependencies: [])
    support_subspec_paths = Dir.exist?(File.join(podspec_dir, support_dir)) ? ['Support'] : []
    {
      :support_dir => support_dir,
      :support_dependencies => support_dependencies || [],
      :support_subspec_paths => support_subspec_paths
    }
  end

  def add_support_subspec(spec, support_context)
    support_dir = support_context[:support_dir]
    spec.subspec 'Support' do |ss|
      ss.header_mappings_dir = support_dir
      ss.source_files = "#{support_dir}/**/*.{h,m,mm}"
      ss.private_header_files = "#{support_dir}/**/*.h"
      (support_context[:support_dependencies] || []).each do |dependency_name|
        ss.dependency dependency_name
      end
    end
  end

  def add_dynamic_support_dependencies(subspec, spec, support_context)
    (support_context[:support_subspec_paths] || []).uniq.each do |support_subspec_path|
      subspec.dependency "#{spec.name}/#{support_subspec_path}"
    end
  end

  def apply_standard_exclude_files(spec, exclude_files = nil)
    spec.exclude_files = exclude_files || STANDARD_EXCLUDE_FILES
  end

  def apply_standard_xcconfig(spec)
    spec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited)',
      'HEADER_SEARCH_PATHS' => '$(inherited)'
    }
  end
end
