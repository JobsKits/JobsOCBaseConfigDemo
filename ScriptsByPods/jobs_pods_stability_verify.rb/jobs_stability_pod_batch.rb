# CI 的单一依赖图只包含选中的自建 Pod，保留 aggregate / header-only target 的原始语义。
require 'digest'
require 'fileutils'
require 'json'
require 'pathname'
require 'rexml/document'

module JobsStabilityPodBatch
  SCHEMA = 'jobs-owned-pods-batch-v1'.freeze
  NAME = 'JobsOwnedPods'.freeze

  def self.membership_fingerprint(targets)
    Digest::SHA256.hexdigest(JSON.generate(targets))
  end

  def self.prepare(root, names, output)
    require 'xcodeproj'
    root = File.realpath(root)
    project_path = File.join(root, 'Pods', 'Pods.xcodeproj')
    project = Xcodeproj::Project.open(project_path)
    raise '批量构建的 Pod 名称为空或重复' if names.empty? || names.uniq != names
    targets = names.sort.map do |name|
      matching = project.targets.select { |target| target.name == name }
      raise "批量构建缺少唯一 Pod target: #{name}" unless matching.size == 1
      target = matching.first
      unless %w[PBXNativeTarget PBXAggregateTarget].include?(target.isa)
        raise "批量构建不支持 target 类型: #{name} #{target.isa}"
      end
      if target.isa == 'PBXNativeTarget' &&
         !%w[com.apple.product-type.framework com.apple.product-type.library.static].include?(target.product_type)
        raise "自建 Pod 不能指向测试、宿主或资源 bundle target: #{name}"
      end
      target
    end
    members = targets.map do |target|
      {
        'name' => target.name, 'uuid' => target.uuid, 'isa' => target.isa,
        'product_type' => target.respond_to?(:product_type) ? target.product_type : nil,
        'product_name' => target.respond_to?(:product_reference) ? target.product_reference&.path : nil
      }
    end
    fingerprint = membership_fingerprint(members)
    folder = File.join(File.expand_path(output), 'OwnedPodsBatch', fingerprint)
    workspace = File.join(folder, "#{NAME}.xcworkspace")
    relative_project = Pathname.new(project_path).relative_path_from(Pathname.new(folder)).to_s
    scheme = Xcodeproj::XCScheme.new
    targets.each { |target| scheme.add_build_target(target) }
    # 构建图不携带测试或 App host；aggregate 使用真实 target 名，不伪造 framework。
    scheme.doc.root.elements.to_a.reject { |element| element.name == 'BuildAction' }.each do |element|
      scheme.doc.root.delete_element(element)
    end
    scheme.doc.elements.each('Scheme/BuildAction/BuildActionEntries/BuildActionEntry') do |entry|
      entry.attributes['buildForTesting'] = 'NO'
      entry.attributes['buildForProfiling'] = 'NO'
      entry.attributes['buildForArchiving'] = 'NO'
      entry.attributes['buildForAnalyzing'] = 'NO'
      entry.elements['BuildableReference'].attributes['ReferencedContainer'] = "container:#{relative_project}"
    end
    workspace_document = REXML::Document.new
    workspace_document.add_element('Workspace', { 'version' => '1.0' })
      .add_element('FileRef', { 'location' => "group:#{relative_project}" })
    FileUtils.mkdir_p(workspace)
    File.write(File.join(workspace, 'contents.xcworkspacedata'), workspace_document.to_s + "\n")
    scheme.save_as(workspace, NAME, true)
    scheme_path = File.join(workspace, 'xcshareddata', 'xcschemes', "#{NAME}.xcscheme")
    manifest = {
      'schema' => SCHEMA, 'name' => NAME, 'workspace' => workspace,
      'scheme' => scheme_path, 'project' => project_path, 'targets' => members,
      'membership_fingerprint' => fingerprint,
      'scheme_sha256' => Digest::SHA256.file(scheme_path).hexdigest,
      'workspace_sha256' => Digest::SHA256.file(File.join(workspace, 'contents.xcworkspacedata')).hexdigest
    }
    manifest_path = File.join(folder, 'manifest.json')
    File.write(manifest_path, JSON.pretty_generate(manifest) + "\n")
    manifest.merge('manifest' => manifest_path, 'manifest_sha256' => Digest::SHA256.file(manifest_path).hexdigest)
  end

  # 缓存与 README 回填都必须持有成功批次、完整成员清单和当次 Scheme 的文件证据。
  def self.evidence_errors(batch, root)
    return ['批量进程记录缺失'] unless batch.is_a?(Hash)
    errors = []
    valid_process = batch['kind'] == 'pod_batch' && batch['execution_mode'] == 'batch' &&
      batch['exit_status'] == 0 && batch['source_consistent'] == true &&
      batch['process_exit_status'] == 0 && batch['process_status_collected'] == true &&
      batch['timed_out'] == false && batch['signing_policy'] == 'unsigned'
    errors << '批量进程没有完整成功退出' unless valid_process
    log = batch['log']
    errors << '批量日志缺失' unless log.is_a?(String) && File.file?(File.expand_path(log, root))
    manifest_path = batch['batch_manifest']
    unless manifest_path.is_a?(String) && File.file?(File.expand_path(manifest_path, root))
      return errors + ['批量成员 manifest 缺失']
    end
    manifest_path = File.expand_path(manifest_path, root)
    errors << '批量 manifest 指纹不符' unless Digest::SHA256.file(manifest_path).hexdigest == batch['batch_manifest_sha256']
    manifest = JSON.parse(File.read(manifest_path))
    targets = manifest['targets']
    valid_members = targets.is_a?(Array) && !targets.empty? &&
      targets.all? do |target|
        target.is_a?(Hash) && target['name'].is_a?(String) && target['uuid'].is_a?(String) &&
          ((target['isa'] == 'PBXAggregateTarget' && target['product_name'].nil?) ||
           (target['isa'] == 'PBXNativeTarget' && target['product_name'].is_a?(String) &&
            %w[com.apple.product-type.framework com.apple.product-type.library.static].include?(target['product_type'])))
      end &&
      targets.map { |target| target['name'] }.uniq.size == targets.size &&
      targets.map { |target| target['uuid'] }.uniq.size == targets.size
    unless valid_members && manifest['schema'] == SCHEMA
      return errors + ['批量成员 manifest 结构非法']
    end
    fingerprint = membership_fingerprint(targets)
    unless batch['members'] == targets && manifest['membership_fingerprint'] == fingerprint && batch['membership_fingerprint'] == fingerprint
      errors << '批量成员清单不一致'
    end
    scheme_path = manifest['scheme']
    workspace_path = manifest['workspace']
    unless scheme_path.is_a?(String) && File.file?(scheme_path) && workspace_path.is_a?(String) &&
           File.file?(File.join(workspace_path, 'contents.xcworkspacedata'))
      return errors + ['批量 Scheme / workspace 证据缺失']
    end
    errors << '批量 Scheme 指纹不符' unless Digest::SHA256.file(scheme_path).hexdigest == manifest['scheme_sha256']
    errors << '批量 workspace 指纹不符' unless Digest::SHA256.file(File.join(workspace_path, 'contents.xcworkspacedata')).hexdigest == manifest['workspace_sha256']
    project_path = File.join(File.realpath(root), 'Pods', 'Pods.xcodeproj')
    workspace = REXML::Document.new(File.read(File.join(workspace_path, 'contents.xcworkspacedata')))
    project_references = workspace.get_elements('Workspace/FileRef')
    valid_project = manifest['project'] == project_path && project_references.size == 1 &&
      project_references.first.attributes['location'].to_s.start_with?('group:') &&
      File.expand_path(project_references.first.attributes['location'].delete_prefix('group:'), File.dirname(workspace_path)) == project_path
    errors << '批量 workspace 没有指向当前 Pods 工程' unless valid_project
    document = REXML::Document.new(File.read(scheme_path))
    entries = document.get_elements('Scheme/BuildAction/BuildActionEntries/BuildActionEntry')
    references = entries.map { |entry| entry.elements['BuildableReference'] }.compact
    actual_members = references.map { |reference| [reference.attributes['BlueprintName'], reference.attributes['BlueprintIdentifier']] }
    expected_members = targets.map { |target| target.values_at('name', 'uuid') }
    errors << '批量 Scheme 的真实成员与 manifest 不符' unless actual_members == expected_members
    valid_entries = entries.size == targets.size && entries.each_with_index.all? do |entry, index|
      reference = entry.elements['BuildableReference']
      target = targets[index]
      reference && entry.attributes['buildForRunning'] == 'YES' && entry.attributes['buildForTesting'] == 'NO' &&
        reference.attributes['ReferencedContainer'].to_s.start_with?('container:') &&
        File.expand_path(reference.attributes['ReferencedContainer'].delete_prefix('container:'), File.dirname(workspace_path)) == project_path &&
        reference.attributes['BuildableName'] == (target['product_name'] || target['name'])
    end
    errors << '批量 Scheme 含未启用或错误归属的 target' unless valid_entries
    command = batch['command']
    command_matches = command.is_a?(Array) && command.first == 'xcodebuild' && command.last == 'build' &&
      %w[-alltargets -dry-run -showBuildSettings -list].none? { |flag| command.include?(flag) } &&
      { '-workspace' => workspace_path, '-scheme' => NAME, '-configuration' => batch['configuration'] }.all? do |flag, value|
        command.count(flag) == 1 && command[command.index(flag) + 1] == value
      end
    errors << '批量命令与成员 Scheme / 配置不一致' unless command_matches
    errors
  rescue JSON::ParserError, REXML::ParseException, SystemCallError, TypeError => error
    ["批量证据无法读取: #{error.message}"]
  end

  def self.member_errors(record, member, root)
    batch = record.fetch('results').reverse.find do |row|
      row['kind'] == 'pod_batch' && row['batch_id'] == member['batch_id'] &&
        row['source_fingerprint'] == member['source_fingerprint'] && row['configuration'] == member['configuration']
    end
    errors = evidence_errors(batch, root)
    return errors unless batch
    target = batch.fetch('members', []).find { |entry| entry['name'] == member['name'] && entry['uuid'] == member['target_uuid'] }
    errors << 'Pod 没有出现在该批次中' unless target
    unless member['source_consistent'] == true && member['exit_status'] == batch['exit_status'] &&
           member['log'] == batch['log'] && member['batch_manifest'] == batch['batch_manifest'] &&
           member['seconds'].nil? && member['membership_fingerprint'] == batch['membership_fingerprint']
      errors << 'Pod 的批量覆盖证据不一致'
    end
    errors
  end
end
