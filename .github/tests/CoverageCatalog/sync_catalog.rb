#!/usr/bin/env ruby
# frozen_string_literal: true

require 'digest'
require 'fileutils'
require 'json'
require 'open3'
require 'optparse'
require 'pathname'
require 'tempfile'
require 'tmpdir'

# 只维护当前巡检输入快照；文档清单直接复用实际打包器，业务动作和断言不生成或删减。
class JobsCoverageCatalog
  COVERAGE = 'ScriptsByPods/自动化测试相关脚本/【MacOS】🧪iOS自动巡检.command/Coverage'.freeze
  DOCUMENT_CLASS = 'JobsOCMarkdownDocumentDemoVC'.freeze
  DOCUMENT_PREFIX = (DOCUMENT_CLASS + '.').freeze
  SOURCE_KEYS = %w[source implementationSource headerSource documentPath registrationSources].freeze
  PATH_PREFIX = %r{\A(?:JobsOCBaseConfigDemo|Libs|JobsLibs|JobsByPods|ScriptsByPods|ScriptsByDevTools|OCDoc\.md|\.github|\.jobs-markdown-toc|\.agents)/}.freeze

  def initialize(root)
    @root = File.realpath(root)
    @path_cache = {}
    @digests = {}
    @path_changes = {}
    @evidence_updates = 0
    @stale_evidence = []
    @selector_sources = []
    @original = {}
    @paths = %w[routes.json Flows.json SourceAudit.json].to_h do |name|
      relative = File.join(COVERAGE, name)
      text = File.binread(File.join(@root, relative))
      @original[relative] = text
      [name, relative]
    end
    @input = @paths.transform_values { |path| JSON.parse(@original.fetch(path).dup) }
  end

  def migrated_path(value)
    path = value.dup
    %w[JobsOCBaseCustomize3rdCore JobsOCBaseCustomizeUIKitCore JobsOCDSL OCBaseConfig PodsManual 🔨Manual_Add_ThirdParty（按需引入）].each do |name|
      path = path.sub("JobsOCBaseConfigDemo/#{name}/", "Libs/#{name}/")
    end
    path = path.sub(%r{\AJobsLibs/}, 'Libs/')
    path = path.sub(%r{\AJobsOCBaseConfigDemo/其他/资源文件管理/}, 'JobsOCBaseConfigDemo/其他/libs/')
    path = path.sub(%r{\AJobsOCBaseConfigDemo/配置info\.plist/}, 'JobsOCBaseConfigDemo/其他/配置info.plist/')
    path = path.sub(%r{\AJobsOCBaseConfigDemo/启动配置/AppDelegate & SceneDelegate/AppDelegate/}, 'JobsOCBaseConfigDemo/入口/AppDelegate/')
    path = path.sub(%r{\AJobsOCBaseConfigDemo/启动配置/AppDelegate & SceneDelegate/SceneDelegate/}, 'JobsOCBaseConfigDemo/入口/SceneDelegate/')
    path = path.sub(%r{\AJobsOCBaseConfigDemo/启动配置/JobsAppIconRibbon/}, 'Libs/构建工具/JobsAppIconRibbon/')
    path = path.sub(%r{\ALibs/构建工具/JobsAppIconRibbon@Pods/}, 'JobsByPods/JobsAppIconRibbon@Pods/')
    path = path.sub(%r{\AScriptsByDevTools/}, 'ScriptsByPods/自动化测试相关脚本/')
    if path.match?(%r{\AScriptsByPods/[^/]+(?:/|\z)})
      name = path.split('/')[1]
      unless %w[自动化测试相关脚本 Cocoapods相关脚本].include?(name) || File.exist?(File.join(@root, path))
        found = %w[自动化测试相关脚本 Cocoapods相关脚本].select do |category|
          File.exist?(File.join(@root, 'ScriptsByPods', category, name))
        end
        raise "脚本归档位置不唯一：#{value}" if found.size > 1
        path = path.sub('ScriptsByPods/', "ScriptsByPods/#{found.first}/") if found.size == 1
      end
    end
    {
      'JobsOCBaseConfigDemo/JobsConfig.xcconfig' => 'JobsOCBaseConfigDemo/其他/JobsConfig.xcconfig',
      'JobsOCBaseConfigDemo/JobsOCBaseConfigDemo.entitlements' => 'JobsOCBaseConfigDemo/其他/JobsOCBaseConfigDemo.entitlements',
      'JobsOCBaseConfigDemo/JobsOCBaseConfigDemoPrefixHeader.pch' => 'JobsOCBaseConfigDemo/Headers/JobsOCBaseConfigDemoPrefixHeader.pch',
      'JobsOCBaseConfigDemo/启动配置/main.m' => 'JobsOCBaseConfigDemo/入口/main.m',
      'JobsAppIconRibbon.config' => 'JobsByPods/JobsAppIconRibbon@Pods/JobsAppIconRibbon.config'
    }.fetch(path, path)
  end

  # 逐层核对真实大小写，并拒绝工程外的软链接；不以MacOS的大小写容错冒充CI路径有效。
  def local_path(value)
    return @path_cache[value] if @path_cache.key?(value)
    raise "非法相对路径：#{value.inspect}" unless value.is_a?(String) && !value.empty?
    migrated = migrated_path(value)
    raise "路径越出工程：#{value}" if Pathname.new(migrated).absolute? || migrated.split('/').include?('..')
    if File.directory?(File.join(@root, migrated)) && File.file?(File.join(@root, migrated, 'README.md'))
      migrated = File.join(migrated, 'README.md')
    end
    current = @root
    parts = migrated.split('/').map do |part|
      names = Dir.children(current)
      actual = names.include?(part) ? part : names.select { |name| name.downcase == part.downcase }.then do |matches|
        raise "路径缺失或大小写不唯一：#{value}（#{migrated}）" unless matches.size == 1
        matches.first
      end
      current = File.join(current, actual)
      actual
    end
    relative = parts.join('/')
    absolute = File.join(@root, relative)
    raise "源文件不存在：#{relative}" unless File.file?(absolute)
    raise "软链接越出工程：#{relative}" unless File.realpath(absolute).start_with?(@root + '/')
    @path_changes[value] = relative if relative != value
    @path_cache[value] = relative
  end

  def digest(relative)
    @digests[relative] ||= Digest::SHA256.file(File.join(@root, relative)).hexdigest
  end

  def rewrite(value, key = nil)
    case value
    when Hash
      result = value.to_h do |name, child|
        updated = %w[catalogDigests sourceDigests].include?(key) ? local_path(name) : name
        [updated, rewrite(child, name)]
      end
      if result['source']
        if result['call'].is_a?(String) && result['detectedLine']
          needle = result['call'].gsub(/\s+/, '').gsub('{;', '{').sub(/\A[});]+(?=\.)/, '')
          lines = File.readlines(File.join(@root, result['source']))
          matches = lines.each_index.select do |index|
            lines[index].gsub(/\s+/, '').gsub('{;', '{').include?(needle)
          end
          if matches.empty?
            @stale_evidence << result.slice('id', 'source', 'method', 'call', 'sceneIDs')
          else
            match = matches.min_by { |index| (index + 1 - result['detectedLine']).abs }
            result['detectedLine'] = match + 1
            result['call'] = lines[match].strip if result['call'].include?('{;') || !lines[match].include?(result['call'])
          end
        end
        %w[sourceSHA256 sourceSha256].each do |field|
          next unless result.key?(field)
          actual = digest(result['source'])
          @evidence_updates += 1 if result[field] != actual
          result[field] = actual
        end
      end
      result
    when Array
      value.map { |child| rewrite(child, key) }
    when String
      if SOURCE_KEYS.include?(key) || value.match?(PATH_PREFIX) && value.match?(/\.(?:h|m|mm|rb|swift|md|command|json|pbxproj|plist|xcconfig|entitlements)\z/)
        local_path(value)
      else
        value
      end
    else
      value
    end
  end

  def documents
    candidates = [
      'Libs/OCBaseConfig/JobsMixFunc/JobsOCMarkdown/Support/JobsMarkdownPackager.rb',
      'JobsByPods/JobsOCMarkdown@Pods/Support/JobsMarkdownPackager.rb'
    ].select { |path| File.file?(File.join(@root, path)) }
    raise '实际JobsMarkdownPackager入口缺失或不唯一' unless candidates.size == 1
    filename = File.join(@root, candidates.first)
    source = File.read(filename)
    raise '打包器CLI入口已变化，需先审阅' unless source.match?(/\nexit\(main\(ARGV\)\)\s*\z/)
    definitions = source.sub(/\nexit\(main\(ARGV\)\)\s*\z/, "\n")
    namespace = Module.new
    namespace.module_eval(definitions, filename, 1)
    packager = namespace.const_get(:JobsMarkdownPackager).new(@root,
      File.join(Dir.tmpdir, 'JobsMarkdownDocuments.bundle'), File.basename(@root))
    packager.send(:markdown_paths).map do |source|
      relative = packager.send(:relative_path, source)
      raise "打包器文档路径不规范：#{relative}" unless local_path(relative) == relative
      { 'relative' => relative, 'id' => Digest::SHA256.hexdigest(relative),
        'title' => packager.send(:document_title, packager.send(:read_text, source), source) }
    end
  end

  def document_route(document, implementation)
    identifier = DOCUMENT_PREFIX + document.fetch('id')
    {
      'id' => identifier, 'title' => document.fetch('title'), 'source' => document.fetch('relative'),
      'implementationSource' => implementation, 'documentPath' => document.fetch('relative'),
      'documentID' => document.fetch('id'), 'className' => DOCUMENT_CLASS, 'kind' => 'page',
      'parentRoute' => 'JobsOCMarkdownDocumentsDemoVC',
      'navigationSteps' => [
        { 'kind' => 'type', 'target' => 'id:jobs.coverage.markdown.search', 'value' => document.fetch('relative') },
        { 'kind' => 'pressReturn', 'target' => 'id:jobs.coverage.markdown.search' },
        { 'kind' => 'tap', 'target' => 'id:jobs.coverage.open.' + identifier },
        { 'kind' => 'expect', 'target' => 'id:jobs.coverage.page.' + DOCUMENT_CLASS,
          'attribute' => 'value', 'value' => 'document:' + document.fetch('id') }
      ]
    }
  end

  def document?(route)
    route.key?('documentPath') || route.fetch('id').start_with?(DOCUMENT_PREFIX)
  end

  # 已有真实Lottery列表ID替代文字定位，保留原点击意图及后置页面断言。
  def align_lottery_selectors(routes)
    updates = []
    %w[LuckyDiskDemoVC LuckyWheelDemoVC].each do |name|
      row = routes.find { |route| route['id'] == name }
      next unless row
      parent = routes.find { |route| route['id'] == row['parentRoute'] }
      steps = Array(row['navigationSteps'])
      next unless steps.first && steps.first['kind'] == 'tap' && steps.first['target'].to_s.start_with?('label:')
      candidates = Dir.glob(File.join(@root, 'JobsOCBaseConfigDemo/业务逻辑/功能模块', '**', parent.fetch('className') + '.m'))
      raise "Lottery实际控制器源码不唯一：#{name}" unless candidates.size == 1
      source_path = local_path(Pathname.new(candidates.first).relative_path_from(Pathname.new(@root)).to_s)
      original = File.read(File.join(@root, source_path))
      raise 'Lottery稳定ID所在源码归属未确认' unless original.lines.first(100).join.include?('Created by Jobs')
      @selector_sources << source_path
      source = original.gsub(/\s+/, '')
      unless source.include?('@"jobs.coverage.open."') && source.include?(".byCls(#{name}.class)")
        raise "Lottery真实稳定ID证据缺失：#{name}"
      end
      steps.first['target'] = 'id:jobs.coverage.open.' + name
      updates << name
    end
    updates
  end

  def validate_registry(routes, flows, audit)
    inputs = [routes, flows, audit]
    raise '仅支持version=1的当前Coverage输入' unless inputs.all? { |input| input['version'] == 1 }
    projects = inputs.map { |input| input['projectID'] }
    raise 'Coverage输入projectID不一致或不属于OC工程' unless projects.uniq.size == 1 && %w[oc-old oc-new].include?(projects.first)
    identifiers = routes.fetch('routes').map { |row| row.fetch('id') }
    scenes = flows.fetch('scenarios').map { |row| row.fetch('id') }
    raise '路由或场景ID重复' unless identifiers.uniq == identifiers && scenes.uniq == scenes
    routes.fetch('routes').each do |row|
      raise "父路由缺失：#{row['id']}" if row['parentRoute'] && !identifiers.include?(row['parentRoute'])
    end
    flows.fetch('scenarios').each do |row|
      raise "场景启动路由缺失：#{row['id']}" unless identifiers.include?(row.fetch('route'))
    end
    valid_scenes = identifiers.map { |id| 'page.' + id } + scenes +
      Array(flows['pending']).map { |row| row['id'] } + Array(flows['notApplicable']).map { |row| row['id'] }
    inspect = lambda do |value|
      case value
      when Hash
        (Array(value['routeIDs']) + Array(value['routeID'])).each do |id|
          raise "SourceAudit引用未登记路由：#{id}" unless identifiers.include?(id)
        end
        Array(value['sceneIDs']).each do |id|
          raise "SourceAudit引用未登记场景：#{id}" unless valid_scenes.include?(id)
        end
        value.each_value { |child| inspect.call(child) }
      when Array
        value.each { |child| inspect.call(child) }
      end
    end
    inspect.call(audit)
  end

  # 旧回调随搜索组件整合迁到实际Demo；只接受真实按钮上已经恢复的原生Block观察点。
  def align_searcher_observer(flows, audit)
    identifier = 'gesture.oc.additional.JobsOCSearcherBar.cancelBtn'
    scene = flows.fetch('scenarios').find { |row| row['id'] == identifier }
    evidence = audit.fetch('gestures').select { |row| Array(row['sceneIDs']).include?(identifier) }
    raise '搜索长按场景或静态证据缺失/重复' unless scene && evidence.size == 1
    source = local_path('JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@JobsOCSearcherCore/JobsOCSearcherDemoVC/JobsOCSearcherDemoVC.m')
    lines = File.readlines(File.join(@root, source))
    call = 'button.onLongPressGestureAppendBy(^(UIButton *sender) {'
    matches = lines.each_index.select { |index| lines[index].include?(call) }
    return if matches.empty?
    raise '搜索长按观察点不唯一或源码所有者未确认' unless matches.size == 1 && lines.first(100).join.include?('Created by Jobs')
    content = lines.join
    required = ['JobsOCCoveragePrepareLongPressButton(button, @"jobs.searcher.cancel")',
      'JobsOCCoverageLongPressDelivered(sender)', 'view.accessibilityIdentifier isEqualToString:@"jobs.searcher.cancel"']
    raise '搜索长按真实按钮/原回调证据不完整' unless required.all? { |text| content.include?(text) }
    scene['source'] = source
    scene['title'] = '真实长按搜索取消按钮，断言原回调 began→ended'
    scene.fetch('steps').each do |step|
      if %w[id:jobs.coverage.searcher.input id:jobs.coverage.searcher.field].include?(step['target'])
        step['target'] = 'id:jobs.searcher.field'
      elsif %w[id:jobs.coverage.longPress.JobsOCSearcherBar.cancelBtn id:jobs.coverage.searcher.cancel].include?(step['target'])
        step['target'] = 'id:jobs.searcher.cancel'
      end
    end
    evidence.first.merge!('source' => source, 'method' => 'searchView',
      'line' => matches.first + 1, 'detectedLine' => matches.first + 1, 'call' => call,
      'reason' => '原日志长按Block追加到实际搜索Demo既有取消按钮/既有原生recognizer；稳定ID与idle→completed断言保留，仅静态登记。')
    @selector_sources << source
  end

  def build
    route_input = Marshal.load(Marshal.dump(@input.fetch('routes.json')))
    flow_input = Marshal.load(Marshal.dump(@input.fetch('Flows.json')))
    audit_input = Marshal.load(Marshal.dump(@input.fetch('SourceAudit.json')))
    prior_documents = route_input.fetch('routes').select { |row| document?(row) }
    source = local_path(prior_documents.first.fetch('implementationSource'))
    route_input['routes'] = route_input.fetch('routes').reject { |row| document?(row) }
    audit_input['navigation'] = audit_input.fetch('navigation').reject do |row|
      row['routeID'].to_s.start_with?(DOCUMENT_PREFIX)
    end
    audit_input.fetch('pages').select { |row| row['className'] == DOCUMENT_CLASS }.each do |row|
      row['routeIDs'] = []
      row['registrationSources'] = []
    end
    # 文档源只认本次打包器结果；旧版本的同名目录包装或已移除文档不强行伪造路径。
    [route_input, flow_input].each do |input|
      input['catalogDigests'] = input.fetch('catalogDigests', {}).reject { |path, _| path.end_with?('.md') }
    end
    align_searcher_observer(flow_input, audit_input)
    routes = rewrite(route_input)
    flows = rewrite(flow_input)
    audit = rewrite(audit_input)
    originals = routes.fetch('routes')
    selector_updates = align_lottery_selectors(originals)
    catalog = documents
    generated = catalog.map { |document| document_route(document, source) }
    routes['routes'] = originals + generated
    audit.fetch('pages').select { |row| row['className'] == DOCUMENT_CLASS }.each do |row|
      row['routeIDs'] = generated.map { |route| route['id'] }
      row['registrationSources'] = generated.map { |route| route['source'] }
    end
    template = @input.fetch('SourceAudit.json').fetch('navigation').find do |row|
      row['routeID'].to_s.start_with?(DOCUMENT_PREFIX)
    end || {}
    generated.each do |row|
      audit['navigation'] << template.merge('source' => row['source'], 'call' => DOCUMENT_CLASS,
        'routeID' => row['id'], 'classification' => 'mapped', 'sceneIDs' => ['page.' + row['id']],
        'reason' => '按实际Markdown打包器当前目录静态登记原reader父链与文档身份断言；不代表设备执行通过。')
    end
    audit.fetch('registeredCounts')['routes'] = routes.fetch('routes').size
    audit.fetch('registeredCounts')['flows'] = flows.fetch('scenarios').size
    paths = (routes.fetch('catalogDigests', {}).keys + flows.fetch('catalogDigests', {}).keys +
      catalog.map { |document| document['relative'] } + [source] + @selector_sources).uniq.sort
    own_inputs = @paths.values_at('routes.json', 'Flows.json')
    raise 'catalogDigests不能包含自身输入哈希' unless (paths & own_inputs).empty?
    hashes = paths.to_h do |path|
      current = digest(path)
      # SourceAudit也是本轮输入快照，必须冻结即将写入的内容，避免登记自身旧版本。
      current = Digest::SHA256.hexdigest(JSON.pretty_generate(audit) + "\n") if path == @paths.fetch('SourceAudit.json')
      [path, current]
    end
    routes['catalogDigests'] = hashes
    flows['catalogDigests'] = hashes
    validate_registry(routes, flows, audit)
    @candidate = { 'routes.json' => routes, 'Flows.json' => flows, 'SourceAudit.json' => audit }
    @bytes = @candidate.transform_values { |value| JSON.pretty_generate(value) + "\n" }
    @report = {
      'project' => routes.fetch('projectID'), 'static_registration_only' => true,
      'business_route_count' => originals.size, 'business_route_ids' => originals.map { |row| row['id'] }.sort,
      'scenario_count' => flows.fetch('scenarios').size, 'scenario_ids' => flows.fetch('scenarios').map { |row| row['id'] }.sort,
      'document_count' => catalog.size, 'catalog_source_count' => hashes.size,
      'previous_document_count' => prior_documents.size,
      'navigation_selector_updates' => selector_updates,
      'path_changes' => @path_changes, 'source_evidence_hash_updates' => @evidence_updates,
      'stale_call_evidence' => @stale_evidence, 'valid' => @stale_evidence.empty?,
      'needs_refresh' => @paths.any? { |name, relative| @original.fetch(relative) != @bytes.fetch(name).b }
    }
    @report
  end

  def compare_peer(peer)
    peer_routes = JSON.parse(File.read(File.join(peer, COVERAGE, 'routes.json')))
    peer_flows = JSON.parse(File.read(File.join(peer, COVERAGE, 'Flows.json')))
    route_ids = peer_routes.fetch('routes').reject { |row| document?(row) }.map { |row| row['id'] }.sort
    scene_ids = peer_flows.fetch('scenarios').map { |row| row['id'] }.sort
    raise '新旧非文档路由ID没有取完整并集' unless route_ids == @report.fetch('business_route_ids')
    raise '新旧业务场景ID没有取完整并集' unless scene_ids == @report.fetch('scenario_ids')
    behavior = lambda do |row|
      row.reject { |key, _| %w[source implementationSource title].include?(key) }
    end
    current_routes = @candidate.fetch('routes.json').fetch('routes').reject { |row| document?(row) }.to_h { |row| [row['id'], behavior.call(row)] }
    other_routes = peer_routes.fetch('routes').reject { |row| document?(row) }.to_h { |row| [row['id'], behavior.call(row)] }
    current_flows = @candidate.fetch('Flows.json').fetch('scenarios').to_h { |row| [row['id'], behavior.call(row)] }
    other_flows = peer_flows.fetch('scenarios').to_h { |row| [row['id'], behavior.call(row)] }
    @report['peer_route_behavior_differences'] = current_routes.keys.select { |key| current_routes[key] != other_routes[key] }
    @report['peer_scenario_behavior_differences'] = current_flows.keys.select { |key| current_flows[key] != other_flows[key] }
    @report['peer_business_ids_equal'] = true
    raise '新旧非文档导航或业务断言尚有差异' unless @report['peer_route_behavior_differences'].empty? && @report['peer_scenario_behavior_differences'].empty?
  end

  def verify_current_inputs
    @paths.each_value do |path|
      raise "清单被并发修改：#{path}" unless File.binread(File.join(@root, path)) == @original.fetch(path)
    end
    @digests.each do |path, expected|
      raise "源文件正在变化：#{path}" unless Digest::SHA256.file(File.join(@root, path)).hexdigest == expected
    end
  end

  def apply
    raise '手势调用静态证据已变化，必须核对实际所有者后再冻结' unless @stale_evidence.empty?
    verify_current_inputs
    staged = {}
    committed = []
    begin
      @paths.each do |name, relative|
        absolute = File.join(@root, relative)
        temporary = Tempfile.new(['.coverage-catalog-', '.tmp'], File.dirname(absolute))
        staged[relative] = temporary
        temporary.binmode
        temporary.write(@bytes.fetch(name))
        temporary.flush
        temporary.fsync
        temporary.chmod(File.stat(absolute).mode & 0o777)
      end
      @paths.each_value do |relative|
        raise "清单被并发修改：#{relative}" unless File.binread(File.join(@root, relative)) == @original.fetch(relative)
        File.rename(staged.fetch(relative).path, File.join(@root, relative))
        committed << relative
      end
    rescue StandardError
      committed.reverse_each do |relative|
        absolute = File.join(@root, relative)
        restore = Tempfile.new(['.coverage-restore-', '.tmp'], File.dirname(absolute))
        begin
          restore.binmode
          restore.write(@original.fetch(relative))
          restore.flush
          restore.fsync
          restore.chmod(staged.fetch(relative).stat.mode & 0o777)
          File.rename(restore.path, absolute)
        ensure
          restore.close!
        end
      end
      raise
    ensure
      staged.each_value(&:close!)
    end
    @report['applied'] = true
  end

  def validate_with_tool(tool)
    Dir.mktmpdir('jobs-coverage-plan-') do |directory|
      snapshot = File.join(directory, 'sources')
      @digests.each_key do |relative|
        destination = File.join(snapshot, relative)
        FileUtils.mkdir_p(File.dirname(destination))
        File.binwrite(destination, File.binread(File.join(@root, relative)))
      end
      @paths.each do |name, relative|
        destination = File.join(snapshot, relative)
        FileUtils.mkdir_p(File.dirname(destination))
        File.binwrite(destination, @bytes.fetch(name))
      end
      %w[simulator device].each do |platform|
        manifest = File.join(directory, "#{platform}.json")
        command = [tool, 'plan', '--routes', File.join(snapshot, @paths.fetch('routes.json')),
          '--flows', File.join(snapshot, @paths.fetch('Flows.json')), '--platform', platform,
          '--source-root', snapshot, '--project', @report.fetch('project'), '--output', manifest]
        output, status = Open3.capture2e(*command)
        raise "#{platform} plan失败：#{output}" unless status.success?
        output, status = Open3.capture2e(tool, 'validate', '--manifest', manifest,
          '--project', @report.fetch('project'), '--source-root', snapshot)
        raise "#{platform} validate失败：#{output}" unless status.success?
        @report[platform + '_plan_validation'] = JSON.parse(output)
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  options = { root: File.expand_path('../../..', __dir__), apply: false }
  OptionParser.new do |parser|
    parser.banner = 'ruby sync_catalog.rb [--root PROJECT] [--peer-root PROJECT] [--apply] [--tool COVERAGE_TOOL] [--report JSON]'
    parser.on('--root PATH') { |value| options[:root] = File.expand_path(value) }
    parser.on('--peer-root PATH') { |value| options[:peer] = File.realpath(value) }
    parser.on('--apply') { options[:apply] = true }
    parser.on('--tool PATH') { |value| options[:tool] = File.expand_path(value) }
    parser.on('--report PATH') { |value| options[:report] = File.expand_path(value) }
  end.parse!
  begin
    catalog = JobsCoverageCatalog.new(options.fetch(:root))
    report = catalog.build
    catalog.compare_peer(options[:peer]) if options[:peer]
    catalog.validate_with_tool(options[:tool]) if options[:tool]
    catalog.verify_current_inputs
    catalog.apply if options[:apply]
    text = JSON.pretty_generate(report) + "\n"
    File.write(options[:report], text) if options[:report]
    puts JSON.pretty_generate(report.reject { |key, _| %w[business_route_ids scenario_ids path_changes].include?(key) })
    exit(report['valid'] && (options[:apply] || !report['needs_refresh']) ? 0 : 1)
  rescue StandardError => error
    warn "CoverageCatalog: #{error.message}"
    exit 1
  end
end
