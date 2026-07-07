module JobsPodspecKitForJobsWallet
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
    '*.7z'
  ].freeze

  module_function

  def build_support_context(podspec_dir:, support_dir: 'Support', support_dependencies: [])
    {
      :podspec_dir => podspec_dir,
      :support_dir => support_dir,
      :support_dependencies => support_dependencies || []
    }
  end

  def add_support_subspec(spec, support_context)
    support_dir = support_context[:support_dir]
    podspec_dir = support_context[:podspec_dir]
    return unless Dir.exist?(File.join(podspec_dir, support_dir))

    spec.subspec 'Support' do |ss|
      ss.header_mappings_dir = support_dir
      ss.source_files = "#{support_dir}/**/*.{h,m,mm}"
      ss.private_header_files = "#{support_dir}/**/*.h"
      ss.resources = "#{support_dir}/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}"
      support_context[:support_dependencies].each do |dependency_name|
        ss.dependency dependency_name
      end
    end
  end

  def apply_standard_exclude_files(spec)
    spec.exclude_files = STANDARD_EXCLUDE_FILES
  end

  def standard_pod_target_xcconfig
    {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end

  def standard_user_target_xcconfig(pod_name)
    {
      'HEADER_SEARCH_PATHS' => "$(inherited) \"$(PODS_ROOT)/Headers/Public/#{pod_name}/**\""
    }
  end

  def apply_standard_xcconfig(spec, pod_target_xcconfig: standard_pod_target_xcconfig, user_target_xcconfig: standard_user_target_xcconfig(spec.name))
    spec.pod_target_xcconfig = pod_target_xcconfig
    spec.user_target_xcconfig = user_target_xcconfig
  end
end
