# 共享源码枚举，区分原始输入与构建时重建的环境图标，供 runner 和结果回填使用。
require 'digest'

module JobsStabilitySources
  SOURCE_EXTENSIONS = 'h,m,mm,c,cc,cpp,hpp,swift,podspec,xcconfig,xcprivacy,xib,storyboard,rb,sh,json,plist,entitlements,png,jpg,jpeg,gif,webp,svg,pdf,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff'.freeze

  # 仅识别配置实际指定的 Debug / Release 派生目录；原始 AppIcon 始终保留。
  def self.generated_icon_sets(root)
    config = File.join(root, 'JobsAppIconRibbon.config')
    return [] unless File.file?(config)

    values = File.read(config, encoding: 'UTF-8').each_line.each_with_object({}) do |line, result|
      text = line.strip
      next if text.empty? || text.start_with?('#') || !text.include?('=')

      key, value = text.split('=', 2).map(&:strip)
      value = value[1...-1] if value.length >= 2 && ((value.start_with?('"') && value.end_with?('"')) || (value.start_with?("'") && value.end_with?("'")))
      result[key] = value
    end
    source = values['SOURCE_APPICONSET']
    return [] if source.nil? || source.empty?

    prefix = values.fetch('OUTPUT_NAME_PREFIX', '')
    prefix = 'JobsAppIconRibbon' if prefix.empty?
    return [] unless prefix.match?(/\A[A-Za-z0-9_-]+\z/)

    source = File.expand_path(source, root)
    return [] unless source.start_with?(root + '/') && File.extname(source) == '.appiconset'

    %w[Debug Release].map do |configuration|
      File.join(File.dirname(source), "#{prefix}-#{configuration}.appiconset")
    end.reject { |path| path == source || File.symlink?(path) }
  end

  # 每次重新枚举，真实源码、配置、原始资源的增删和内容变化均使缓存失效。
  def self.paths(root)
    root = File.expand_path(root)
    folders = Dir.glob(File.join(root, 'JobsByPods', '*@Pods')).reject do |path|
      File.basename(path).start_with?('ManualBy')
    end
    folders += %w[JobsOCBaseConfigDemo Tests].map { |path| File.join(root, path) }
    files = folders.flat_map do |folder|
      Dir.glob(File.join(folder, '**', "*.{#{SOURCE_EXTENSIONS}}"))
    end
    files += %w[Podfile Podfile.deps Podfile.lock JobsAppIconRibbon.config JobsOCBaseConfigDemo.xcodeproj/project.pbxproj Pods/Pods.xcodeproj/project.pbxproj ScriptsByPods/jobs_pods_stability_audit.rb/baseline.json].map do |path|
      File.join(root, path)
    end
    files += Dir.glob(File.join(root, 'ScriptsByPods', 'jobs_pods_stability_{verify,audit}.rb', '**', '*.rb'))
    files += Dir.glob(File.join(root, 'Pods', 'Target Support Files', '**', '*.{xcconfig,pch,plist,sh,xcfilelist,modulemap,h,m}'))
    generated = generated_icon_sets(root)
    files.uniq.sort.select do |path|
      File.file?(path) && generated.none? { |folder| path.start_with?(folder + '/') }
    end
  end

  # 架构参与缓存身份，单架构 CI 记录不能冒充默认双架构编译结果。
  def self.fingerprint(root, xcode_version, architecture: nil)
    raise '不支持的构建架构' unless architecture.nil? || %w[arm64 x86_64].include?(architecture)

    digest = Digest::SHA256.new
    paths(root).each do |path|
      digest << path.delete_prefix(root) << "\0" << File.binread(path)
    end
    digest << xcode_version << "\0architecture\0" << (architecture || 'all')
    digest.hexdigest
  end
end
