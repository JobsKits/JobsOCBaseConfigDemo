require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCMarkdown'
  spec.version          = '1.0.0'
  spec.summary          = 'Full local Markdown rendering for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCMarkdown renders trusted local Markdown through WKWebView. It supports
CommonMark/GFM content, raw HTML, project-relative resources, [toc], syntax
highlighting, Mermaid, KaTeX, task lists, callouts, dark mode and document links.
  DESC

  spec.homepage         = 'https://example.local/JobsOCMarkdown'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '15.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.header_dir       = 'JobsOCMarkdown'

  spec.source_files = [
    'JobsOCMarkdown.h',
    'Core/**/*.{h,m,mm}',
    'Support/Native/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCMarkdown.h',
    'Core/**/*.h'
  ]
  spec.private_header_files = [
    'Support/Native/**/*.h'
  ]
  spec.resource_bundles = {
    'JobsOCMarkdownResources' => ['Resource/**/*']
  }
  spec.preserve_paths = [
    'Support/JobsMarkdownPackager.rb',
    'ThirdPartyLicenses/*'
  ]
  spec.frameworks = [
    'Foundation',
    'UIKit',
    'WebKit'
  ]
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'Masonry'

  JobsPodspecKitForJobsOCMarkdown.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCMarkdown.apply_standard_xcconfig(spec)
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
