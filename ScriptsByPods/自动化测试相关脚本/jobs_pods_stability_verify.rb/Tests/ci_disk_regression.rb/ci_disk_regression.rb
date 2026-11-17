# Created by Jobs on 2026年11月18日，星期三.
# 临时目录真实删留、来源与路径守卫、进程非零回归，不操作本机真实构建缓存。
require 'fileutils'
require 'json'
require 'open3'
require 'rbconfig'
require 'tmpdir'
require_relative '../../jobs_stability_ci_disk.rb/jobs_stability_ci_disk'

module CIDiskRegression
  module_function
  # 所有断言先于成功输出，任一失败保留真实异常。
  def check(value, message)
    raise message unless value
  end
  # 为每组危险路径测试创建完全隔离的源码与runner临时目录。
  def fixture
    Dir.mktmpdir('Jobs CI 中文 空格-') do |base|
      root = File.join(base, 'source')
      temp = File.join(base, 'runner')
      FileUtils.mkdir_p([root, temp])
      manager = JobsStabilityCIDisk::Manager.new(root: root, temp: temp, run: '123', attempt: '1')
      yield manager, root, temp
    end
  end
  # 正向写入并记录一个哨兵的真实字节。
  def put(path, text = 'preserve original bytes')
    FileUtils.mkdir_p(File.dirname(path))
    File.binwrite(path, text)
    path
  end
  # 负向操作必须确实拒绝，不把错误状态清空后继续。
  def reject(message)
    rejected = false
    begin
      yield
    rescue StandardError
      rejected = true
    end
    check(rejected, message)
    @negative_count = (@negative_count || 0) + 1
  end
  # 模拟最终成功行只用于清理准入，不冒充真实XCTest执行证据。
  def row(kind, name, config)
    { 'kind' => kind, 'name' => name, 'configuration' => config, 'source_fingerprint' => 'f' * 64,
      'source_consistent' => true, 'exit_status' => 0, 'process_exit_status' => 0, 'process_signal' => nil,
      'process_status_collected' => true, 'timed_out' => false, 'host_signature' => { 'valid' => true } }
  end
  # 物化SDK真实哈希回执与资源，证明移除cache后导出不受影响。
  def sdk(root)
    base = File.join(root, 'JobsByPods/JobsRustOCR@Pods')
    %w[ios-arm64 ios-arm64_x86_64-simulator macos-arm64_x86_64].each do |slice|
      put(File.join(base, 'Frameworks/JobsOCRCore.xcframework', slice, 'libJobsOCRCore.a'), 'archive')
      put(File.join(base, 'Frameworks/JobsOCRCore.xcframework', slice, 'Headers/JobsOCRCore.h'), 'header')
    end
    put(File.join(base, 'Frameworks/JobsOCRCore.xcframework/Info.plist'), 'plist')
    put(File.join(base, 'Resource/JobsRustOCRResources.bundle/Models/model.onnx'), 'model')
    put(File.join(base, 'Source/JobsOCR/include/JobsOCRCore.h'), 'header')
    put(File.join(base, 'Core/JobsRustOCR.h'), 'header')
    files = Dir.glob(File.join(base, 'Frameworks/JobsOCRCore.xcframework/**/*')).select { |p| File.file?(p) }
    receipt = ['a' * 64] + files.map { |p| Digest::SHA256.file(p).hexdigest + '  ' + p.delete_prefix(File.join(base, 'Frameworks') + '/') }
    put(File.join(base, 'Frameworks/.JobsOCRCore-build.sha256'), receipt.join("\n") + "\n")
  end
  # 覆盖真实阶段准入、清理与证据原位保全。
  def lifecycle
    fixture do |manager, root, temp|
      manager.run('prepare')
      reject('Products deletion allowed') { manager.remove!(File.join(temp, 'JobsOCStability/Products')) }
      reject('Traversal deletion allowed') { manager.remove!(File.join(temp, 'JobsOCStability/DerivedData/../Products')) }
      sdk(root)
      cache = File.join(temp, 'JobsOCRSourceCache-123-1')
      put(File.join(cache, 'cargo/cache.bin'))
      File.symlink('cache.bin', File.join(cache, 'cargo/internal-link'))
      manager.run('rust')
      check(!File.exist?(cache), 'Owned Rust cache not reclaimed')
      manager.verify_sdk!
      output = File.join(temp, 'JobsOCStability')
      names = ['JobsBaseUI', 'JobsOCSnowflake'] + (1..48).map { |n| "TestPod#{n}" }
      names.each { |n| put(File.join(root, "JobsByPods/#{n}@Pods/#{n}.podspec"), "spec.test_spec 'Stability' do\nend\n") }
      put(File.join(root, JobsStabilityCIDisk::BASELINE), JSON.generate('expected_pods' => names))
      rows = names.flat_map { |n| (n == 'JobsOCSnowflake' ? %w[Debug Release] : ['Debug']).map { |c| row('test', n, c) } }
      rows << row('test', 'ApplicationTests', 'Debug')
      record = { 'source_fingerprint' => 'f' * 64, 'results' => rows }
      result = put(File.join(output, 'results.json'), JSON.generate(record))
      protected = %w[Products/Debug-iphonesimulator/AppHost.app/bin ApplicationTests/Products/Debug-iphonesimulator/App.app/bin OwnedPodsBatch/manifest.json test-original.log configuration-audit.json].map { |p| put(File.join(output, p)) }
      51.times { |n| protected << put(File.join(output, "Pod#{n}.xcresult/Data/original")) }
      protected << put(File.join(output, 'ApplicationTests/ApplicationTests-Debug.xcresult/Data/original'))
      protected << result
      %w[DerivedData Intermediates].each { |d| put(File.join(output, 'ApplicationTests', d, 'obsolete.bin')) }
      before = manager.hashes(protected)
      bad = Marshal.load(Marshal.dump(record))
      bad['results'].find { |r| r['name'] == 'ApplicationTests' }['timed_out'] = true
      File.write(result, JSON.generate(bad))
      reject('Timed-out tests cleanup accepted') { manager.run('tests') }
      check(File.file?(File.join(output, 'ApplicationTests/DerivedData/obsolete.bin')), 'Incomplete tests were cleaned')
      File.write(result, JSON.generate(record))
      manager.run('tests')
      check(%w[DerivedData Intermediates].none? { |d| File.exist?(File.join(output, 'ApplicationTests', d)) }, 'AppTests intermediates remain')
      check(manager.hashes(protected) == before, 'Test evidence or Products changed')
      rows += %w[Debug Release].map { |c| row('app', 'JobsOCBaseConfigDemo', c) }
      File.write(result, JSON.generate(record.merge('results' => rows)))
      app = File.join(output, 'Products/Debug-iphonesimulator/JobsOCBaseConfigDemo.app')
      protected << put(File.join(app, 'Info.plist'))
      protected << put(File.join(app, 'JobsOCBaseConfigDemo'))
      %w[Debug Release].each do |c|
        protected << put(File.join(output, "Intermediates/Pods.build/#{c}/ReactiveObjC.build/Objects-normal/arm64/source.resp"))
        protected << put(File.join(output, "Intermediates/Pods.build/#{c}/ReactiveObjC.build/real.hmap"))
        protected << put(File.join(output, "Intermediates/Pods.build/#{c}/all-product-headers-VFS/overlay.yaml"))
        put(File.join(output, "Intermediates/Pods.build/#{c}/ReactiveObjC.build/Objects-normal/arm64/huge.o"))
      end
      put(File.join(output, 'DerivedData/ModuleCache.noindex/data'))
      before = manager.hashes(protected)
      report = manager.run('app')
      check(report['preserved_diagnostics'].size == 6, 'Both configurations diagnostics missing')
      check(report['minimum_free_bytes'] == 2 * report['app_logical_bytes'] + JobsStabilityCIDisk::GIB, 'Package floor calculation changed')
      check(!File.exist?(File.join(output, 'DerivedData')), 'Main DerivedData remains')
      check(Dir.glob(File.join(output, 'Intermediates/**/*.o')).empty?, 'Unused intermediates remain')
      check(manager.hashes(protected) == before, 'Original products/evidence/diagnostics changed')
      puts 'PASS lifecycle: actual owned deletion and original Products/52 xcresult/logs/diagnostics bytes preserved'
    end
  end
  # 拒绝未登记、跨目录、链接逃逸、目录换身及SDK残留依赖。
  def safety
    fixture do |manager, root, temp|
      reject('Unowned cleanup accepted') { manager.run('app') }
      reject('Products path accepted') { manager.safe_tree!(root) }
      manager.run('prepare')
      foreign = File.join(temp, 'foreign'); FileUtils.mkdir_p(foreign)
      sentinel = put(File.join(foreign, 'sentinel'))
      File.symlink(foreign, File.join(temp, 'JobsOCStability/DerivedData'))
      reject('Target symlink accepted') { manager.remove!(File.join(temp, 'JobsOCStability/DerivedData')) }
      File.unlink(File.join(temp, 'JobsOCStability/DerivedData'))
      FileUtils.mkdir_p(File.join(temp, 'JobsOCStability/DerivedData'))
      File.symlink(foreign, File.join(temp, 'JobsOCStability/DerivedData/escape'))
      reject('Nested symlink escape accepted') { manager.remove!(File.join(temp, 'JobsOCStability/DerivedData')) }
      check(File.read(sentinel) == 'preserve original bytes', 'Foreign sentinel changed')
      File.unlink(File.join(temp, 'JobsOCStability/DerivedData/escape'))
      sdk(root)
      File.symlink(File.join(temp, 'JobsOCRSourceCache-123-1'), File.join(root, 'JobsByPods/JobsRustOCR@Pods/Core/cache'))
      reject('SDK cache dependency accepted') { manager.run('rust') }
      check(File.directory?(File.join(temp, 'JobsOCRSourceCache-123-1')), 'Cache deleted despite SDK failure')
      reject('Low disk accepted') { manager.require_space!(1024, 1025) }
      FileUtils.mv(File.join(temp, 'JobsOCStability'), File.join(temp, 'old-owned'))
      FileUtils.mkdir_p(File.join(temp, 'JobsOCStability'))
      reject('Replaced owner directory accepted') { manager.verify_owner! }
      puts 'PASS ownership, symlink target/descendant escape, SDK dependency, low-space and inode rejection'
    end
  end
  # helper与测试本体字节变更均使可信审计及实际源码FP失效。
  def provenance
    fixture do |_manager, root, _temp|
      paths = [JobsStabilityCIDisk::HELPER, JobsStabilityCIDisk::TEST]
      paths.each { |p| put(File.join(root, p), 'trusted source') }
      expected = paths.to_h { |p| [p, Digest::SHA256.file(File.join(root, p)).hexdigest] }
      put(File.join(root, JobsStabilityCIDisk::BASELINE), JSON.generate('ci_helpers' => expected))
      JobsStabilityCIDisk.verify_trust!(root)
      require_relative '../../jobs_stability_sources.rb/jobs_stability_sources'
      paths.each do |p|
        before = JobsStabilitySources.fingerprint(root, 'fixture', architecture: 'arm64')
        File.write(File.join(root, p), 'changed method body')
        reject('Mutated helper/test trusted') { JobsStabilityCIDisk.verify_trust!(root) }
        check(JobsStabilitySources.fingerprint(root, 'fixture', architecture: 'arm64') != before, 'Method body missing from SourceFP')
        File.write(File.join(root, p), 'trusted source')
      end
      put(File.join(root, JobsStabilityCIDisk::BASELINE), JSON.generate('ci_helpers' => expected.merge('unknown.rb' => '0' * 64)))
      reject('Unknown trusted helper accepted') { JobsStabilityCIDisk.verify_trust!(root) }
      puts 'PASS production helper and regression body trust / SourceFP mutation rejection'
    end
  end
  # 运行真实非零子命令并确认后续控制流不被执行。
  def failure_propagation
    helper = File.expand_path('../../jobs_stability_ci_disk.rb/jobs_stability_ci_disk.rb', __dir__)
    code = "require ARGV.shift; begin; JobsStabilityCIDisk::Manager.allocate.capture!('/bin/sh', '-c', 'exit 73'); puts 'WRONG CONTINUED'; rescue JobsStabilityCIDisk::CommandFailure => e; exit e.exit_status; end"
    output, status = Open3.capture2e(RbConfig.ruby, '-e', code, helper)
    check(status.exitstatus == 73 && !output.include?('WRONG CONTINUED'), 'Subprocess failure was masked')
    _, status = Open3.capture2e({ 'CI' => nil, 'GITHUB_ACTIONS' => nil }, RbConfig.ruby, helper, '--ci', 'prepare')
    check(!status.success?, 'Non-CI destructive entry allowed')
    fixture do |manager, _root, temp|
      manager.run('prepare')
      manager.define_singleton_method(:capture!) { |*_args| raise Errno::ENOSPC, 'fixture sample failure' }
      reject('Sampling failure accepted') { manager.run('rust') }
      report = JSON.parse(File.read(File.join(temp, 'JobsCIDisk-123-1/rust.json')))
      check(report['exit_status'] != 0 && !report['valid'], 'Sampling failure receipt became success')
    end
    fixture do |manager, _root, temp|
      manager.run('prepare')
      output = File.join(temp, 'JobsOCStability')
      put(File.join(output, 'results.json'), JSON.generate('source_fingerprint' => 'f' * 64, 'results' => %w[Debug Release].map { |c| row('app', 'JobsOCBaseConfigDemo', c) }))
      sentinel = put(File.join(output, 'DerivedData/real-object'))
      manager.define_singleton_method(:remove!) { |_path| raise Errno::EACCES, 'fixture cleanup failure' }
      reject('Removal failure accepted') { manager.run('app') }
      report = JSON.parse(File.read(File.join(temp, 'JobsCIDisk-123-1/app.json')))
      check(report['exit_status'] != 0 && !report['valid'] && File.file?(sentinel), 'Removal failure was hidden or continued')
    end
    fixture do |manager, _root, temp|
      original = manager.method(:sample)
      manager.define_singleton_method(:sample) { original.call.merge('available_bytes' => 0) }
      reject('Low-space phase accepted') { manager.run('prepare') }
      report = JSON.parse(File.read(File.join(temp, 'JobsCIDisk-123-1/prepare.json')))
      check(report['exit_status'] != 0 && !report['valid'] && report['error'].include?('Insufficient disk'), 'Low space became success')
    end
    fixture do |manager, _root, _temp|
      manager.run('prepare')
      manager.define_singleton_method(:sample) { capture!('/bin/sh', '-c', 'exit 73') }
      manager.define_singleton_method(:write_report) { |_phase, _report| raise Errno::ENOSPC, 'fixture receipt failure' }
      status = nil
      begin
        manager.run('rust')
      rescue JobsStabilityCIDisk::CommandFailure => error
        status = error.exit_status
      end
      check(status == 73, 'Receipt failure replaced the real process exit 73')
    end
    puts 'PASS real child exit 73, blocked continuation, explicit CI entry and failed sampling receipt'
  end
  # 只编排本临时夹具，不构建或下载依赖。
  def main
    lifecycle
    safety
    provenance
    failure_propagation
    puts "PASS CI disk cleanup regression: #{@negative_count} guarded rejection cases; actual child exit 73 and non-CI entry separately verified"
  end
end

CIDiskRegression.main
