#!/usr/bin/env ruby
# frozen_string_literal: true

# 只读求值本地 Pod 配置；只有 JSON 报告由本脚本写入。
require 'json'
require 'digest'
require 'optparse'
require 'pathname'
require 'time'

original_arguments = ARGV.dup

options = {
  root: File.expand_path('../..', __dir__),
  output: File.join(__dir__, 'audit.json'),
  baseline: File.join(__dir__, 'baseline.json')
}
OptionParser.new do |parser|
  parser.banner = 'ruby jobs_pods_stability_audit.rb [--root PROJECT] [--output JSON|-] [--baseline JSON]'
  parser.on('--root PATH', '工程根目录；不扫描 Manual/Pods/vendor') { |value| options[:root] = File.expand_path(value) }
  parser.on('--output PATH', 'JSON 输出位置；- 表示标准输出') { |value| options[:output] = value }
  parser.on('--baseline PATH', '显式、人工审阅的现存例外清单') { |value| options[:baseline] = value }
end.parse!

begin
  require 'cocoapods'
rescue LoadError
  # Homebrew pod 的 Ruby/Gem 环境与系统 Ruby 分开；复用已安装环境，不安装 Gem。
  homes = %w[/opt/homebrew /usr/local]
  prefix = homes.find { |home| File.file?("#{home}/opt/ruby/bin/ruby") && File.directory?("#{home}/opt/cocoapods/libexec") }
  if prefix && ENV['JOBS_PODS_AUDIT_BOOTSTRAP'] != '1'
    gem_root = "#{prefix}/opt/cocoapods/libexec"
    exec({ 'GEM_HOME' => gem_root, 'GEM_PATH' => nil, 'JOBS_PODS_AUDIT_BOOTSTRAP' => '1' },
         "#{prefix}/opt/ruby/bin/ruby", __FILE__, *original_arguments)
  end
  warn '未找到可用 CocoaPods Ruby 环境；不会自动安装。请使用运行 pod 的 Ruby/GEM_HOME。'
  exit 2
end

module JobsPodsAudit
  module_function

  WATCHED = {
    ['NSObject', 'byObjBlock'] => 'JobsBlock',
    ['NSString', 'isExpired'] => 'JobsTimeUtils',
    ['NSString', 'chinaTime'] => 'JobsModel',
    ['NSString', 'readableTimeByFormatter'] => 'JobsTimeUtils',
    ['NSString', 'timeStampByTimeFormatter:timeZoneType:intervalStyle:'] => 'JobsModel'
  }.freeze
  # Apple NSPrivacyAccessedAPIType 的 2026-10-05 本地校验快照；用途是否符合仍须人工审阅。
  REASONS = {
    'NSPrivacyAccessedAPICategoryFileTimestamp' => %w[DDA9.1 C617.1 3B52.1 0A2A.1],
    'NSPrivacyAccessedAPICategorySystemBootTime' => %w[35F9.1 8FFB.1 3D61.1],
    'NSPrivacyAccessedAPICategoryDiskSpace' => %w[85F4.1 E174.1 7D9E.1 B728.1],
    'NSPrivacyAccessedAPICategoryActiveKeyboards' => %w[3EC4.1 54BD.1],
    'NSPrivacyAccessedAPICategoryUserDefaults' => %w[CA92.1 1C8F.1 C56D.1 AC6B.1]
  }.freeze
  API_CANDIDATES = {
    'NSPrivacyAccessedAPICategoryUserDefaults' => /\b(?:NSUserDefaults|CFPreferences\w*)\b/,
    'NSPrivacyAccessedAPICategorySystemBootTime' => /\b(?:systemUptime|mach_absolute_time)\b/,
    'NSPrivacyAccessedAPICategoryFileTimestamp' => /\b(?:NSFileModificationDate|NSFileCreationDate|NSURLContentModificationDateKey|NSURLCreationDateKey|fileModificationDate|stat|fstat|fstatat|lstat|getattrlist\w*)\b/,
    'NSPrivacyAccessedAPICategoryDiskSpace' => /\b(?:NSURLVolumeAvailableCapacity\w*Key|NSURLVolumeTotalCapacityKey|NSFileSystemFreeSize|NSFileSystemSize|statfs|statvfs|fstatfs|fstatvfs)\b/,
    'NSPrivacyAccessedAPICategoryActiveKeyboards' => /\bactiveInputModes\b/
  }.freeze
  SKIP_COMPONENTS = /(?:\A|\/)(?:Pods|ManualBy[^\/]*Pods@Pods|PodsManual|vendor|Vendor|node_modules|\.git|build|DerivedData)(?:\/|\z)/

  def relative(path)
    Pathname(path).expand_path.relative_path_from(@root).to_s
  end

  def excluded?(path)
    path.to_s.match?(SKIP_COMPONENTS) || path.to_s.include?('Manual_Add_ThirdParty')
  end

  def issue(code, key, message, evidence = {})
    @issues << { id: "#{code}:#{Digest::SHA256.hexdigest(key)[0, 20]}", code: code,
                 key: key, message: message, evidence: evidence }
  end

  def jobs_owned?(path)
    return false if excluded?(path)
    # 与 Jobs 所属边界保持一致：路径显示上游/手工第三方时，不能靠批量文件头接管。
    ownership_exclusions = [
      '/JobsOCTools@Pods/Core/GXCardView（需要重构成单独的Pod）/',
      '/JobsOCTools@Pods/Core/XLChannelControls/', '/JobsOCTools@Pods/Core/水平进度条/',
      '/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/',
      '/App工具类/3rd/', '/Demo@Excel/Excel-SpreadsheetView/', '/Demo@CoreTextLearning/'
    ]
    return false if ownership_exclusions.any? { |marker| path.include?(marker) }

    own = lambda do |file|
      lines = File.read(file, encoding: 'UTF-8').lines.first(100)
      lines.any? { |line| line.include?('Created by Jobs') } &&
        lines.none? { |line| line.include?('Created by') && !line.include?('Created by Jobs') } &&
        lines.none? { |line| line.match?(/Copyright/i) && !line.match?(/Jobs/i) }
    end
    return false unless own.call(path)

    header = path.sub(/\.(?:m|mm)\z/, '.h')
    header == path || !File.file?(header) || own.call(header)
  end

  def scrub(source)
    # 保留行号，去掉注释与字面量；这里只对少数已知 selector 和 API 候选做词法定位。
    source.gsub(%r{"(?:\\.|[^"\\])*"|//[^\n]*|/\*.*?\*/}m) { |token| token.gsub(/[^\n]/, ' ') }
  end

  def inspect_implementations(path, pod)
    return unless %w[.m .mm].include?(File.extname(path)) && jobs_owned?(path)

    text = scrub(File.read(path, encoding: 'UTF-8'))
    text.scan(/@implementation\s+(\w+)(?:\s*\([^)]*\))?(.*?)@end/m) do |cls, body|
      body.scan(/^\s*-\s*\([^\n]*?\)\s*(\w+)\s*([^{};]*?)\{/m) do |first, rest|
        selector = rest.include?(':') ? ([first] + rest.scan(/\b(\w+)\s*:/).flatten).join(':') + ':' : first
        next unless WATCHED.key?([cls, selector])

        @implementations[[cls, selector]] << { pod: pod, path: relative(path) }
      end
    end
    API_CANDIDATES.each do |category, pattern|
      hits = text.lines.each_with_index.filter_map do |line, index|
        { path: relative(path), line: index + 1, token: line[pattern] } if line.match?(pattern)
      end
      @privacy_candidates[pod][category].concat(hits)
    end
  end

  def inspect_public_core_exports(pod, pod_dir, public_headers, private_headers)
    core = Dir.glob(File.join(pod_dir, 'Core', '**', '*.h')).reject { |path| excluded?(path) }
              .map { |path| File.expand_path(path) }.group_by { |path| File.basename(path) }
    public_headers.reject { |path| path.include?('/Support/') }.each do |path|
      # 保留行号和显式 module import，不将注释中的示例当作消费合同。
      source = File.read(path, encoding: 'UTF-8').gsub(%r{//[^\n]*|/\*.*?\*/}m) do |comment|
        comment.gsub(/[^\n]/, ' ')
      end
      source.lines.each_with_index do |line, index|
        match = line.match(/^\s*#\s*(?:import|include)\s+<#{Regexp.escape(pod)}\/([^>]+)>/)
        next unless match

        token = match[1]
        next if token.start_with?('Support/')

        targets = Array(core[File.basename(token)])
        # Framework 的 module import 按导出头名称解析；同名公开 Support 头不是私有 Core 的消费。
        next if targets.empty? || public_headers.any? { |target| File.basename(target) == File.basename(token) }

        entry = { header: relative(path), line: index + 1, import: "#{pod}/#{token}",
                  targets: targets.map do |target|
                    { path: relative(target), public: false, private: private_headers.include?(target) }
                  end }
        issue('H03', "#{entry[:header]}|#{entry[:import]}|#{targets.map { |target| relative(target) }.sort.join('|')}",
              '公开头显式引用本 Pod Core 头，但 CocoaPods 未将目标列为 public header', entry)
      end
    end
  end

  def inspect_headers(pod, pod_dir, files, public_headers, private_headers)
    inspect_public_core_exports(pod, pod_dir, public_headers, private_headers)
    support = files.select { |path| path.include?('/Support/') && path.end_with?('.h') }.group_by { |path| File.basename(path) }
    core_headers = public_headers.select { |path| path.include?('/Core/') }
    links = []
    core_headers.each do |path|
      File.readlines(path, encoding: 'UTF-8').each_with_index do |line, index|
        match = line.match(/^\s*#\s*(?:import|include)\s+[<"]([^>"]+)[>"]/)
        next unless match

        token = match[1]
        # 显式另一个 module 的同名 header 不属于本 Pod Support。
        next if token.include?('/') && !token.start_with?("#{pod}/")

        Array(support[File.basename(token)]).each do |target|
          entry = { header: relative(path), line: index + 1, import: token, support: relative(target),
                    public: public_headers.include?(target), private: private_headers.include?(target) }
          links << entry
          issue('H02', "#{entry[:header]}|#{entry[:support]}", '公开 Core 头直接引用本 Pod Support，需明确 API/私有边界', entry)
        end
      end
    end
    public_headers.group_by { |path| File.basename(path) }.each do |basename, paths|
      unique = paths.uniq
      next unless unique.size > 1

      issue('H01', "#{pod}|#{basename}|#{unique.map { |x| relative(x) }.sort.join('|')}",
            '同一 Pod 的 public headers 展平名称冲突', paths: unique.map { |x| relative(x) })
    end
    links
  end

  def fingerprint_helper(pod_dir, pod)
    helper = File.join(pod_dir, 'JobsPodspecKit.rb')
    return nil unless File.file?(helper)

    source = File.read(helper, encoding: 'UTF-8')
    normalized = source.gsub(/JobsPodspecKitFor\w+/, 'JobsPodspecKitForPOD')
    entry = { path: relative(helper), sha256: Digest::SHA256.hexdigest(source),
              normalized_sha256: Digest::SHA256.hexdigest(normalized), lines: source.lines.count }
    known = @baseline.fetch('helpers', {})[entry[:path]]
    if known && known['normalized_sha256'] != entry[:normalized_sha256]
      issue('K01', entry[:path], 'helper fingerprint 改变，需重新审阅行为差异', entry.merge(expected: known['normalized_sha256']))
    elsif !known
      issue('K01', entry[:path], '新增或尚未审阅的 helper 变体', entry)
    end
    entry
  end

  def read_privacy(pod, manifests, bundled)
    manifests.map do |path|
      begin
        plist = Xcodeproj::Plist.read_from_path(path)
        types = plist.fetch('NSPrivacyAccessedAPITypes', [])
        unless types.is_a?(Array)
          issue('V01', relative(path), 'NSPrivacyAccessedAPITypes 必须是数组')
          next({ path: relative(path), error: 'invalid API array' })
        end
        declarations = types.map do |type|
          category = type['NSPrivacyAccessedAPIType']
          reasons = type['NSPrivacyAccessedAPITypeReasons']
          if !REASONS.key?(category) || !reasons.is_a?(Array) || reasons.empty? ||
             reasons.any? { |reason| !REASONS.fetch(category, []).include?(reason) }
            issue('V01', "#{relative(path)}|#{category}|#{Array(reasons).join(',')}", '隐私 category/reason 不在已核对 Apple 范围', declaration: type)
          end
          { category: category, reasons: reasons }
        end
        unless bundled.include?(path)
          issue('V02', relative(path), 'PrivacyInfo 存在但不在实际 production 资源中')
        end
        { path: relative(path), declarations: declarations, bundled: bundled.include?(path),
          tracking: plist['NSPrivacyTracking'], collected_data_types: plist['NSPrivacyCollectedDataTypes'] }
      rescue StandardError => error
        issue('V01', relative(path), '隐私清单无法解析', error: error.message)
        { path: relative(path), error: error.message }
      end
    end
  end

  def inspect_spec(path)
    spec = Pod::Specification.from_file(path)
    pod = spec.name
    dir = path.dirname
    path_list = Pod::Sandbox::PathList.new(dir)
    production = [spec] + spec.recursive_subspecs.reject { |child| child.test_specification? || child.app_specification? }
    consumers = production.map { |child| child.consumer(:ios) }
    accessors = consumers.map { |consumer| Pod::Sandbox::FileAccessor.new(path_list, consumer) }
    files = accessors.flat_map(&:source_files).map(&:to_s).map { |x| File.expand_path(x) }.uniq.sort
    publics = accessors.flat_map(&:public_headers).map(&:to_s).map { |x| File.expand_path(x) }.uniq.sort
    privates = accessors.flat_map(&:private_headers).map(&:to_s).map { |x| File.expand_path(x) }.uniq.sort
    raw_resources = accessors.flat_map(&:resources).map(&:to_s).map { |x| File.expand_path(x) }.uniq.sort
    bundles = Hash.new { |hash, key| hash[key] = [] }
    accessors.each do |accessor|
      accessor.resource_bundles.each { |name, paths| bundles[name].concat(paths.map { |x| File.expand_path(x.to_s) }) }
    end
    bundles.transform_values!(&:uniq)
    all_resources = (raw_resources + bundles.values.flatten).uniq
    dependencies = consumers.flat_map(&:dependencies).map(&:name).uniq.sort
    @graph[pod] = dependencies.map { |name| name.split('/').first }.uniq.reject { |name| name == pod }
    files.each do |file|
      unless File.expand_path(file).start_with?(File.expand_path(dir.to_s) + '/') && !excluded?(file)
        issue('P02', relative(file), 'production source 越过当前 Pod / vendor 排除边界', pod: pod)
      end
      if file.match?(%r{/(?:Tests|Test|UnitTests|UITests)/})
        issue('P03', relative(file), '测试文件进入 production source_files', pod: pod)
      end
      inspect_implementations(file, pod) unless excluded?(file)
    end
    publics.each { |file| @global_headers[File.basename(file)] << { pod: pod, path: relative(file) } }
    raw_resources.each do |file|
      @resource_names[resource_name(file)] << { pod: pod, path: relative(file), sha256: file_digest(file), surface: 'app' }
    end
    bundles.each do |name, paths|
      @bundle_names[name] << pod
      paths.each do |file|
        @resource_names["#{name}.bundle/#{resource_name(file)}"] << { pod: pod, path: relative(file), sha256: file_digest(file), surface: name }
      end
    end
    manifests = Dir.glob(File.join(dir, '**', 'PrivacyInfo.xcprivacy')).reject { |file| excluded?(file) }.map { |x| File.expand_path(x) }
    privacy = read_privacy(pod, manifests, all_resources)
    declared = privacy.flat_map { |item| Array(item[:declarations]).map { |type| type[:category] } }.uniq
    candidates = @privacy_candidates[pod].transform_values { |items| items.uniq }
    # 词法命中并非调用图或用途证明；未声明候选要人工判断后按精确 pod/category 建例外。
    candidates.each do |category, hits|
      next if declared.include?(category) || hits.empty?

      issue('V03', "#{pod}|#{category}", 'required-reason API 候选未在本 Pod 清单声明，需人工确认实际调用/用途', hits: hits)
    end
    {
      name: pod, podspec: relative(path), version: spec.version.to_s,
      root_attributes: spec.attributes_hash.reject { |key, _| %w[subspecs test_specs app_specs].include?(key) },
      evaluated_production_specs: consumers.map do |consumer|
        { name: consumer.spec.name, source_files: consumer.source_files, public_header_files: consumer.public_header_files,
          private_header_files: consumer.private_header_files, exclude_files: consumer.exclude_files,
          dependencies: consumer.dependencies.map(&:name) }
      end,
      test_specs: spec.recursive_subspecs.select(&:test_specification?).map(&:name),
      default_subspecs: spec.attributes_hash['default_subspecs'], dependencies: dependencies,
      source_files: files.map { |x| relative(x) }, public_headers: publics.map { |x| relative(x) },
      private_headers: privates.map { |x| relative(x) },
      visibility: { core_public: publics.count { |x| x.include?('/Core/') },
                    support_compiled: files.count { |x| x.include?('/Support/') },
                    support_public: publics.count { |x| x.include?('/Support/') },
                    support_private: privates.count { |x| x.include?('/Support/') } },
      core_support_imports: inspect_headers(pod, dir, files, publics, privates),
      resources: raw_resources.map { |x| relative(x) }, resource_bundles: bundles.transform_values { |paths| paths.map { |x| relative(x) } },
      helper: fingerprint_helper(dir, pod), privacy: privacy, privacy_api_candidates: candidates
    }
  rescue StandardError, ScriptError => error
    issue('P01', relative(path), 'CocoaPods 求值/展开失败', error: "#{error.class}: #{error.message}")
    { podspec: relative(path), error: "#{error.class}: #{error.message}" }
  end

  def resource_name(path)
    parts = Pathname(path).each_filename.to_a
    catalog = parts.index { |part| part.end_with?('.xcassets') }
    return "asset-catalog:#{parts[catalog]}" if catalog

    localization = parts.find { |part| part.end_with?('.lproj') }
    name = File.basename(path).sub(/\.xib\z/, '.nib').sub(/\.storyboard\z/, '.storyboardc')
    localization ? "#{localization}/#{name}" : name
  end

  def file_digest(path)
    return 'asset-catalog' if path.match?(%r{\.xcassets(?:/|\z)})

    File.file?(path) ? Digest::SHA256.file(path).hexdigest : 'directory'
  end

  def find_cycles
    visiting = []
    finished = {}
    cycles = []
    visit = lambda do |node|
      if visiting.include?(node)
        cycles << visiting[visiting.index(node)..] + [node]
        return
      end
      return if finished[node]

      visiting << node
      @graph.fetch(node, []).select { |target| @graph.key?(target) }.each { |target| visit.call(target) }
      visiting.pop
      finished[node] = true
    end
    @graph.keys.sort.each { |node| visit.call(node) }
    cycles.uniq
  end

  def run(options)
    @root = Pathname(options[:root]).expand_path
    @baseline = File.file?(options[:baseline]) ? JSON.parse(File.read(options[:baseline])) : {}
    @issues = []
    @graph = {}
    @implementations = Hash.new { |hash, key| hash[key] = [] }
    @privacy_candidates = Hash.new { |hash, key| hash[key] = Hash.new { |inner, category| inner[category] = [] } }
    @global_headers = Hash.new { |hash, key| hash[key] = [] }
    @resource_names = Hash.new { |hash, key| hash[key] = [] }
    @bundle_names = Hash.new { |hash, key| hash[key] = [] }
    paths = Dir.glob(@root.join('JobsByPods', '*', '*.podspec').to_s).reject { |path| excluded?(path) }.sort
    rows = paths.map { |path| inspect_spec(Pathname(path)) }
    expected = @baseline.fetch('expected_pods', [])
    actual = @graph.keys.sort
    if expected.empty? || actual != expected.sort
      issue('P00', 'inventory', 'Pod 清单与显式 baseline 不一致', missing: expected - actual, added: actual - expected)
    end
    cycles = find_cycles
    cycles.each { |cycle| issue('D01', cycle.join('->'), '内部 Pod 依赖环', cycle: cycle) }
    WATCHED.each do |pair, canonical|
      implementations = @implementations[pair].uniq
      next unless @graph.key?(canonical)
      next if implementations.size == 1 && implementations.first[:pod] == canonical

      issue('I01', pair.join(':'), '已知 Objective-C selector 未收口到唯一 canonical Jobs 实现',
            class: pair.first, selector: pair.last, expected_owner: canonical, implementations: implementations)
    end
    collisions = []
    @resource_names.each do |name, entries|
      unique = entries.uniq { |item| item[:path] }
      next unless unique.size > 1

      collisions << { name: name, entries: unique }
      # 相同字节的共享字体等只记录；不同字节同目标名称会造成覆盖。
      next unless unique.map { |item| item[:sha256] }.uniq.size > 1

      issue('R01', "#{name}|#{unique.map { |item| item[:path] + ':' + item[:sha256] }.sort.join('|')}",
            '不同内容资源具有同一 bundle 输出名称', name: name, entries: unique)
    end
    @bundle_names.each do |name, owners|
      next if owners.uniq.size < 2

      issue('R02', "#{name}|#{owners.uniq.sort.join('|')}", '资源 bundle 名称被多个 Pod 占用', owners: owners.uniq)
    end
    helpers = rows.filter_map { |row| row[:helper] }
    missing_helpers = @baseline.fetch('helpers', {}).keys - helpers.map { |helper| helper[:path] }
    missing_helpers.each { |path| issue('K02', path, '已审阅 helper 消失，需确认目录/配置迁移后更新 baseline') }
    @issues.uniq! { |item| item[:id] }
    accepted = @baseline.fetch('exceptions', {})
    @issues.each do |item|
      exception = accepted[item[:id]]
      # P/I/D/隐私格式错误不能白名单；例外只承载现存结构边界与待人工核对候选。
      allowed = %w[H01 H02 R01 V03].include?(item[:code])
      item[:baseline_reason] = exception['reason'] if allowed && exception && exception['key'] == item[:key] && !exception['reason'].to_s.empty?
      item[:status] = item[:baseline_reason] ? 'accepted_existing' : 'failure'
    end
    failures = @issues.select { |item| item[:status] == 'failure' }
    report = {
      schema: 1, generated_at: Time.now.utc.iso8601, project_root: @root.to_s, cocoapods_version: Pod::VERSION,
      scope: 'All selectable iOS production subspecs; test/app specifications excluded; vendor content never modified',
      summary: { pods: actual.size, internal_edges: @graph.sum { |_, deps| deps.count { |dep| @graph.key?(dep) } },
                 cycles: cycles.size, helper_files: helpers.size, normalized_helper_variants: helpers.map { |h| h[:normalized_sha256] }.uniq.size,
                 known_selector_owners: @implementations.transform_keys { |key| key.join('::') },
                 findings: @issues.size, baseline_existing: @issues.size - failures.size, failures: failures.size,
                 stale_baseline_ids: accepted.keys - @issues.map { |item| item[:id] } },
      dependencies: @graph, cycles: cycles, pods: rows, helper_variants: helpers.group_by { |h| h[:normalized_sha256] },
      cross_pod_public_header_basenames: @global_headers.select { |_, entries| entries.map { |e| e[:pod] }.uniq.size > 1 },
      resource_name_collisions: collisions, findings: @issues
    }
    json = JSON.pretty_generate(report) + "\n"
    if options[:output] == '-'
      puts json
    else
      File.write(options[:output], json)
      puts "#{actual.size} Pods; #{cycles.size} cycles; #{report[:summary][:normalized_helper_variants]} helper variants; #{failures.size} new/unaccepted failures"
      puts "JSON: #{File.expand_path(options[:output])}"
      failures.first(12).each { |item| puts "#{item[:id]} #{item[:message]}: #{item[:key]}" }
    end
    failures.empty? ? 0 : 1
  end
end

begin
  exit JobsPodsAudit.run(options) if $PROGRAM_NAME == __FILE__
rescue JSON::ParserError, SystemCallError => error
  warn "审计配置/报告 I/O 失败：#{error.class}: #{error.message}"
  exit 2
end
