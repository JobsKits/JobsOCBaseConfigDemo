require 'tmpdir'
require 'fileutils'
require_relative '../update_readme_results'

checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
Dir.mktmpdir('jobs-readme-evidence-tests-') do |folder|
  log = File.join(folder, 'test.log')
  File.write(log, 'fixture result evidence')
  bundle = File.join(folder, 'suite.xcresult')
  Dir.mkdir(bundle)
  fingerprint = 'a' * 64
  valid = {
    'kind' => 'test', 'name' => 'FixturePod', 'configuration' => 'Debug',
    'source_fingerprint' => fingerprint, 'source_consistent' => true,
    'exit_status' => 0, 'log' => log, 'result_bundle' => bundle,
    'simulator' => 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE',
    'test_summary' => { 'result' => 'Passed', 'totalTestCount' => 2, 'passedTests' => 2, 'failedTests' => 0, 'skippedTests' => 0 }
  }
  errors = []
  require_test(errors, { 'results' => [valid] }, fingerprint, folder, 'FixturePod', 'Debug')
  assert.call(errors.empty?, 'valid real-test evidence rejected')
  ['zero tests', 'all skipped', 'failed test', 'bad result', 'missing summary', 'missing bundle', 'missing simulator', 'wrong count', 'source changed', 'exit failure'].each do |scenario|
    row = Marshal.load(Marshal.dump(valid))
    case scenario
    when 'zero tests'
      row['test_summary'].merge!('totalTestCount' => 0, 'passedTests' => 0)
    when 'all skipped'
      row['test_summary'].merge!('passedTests' => 0, 'skippedTests' => 2)
    when 'failed test'
      row['test_summary'].merge!('passedTests' => 1, 'failedTests' => 1)
    when 'bad result'
      row['test_summary']['result'] = 'Failed'
    when 'missing summary'
      row.delete('test_summary')
    when 'missing bundle'
      row['result_bundle'] = File.join(folder, 'missing.xcresult')
    when 'missing simulator'
      row.delete('simulator')
    when 'wrong count'
      row['test_summary']['totalTestCount'] = 3
    when 'source changed'
      row['source_consistent'] = false
    when 'exit failure'
      row['exit_status'] = 76
    end
    errors = []
    require_test(errors, { 'results' => [row] }, fingerprint, folder, 'FixturePod', 'Debug')
    assert.call(!errors.empty?, "#{scenario} was accepted")
  end
  identifier = 'org.cocoapods.AppHost-JobsBaseUI-Unit-Tests'
  permissions = {
    'application-identifier' => identifier,
    'keychain-access-groups' => [identifier],
    'get-task-allow' => true
  }
  keychain = Marshal.load(Marshal.dump(valid))
  keychain.merge!(
    'name' => 'JobsBaseUI', 'signing_policy' => 'simulator-adhoc-keychain-v1',
    'host_signature' => {
      'bundle_identifier' => identifier, 'valid' => true,
      'codesign_exit_status' => 0, 'verification_exit_status' => 0,
      'code_signature_entitlements' => {},
      'permission_source' => 'simulator-binary-__TEXT-__entitlements',
      'compiled_permissions' => {
        'binary' => File.join(folder, 'AppHost-JobsBaseUI-Unit-Tests.app', 'AppHost-JobsBaseUI-Unit-Tests'),
        'valid' => true, 'binary_sha256' => 'c' * 64,
        'architectures' => %w[x86_64 arm64].map do |architecture|
          { 'architecture' => architecture, 'valid' => true,
            'section' => { 'offset' => 10116, 'size' => 438 },
            'entitlements' => Marshal.load(Marshal.dump(permissions)) }
        end
      }
    }
  )
  errors = []
  require_test(errors, { 'results' => [keychain] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
  assert.call(errors.empty?, 'actual-shaped all-architecture Simulator permission receipt rejected')
  signed_keychain = Marshal.load(Marshal.dump(keychain))
  signed_keychain['host_signature'].merge!(
    'permission_source' => 'code-signature', 'code_signature_entitlements' => permissions,
    'compiled_permissions' => nil
  )
  errors = []
  require_test(errors, { 'results' => [signed_keychain] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
  assert.call(errors.empty?, 'matching native code-signature permission receipt rejected')
  ['missing audit', 'false audit', 'partial skip', 'wrong policy', 'codesign failure',
   'verification failure', 'unknown permission source', 'missing compiled proof',
   'invalid sibling architecture', 'wrong compiled identity', 'missing binary hash'].each do |scenario|
    row = Marshal.load(Marshal.dump(keychain))
    case scenario
    when 'missing audit'
      row.delete('host_signature')
    when 'false audit'
      row['host_signature']['valid'] = false
    when 'partial skip'
      row['test_summary'].merge!('passedTests' => 1, 'skippedTests' => 1)
    when 'wrong policy'
      row['signing_policy'] = 'unsigned'
    when 'codesign failure'
      row['host_signature']['codesign_exit_status'] = 1
    when 'verification failure'
      row['host_signature']['verification_exit_status'] = 1
    when 'unknown permission source'
      row['host_signature']['permission_source'] = 'xcent-source'
    when 'missing compiled proof'
      row['host_signature']['compiled_permissions'] = nil
    when 'invalid sibling architecture'
      row['host_signature']['compiled_permissions']['architectures'].last['valid'] = false
    when 'wrong compiled identity'
      row['host_signature']['compiled_permissions']['architectures'].last['entitlements']['application-identifier'] = 'wrong.host'
    when 'missing binary hash'
      row['host_signature']['compiled_permissions'].delete('binary_sha256')
    end
    errors = []
    require_test(errors, { 'results' => [row] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
    assert.call(!errors.empty?, "Keychain #{scenario} was accepted")
  end
  row = Marshal.load(Marshal.dump(signed_keychain))
  row['host_signature']['code_signature_entitlements']['keychain-access-groups'] = ['wrong.host']
  errors = []
  require_test(errors, { 'results' => [row] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
  assert.call(!errors.empty?, 'wrong native code-signature identity was accepted')
  stale = valid.merge('source_fingerprint' => 'b' * 64)
  assert.call(latest_result({ 'results' => [stale] }, fingerprint, 'test', 'FixturePod', 'Debug').nil?, 'old hash accepted')
  failure = valid.merge('exit_status' => 1)
  assert.call(latest_result({ 'results' => [valid, failure] }, fingerprint, 'test', 'FixturePod', 'Debug')['exit_status'] == 1, 'latest failure was hidden by previous success')
  readme = File.join(folder, 'README.md')
  original = "# Fixture\n\n## 一、合同\n\n合同保持。\n\n## 二、本轮单元验证\n\n#{PENDING_PREFIX}原指纹门禁保持。\n\n## 三、边界\n\n仍待真机。\n"
  File.write(readme, original)
  replacement = "当前结果：**已完成；记录见根 #{RESULT_LINK}**。"
  before, updated = prepare_update(readme, replacement)
  assert.call(before == original && File.read(readme) == original, 'prepare mutated README')
  assert.call(updated == original.sub(PENDING_PREFIX, replacement), 'module contract changed')
  File.write(readme, original.sub(PENDING_PREFIX, replacement))
  rejected = false
  begin
    prepare_update(readme, replacement)
  rescue StandardError
    rejected = true
  end
  assert.call(rejected, 'already-filled README was overwritten')
  File.write(readme, original + "\n## 四、本轮单元验证\n#{PENDING_PREFIX}\n")
  rejected = false
  begin
    prepare_update(readme, replacement)
  rescue StandardError
    rejected = true
  end
  assert.call(rejected, 'duplicate chapter accepted')
end
puts "PASS #{checks} fixture checks; no project README changed and no build/install invoked"
