# 从实际Simulator宿主Mach-O提取每个架构的编译后权限，不读取源entitlement或.xcent。
require 'digest'
require 'json'
require 'open3'
require 'tmpdir'

module JobsStabilityHostEntitlements
  module_function

  # 所有架构必须具备宿主自身的三项Keychain权限；codesign签名验证仍由调用方负责。
  def audit(binary, bundle_identifier:)
    result = { 'binary' => binary, 'valid' => false, 'architectures' => [] }
    path = File.expand_path(binary)
    result['binary'] = path
    raise ArgumentError, 'bundle identifier must be a nonempty String' unless bundle_identifier.is_a?(String) && !bundle_identifier.empty?
    raise ArgumentError, 'compiled binary must be a readable file' unless File.file?(path) && File.readable?(path)
    result['binary_sha256'] = Digest::SHA256.file(path).hexdigest
    arch_text = tool('/usr/bin/lipo', '-archs', path)
    architectures = arch_text.split
    unless !architectures.empty? && architectures.uniq == architectures && architectures.all? { |arch| arch.match?(/\A[a-zA-Z0-9_]+\z/) }
      raise ArgumentError, 'lipo returned an invalid architecture list'
    end
    Dir.mktmpdir('jobs-host-entitlements-') do |folder|
      architectures.each do |architecture|
        row = { 'architecture' => architecture, 'valid' => false }
        result['architectures'] << row
        begin
          thin = path
          if architectures.size > 1
            thin = File.join(folder, architecture)
            tool('/usr/bin/lipo', path, '-thin', architecture, '-output', thin)
          end
          validate_executable(thin)
          load_commands = tool('/usr/bin/otool', '-l', thin)
          sections = load_commands.split(/^\s*(?:Section|Load command \d+)\s*$/)
          simulator = sections.any? do |block|
            block.match?(/^\s*cmd\s+LC_BUILD_VERSION\s*$/) && block.match?(/^\s*platform\s+7\s*$/)
          end
          raise ArgumentError, 'compiled executable is not an iOS Simulator build' unless simulator
          matching = sections.select do |block|
            block.match?(/^\s*sectname\s+__entitlements\s*$/) && block.match?(/^\s*segname\s+__TEXT\s*$/)
          end
          raise ArgumentError, 'expected exactly one __TEXT,__entitlements section' unless matching.size == 1
          offsets = matching.first.scan(/^\s*offset\s+(-?\d+)\s*$/).flatten
          sizes = matching.first.scan(/^\s*size\s+(0x[0-9a-fA-F]+)\s*$/).flatten
          raise ArgumentError, 'section offset/size metadata is missing or ambiguous' unless offsets.size == 1 && sizes.size == 1
          offset = Integer(offsets.first, 10)
          size = Integer(sizes.first, 16)
          row['section'] = { 'offset' => offset, 'size' => size }
          length = File.size(thin)
          unless offset >= 32 && size.positive? && size <= 1024 * 1024 && offset <= length && size <= length - offset
            raise ArgumentError, 'compiled entitlement section is empty, oversized or outside binary bounds'
          end
          bytes = File.open(thin, 'rb') do |input|
            input.seek(offset)
            input.read(size)
          end
          raise ArgumentError, 'compiled entitlement section was truncated while reading' unless bytes && bytes.bytesize == size
          json = tool('/usr/bin/plutil', '-convert', 'json', '-o', '-', '--', '-', stdin_data: bytes)
          entitlements = JSON.parse(json)
          raise ArgumentError, 'compiled entitlement property list must be a dictionary' unless entitlements.is_a?(Hash)
          row['entitlements'] = entitlements
          row['valid'] = entitlements['application-identifier'] == bundle_identifier &&
            entitlements['keychain-access-groups'] == [bundle_identifier] && entitlements['get-task-allow'] == true
          row['error'] = 'compiled entitlements do not match the host bundle identifier and Keychain contract' unless row['valid']
        rescue StandardError => error
          row['error'] = "#{error.class}: #{error.message}"
        end
      end
    end
    raise ArgumentError, 'compiled binary changed during entitlement audit' unless Digest::SHA256.file(path).hexdigest == result['binary_sha256']
    result['valid'] = result['architectures'].all? { |row| row['valid'] }
    result
  rescue StandardError => error
    result['error'] = "#{error.class}: #{error.message}"
    result
  end

  # MH_EXECUTE验证防止拿源plist或仅编译的object当实际宿主二进制。
  def validate_executable(path)
    header = File.binread(path, 16)
    magic = header.byteslice(0, 4)
    endian = if magic == [0xfeedfacf].pack('V')
      'V'
    elsif magic == [0xfeedfacf].pack('N')
      'N'
    end
    raise ArgumentError, 'expected a 64-bit Mach-O executable' unless endian && header.bytesize == 16 && header.byteslice(12, 4).unpack(endian).first == 2
  end

  # 只解析系统工具的成功输出；失败状态连同诊断进入审计记录。
  def tool(*command, stdin_data: nil)
    stdout, stderr, status = Open3.capture3(*command, stdin_data: stdin_data)
    raise ArgumentError, "#{File.basename(command.first)} failed (#{status.exitstatus}): #{stderr.strip[0, 500]}" unless status.success?
    stdout
  end
  private_class_method :validate_executable, :tool
end
