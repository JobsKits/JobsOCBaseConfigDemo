# Select an available iPhone from the selected Xcode SDK generation, without booting or changing devices.
require 'json'
require 'rubygems/version'

module JobsSimulatorSelection
  IOS_RUNTIME = /\Acom\.apple\.CoreSimulator\.SimRuntime\.iOS-\d+(?:-\d+)*\z/.freeze
  IPHONE_TYPE = 'com.apple.CoreSimulator.SimDeviceType.iPhone-'.freeze
  UUID = /\A[0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12}\z/i.freeze

  # Parse numeric SDK/runtime versions so 26.10 sorts after 26.9.
  def self.version(value)
    return nil unless value.is_a?(String) && value.match?(/\A\d+(?:\.\d+)*\z/)

    Gem::Version.new(value)
  end

  # Join devices to runtimes before sorting; a newer runtime with no iPhone is not a candidate.
  def self.select(sdk_version, runtimes, device_groups)
    sdk = version(sdk_version)
    raise ArgumentError, "Invalid Simulator SDK version: #{sdk_version.inspect}" unless sdk

    candidates = runtimes.flat_map do |runtime|
      identifier = runtime['identifier'].to_s
      current = version(runtime['version'])
      next [] unless identifier.match?(IOS_RUNTIME) && current && current.segments.first == sdk.segments.first
      next [] unless runtime['isAvailable'] == true
      next [] unless [nil, 'iOS', 'com.apple.platform.iphonesimulator'].include?(runtime['platform'])

      architectures = runtime['supportedArchitectures']
      next [] unless architectures.nil? || architectures.is_a?(Array) && architectures.include?('arm64')

      device_groups.fetch(identifier, []).map do |device|
        next unless device['isAvailable'] == true
        next unless device['deviceTypeIdentifier'].to_s.start_with?(IPHONE_TYPE)
        next unless device['udid'].to_s.match?(UUID)

        [current, runtime, device]
      end.compact
    end
    if candidates.empty?
      inventory = runtimes.map do |runtime|
        "#{runtime['identifier']} version=#{runtime['version']} available=#{runtime['isAvailable']}"
      end
      raise ArgumentError, "No available arm64 iPhone Simulator matching iOS SDK #{sdk_version}. " \
                           "Installed runtimes: #{inventory.join('; ')}"
    end

    newest = candidates.map(&:first).max
    selected = candidates.select { |row| row.first == newest }.min_by do |_, _, device|
      [device['state'] == 'Booted' ? 0 : 1, device['name'].to_s, device.fetch('udid')]
    end
    { runtime: selected[1], device: selected[2] }
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    raise ArgumentError, 'Usage: ruby select_simulator.rb SDK_VERSION RUNTIMES_JSON DEVICES_JSON' unless ARGV.length == 3

    sdk, runtimes_path, devices_path = ARGV
    selection = JobsSimulatorSelection.select(
      sdk,
      JSON.parse(File.read(runtimes_path)).fetch('runtimes'),
      JSON.parse(File.read(devices_path)).fetch('devices')
    )
    device = selection.fetch(:device)
    runtime = selection.fetch(:runtime)
    warn "Selected #{device.fetch('name').inspect}: iOS #{runtime.fetch('version')}, SDK #{sdk}, #{device.fetch('udid')}"
    puts "SIMULATOR_ID=#{device.fetch('udid')}"
    puts "SIMULATOR_RUNTIME=#{runtime.fetch('identifier')}"
    puts "SIMULATOR_OS_VERSION=#{runtime.fetch('version')}"
    puts "SIMULATOR_DESTINATION=platform=iOS Simulator,id=#{device.fetch('udid')},arch=arm64"
  rescue ArgumentError, KeyError, JSON::ParserError, SystemCallError => error
    warn "::error::#{error.message}"
    exit 1
  end
end
