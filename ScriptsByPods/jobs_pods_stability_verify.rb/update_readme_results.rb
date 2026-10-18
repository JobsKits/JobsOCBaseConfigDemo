#!/usr/bin/env ruby
# 只依据最终矩阵回填独立验收结果句；默认预览，拒绝不完整或过期证据。
require 'digest'
require 'json'
require 'open3'
require 'optparse'
require 'pathname'
require 'tempfile'
require_relative 'jobs_stability_sources'
require_relative 'jobs_stability_pod_batch'

DEFAULT_ROOT = File.expand_path('../..', __dir__).freeze
RESULT_LINK = '[JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)'.freeze
PENDING_PREFIX = "当前结果：**待最终全量验收，见根 #{RESULT_LINK}**。".freeze

# 与 runner 相同的枚举与字节指纹，不执行构建、安装或其余 runner 副作用。
def source_paths(root)
  JobsStabilitySources.paths(root)
end

def snapshot(root)
  source_paths(root).map do |path|
    stat = File.stat(path)
    [path, stat.ino, stat.size, stat.mtime.to_r, stat.ctime.to_r]
  end
end

def source_fingerprint(root, xcode_version, architecture = nil)
  JobsStabilitySources.fingerprint(root, xcode_version, architecture: architecture)
end

def latest_result(record, fingerprint, kind, name, configuration)
  record.fetch('results').reverse.find do |row|
    row.values_at('kind', 'name', 'configuration', 'source_fingerprint') == [kind, name, configuration, fingerprint]
  end
end

def evidence_path(path, root)
  return nil unless path.is_a?(String) && !path.empty?
  File.expand_path(path, root)
end

def require_result(errors, record, fingerprint, root, kind, name, configuration)
  label = "#{kind}/#{name}/#{configuration}"
  row = latest_result(record, fingerprint, kind, name, configuration)
  unless row
    errors << "缺少当前指纹结果 #{label}"
    return nil
  end
  errors << "结果失败 #{label}: exit_status=#{row['exit_status'].inspect}" unless row['exit_status'] == 0
  errors << "指纹期间变更 #{label}" if row['source_consistent'] == false
  log = evidence_path(row['log'], root)
  errors << "日志不存在 #{label}" unless log && File.file?(log)
  if kind == 'pod' && row['execution_mode'] == 'batch-member'
    JobsStabilityPodBatch.member_errors(record, row, root).each do |message|
      errors << "#{message} #{label}"
    end
  end
  row
end

def require_test(errors, record, fingerprint, root, name, configuration)
  row = require_result(errors, record, fingerprint, root, 'test', name, configuration)
  return nil unless row
  label = "test/#{name}/#{configuration}"
  summary = row['test_summary']
  unless summary.is_a?(Hash)
    errors << "没有实际 XCTest summary #{label}"
    return row
  end
  errors << "XCTest result 不是 Passed #{label}: #{summary['result'].inspect}" unless summary['result'] == 'Passed'
  keys = %w[totalTestCount passedTests failedTests skippedTests]
  unless keys.all? { |key| summary[key].is_a?(Integer) && summary[key] >= 0 }
    errors << "XCTest summary 数量字段非法 #{label}"
    return row
  end
  total, passed, failed, skipped = keys.map { |key| summary[key] }
  unless total > 0 && passed > 0 && failed == 0 && skipped < total && passed + failed + skipped == total
    errors << "XCTest 没有完整成功执行 #{label}: #{summary.inspect}"
  end
  bundle = evidence_path(row['result_bundle'], root)
  errors << "xcresult 不存在 #{label}" unless bundle && File.directory?(bundle) && File.extname(bundle) == '.xcresult'
  errors << "测试模拟器 UDID 缺少 #{label}" unless row['simulator'].is_a?(String) && row['simulator'].match?(/\A[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\z/)
  if name == 'JobsBaseUI'
    errors << "Keychain XCTest 必须全部执行且零跳过 #{label}" unless passed == total && skipped.zero?
    errors << "Keychain 测试签名策略不匹配 #{label}" unless row['signing_policy'] == 'simulator-adhoc-keychain-v1'
    signature = row['host_signature']
    if !signature.is_a?(Hash) || signature['valid'] != true ||
       signature['codesign_exit_status'] != 0 || signature['verification_exit_status'] != 0
      errors << "Keychain 实际宿主签名审计缺失或失败 #{label}"
    else
      identifier = signature['bundle_identifier']
      permissions_match = lambda do |values|
        identifier.is_a?(String) && !identifier.empty? && values.is_a?(Hash) &&
          values['application-identifier'] == identifier && values['keychain-access-groups'] == [identifier] &&
          values['get-task-allow'] == true
      end
      # 领取当次测试记录中的编译证据，不重新读取后续构建可能已替换的 Products。
      permissions_valid = case signature['permission_source']
                          when 'code-signature'
                            permissions_match.call(signature['code_signature_entitlements'])
                          when 'simulator-binary-__TEXT-__entitlements'
                            proof = signature['compiled_permissions']
                            architectures = proof.is_a?(Hash) ? proof['architectures'] : nil
                            proof.is_a?(Hash) && proof['valid'] == true &&
                              proof['binary'].is_a?(String) && !proof['binary'].empty? &&
                              proof['binary_sha256'].is_a?(String) && proof['binary_sha256'].match?(/\A[0-9a-f]{64}\z/) &&
                              architectures.is_a?(Array) && !architectures.empty? &&
                              architectures.all? do |architecture|
                                architecture.is_a?(Hash) && architecture['valid'] == true &&
                                  architecture['architecture'].is_a?(String) && !architecture['architecture'].empty? &&
                                  permissions_match.call(architecture['entitlements'])
                              end
                          else
                            false
                          end
      errors << "Keychain 当次宿主权限证据缺失或不匹配 #{label}" unless permissions_valid
    end
  end
  row
end

def prepare_update(path, replacement)
  text = File.read(path)
  headings = text.to_enum(:scan, /^## [^\n]*本轮单元验证[^\n]*$/).map { Regexp.last_match }
  raise "独立验收章节缺少/重复: #{path}" unless headings.size == 1
  heading = headings.first
  start = heading.end(0)
  finish = text.index(/^## /, start) || text.length
  chapter = text[start...finish]
  raise "结果句缺少/重复或已回填: #{path}" unless chapter.scan(PENDING_PREFIX).size == 1
  updated = text.dup
  updated[start...finish] = chapter.sub(PENDING_PREFIX, replacement)
  [text, updated]
end

def main
  options = { root: DEFAULT_ROOT, apply: false }
  OptionParser.new do |parser|
    parser.banner = 'ruby ScriptsByPods/jobs_pods_stability_verify.rb/update_readme_results.rb --results PATH [--root PATH] [--apply]'
    parser.on('--results PATH', '最终 runner results.json') { |value| options[:results] = File.expand_path(value) }
    parser.on('--root PATH', '工程绝对路径') { |value| options[:root] = File.expand_path(value) }
    parser.on('--apply', '门禁全部通过后真正回填；省略时只预览') { options[:apply] = true }
  end.parse!
  raise '--results PATH 必须给出' unless options[:results]
  root = options[:root]
  record = JSON.parse(File.read(options[:results]))
  fingerprint = record['source_fingerprint']
  raise '顶层 source_fingerprint 非法' unless fingerprint.is_a?(String) && fingerprint.match?(/\A[0-9a-f]{64}\z/)
  raise 'results 必须是数组' unless record['results'].is_a?(Array)
  raise '验收记录与当前依赖安装模式不一致' unless record['installation_mode'] == JobsStabilitySources.installation_mode
  raise 'results.root 与目标工程不一致' unless record['root'].is_a?(String) && File.realpath(record['root']) == File.realpath(root)
  pods = Dir.glob(File.join(root, 'JobsByPods', '*@Pods', '*.podspec')).reject do |path|
    path.include?('/ManualBy')
  end.sort.to_h { |path| [File.basename(path, '.podspec'), path] }
  raise "不是本轮109自建Pod: #{pods.size}" unless pods.size == 109 && record['self_pod_count'] == 109
  xcode_version, status = Open3.capture2('xcodebuild', '-version')
  raise '无法只读查询 Xcode 版本' unless status.success?
  raise 'Xcode 版本与验收记录不一致' unless record['xcode'] == xcode_version.strip
  initial_snapshot = snapshot(root)
  current = source_fingerprint(root, xcode_version, record['architecture'])
  raise '磁盘源码/资源/配置指纹已改变；禁止领取旧结果' unless current == fingerprint
  raise '计算指纹期间源码发生变化' unless snapshot(root) == initial_snapshot
  errors = []
  metadata = {}
  pods.each do |name, spec|
    %w[Debug Release].each do |configuration|
      require_result(errors, record, fingerprint, root, 'pod', name, configuration)
    end
    stability = File.read(spec).match?(/\.test_spec\s+['"]Stability['"]/)
    tests = stability ? (name == 'JobsOCSnowflake' ? %w[Debug Release] : ['Debug']) : []
    tests.each { |configuration| require_test(errors, record, fingerprint, root, name, configuration) }
    harness = File.file?(File.join(File.dirname(spec), 'Tests', 'run_regression.rb'))
    require_result(errors, record, fingerprint, root, 'harness', name, 'macOS') if harness
    metadata[name] = { tests: tests, harness: harness }
  end
  require_result(errors, record, fingerprint, root, 'static', 'JobsPodsConfiguration', 'all')
  %w[Debug Release].each do |configuration|
    require_result(errors, record, fingerprint, root, 'app', 'JobsOCBaseConfigDemo', configuration)
  end
  raise "拒绝回填，不写任何README：\n#{errors.join("\n")}" unless errors.empty?
  updates = pods.map do |name, spec|
    batch_coverage = %w[Debug Release].select do |configuration|
      latest_result(record, fingerprint, 'pod', name, configuration)['execution_mode'] == 'batch-member'
    end
    facts = ['Debug / Release 自建 Pod target 编译']
    facts << "#{batch_coverage.join(' / ')} 单图批量覆盖（共享批次证据）" unless batch_coverage.empty?
    facts << "#{record['architecture']} 模拟器架构" if record['architecture']
    facts << '仅模拟器依赖图' if record['installation_mode'] == 'simulator-only'
    info = metadata.fetch(name)
    facts << "#{info[:tests].join(' / ')} Stability 回归" unless info[:tests].empty?
    facts << 'macOS 生产实现回归' if info[:harness]
    state = "当前结果：**#{facts.join('、')}已完成"
    state += '；本 Pod 无独立 Stability 回归' if info[:tests].empty?
    state += "；整体验收记录见根 #{RESULT_LINK}**。"
    path = File.join(File.dirname(spec), 'README.md')
    original, updated = prepare_update(path, state)
    { name: name, path: path, original: original, updated: updated, result: state }
  end
  raise '预览期间源码发生变化；禁止回填' unless snapshot(root) == initial_snapshot
  puts JSON.pretty_generate({ mode: options[:apply] ? 'apply' : 'preview', source_fingerprint: fingerprint, readmes: updates.size, stability: metadata.values.count { |info| !info[:tests].empty? }, harness: metadata.values.count { |info| info[:harness] }, results: updates.map { |row| { pod: row[:name], result: row[:result] } } })
  return unless options[:apply]
  # 所有章节和证据先过门禁，再生成同目录临时文件；原文发生并发变化则不开始替换。
  temporary_files = []
  begin
    updates.each do |row|
      temporary = Tempfile.new(['.jobs-readme-results-', '.md'], File.dirname(row[:path]))
      temporary.binmode
      temporary.write(row[:updated])
      temporary.flush
      temporary.fsync
      File.chmod(File.stat(row[:path]).mode & 0o777, temporary.path)
      temporary_files << [temporary, row]
    end
    raise '暂存期间源码发生变化；禁止回填' unless snapshot(root) == initial_snapshot
    raise 'README 被其他任务修改；禁止覆盖' unless updates.all? { |row| File.read(row[:path]) == row[:original] }
    temporary_files.each { |temporary, row| File.rename(temporary.path, row[:path]) }
  ensure
    temporary_files.each { |temporary, _| temporary.close! }
  end
  puts "已回填 #{updates.size} 份独立验收结果句。未修改模块合同或工程配置；主App运行/资源结论由根报告保存。"
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue StandardError => error
    warn error.message
    exit 1
  end
end
