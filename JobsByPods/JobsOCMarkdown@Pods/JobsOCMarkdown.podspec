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
end
