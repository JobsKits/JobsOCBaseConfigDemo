require_relative 'select_simulator'

def runtime(version, **attributes)
  { 'identifier' => "com.apple.CoreSimulator.SimRuntime.iOS-#{version.tr('.', '-')}",
    'version' => version, 'isAvailable' => true, 'supportedArchitectures' => ['arm64'] }.merge(attributes.transform_keys(&:to_s))
end

def iphone(number, **attributes)
  { 'udid' => format('00000000-0000-0000-0000-%012d', number), 'name' => "iPhone #{number}",
    'deviceTypeIdentifier' => 'com.apple.CoreSimulator.SimDeviceType.iPhone-17-Pro',
    'isAvailable' => true, 'state' => 'Shutdown' }.merge(attributes.transform_keys(&:to_s))
end

checks = 0
check = lambda do |condition, message|
  raise message unless condition

  checks += 1
end
select = ->(sdk, runtimes, devices) { JobsSimulatorSelection.select(sdk, runtimes, devices).fetch(:device).fetch('udid') }
old = runtime('18.5')
current = runtime('26.2')
current_id = current.fetch('identifier')
old_phone = iphone(1, state: 'Booted')
phone = iphone(2)
devices = { old.fetch('identifier') => [old_phone], current_id => [phone] }
check.call(select.call('26.2', [old, current], devices) == phone['udid'], 'Booted iOS 18.5 displaced the SDK generation')
check.call(select.call('26.2', [current, old], devices) == phone['udid'], 'JSON ordering changed selection')

older = runtime('26.9')
newer = runtime('26.10')
numeric = { older['identifier'] => [iphone(3, state: 'Booted')], newer['identifier'] => [iphone(4)] }
check.call(select.call('26.2', [older, newer], numeric) == iphone(4)['udid'], 'Runtime sorting is lexical')
check.call(select.call('26.2', [older, newer], { older['identifier'] => [iphone(3)] }) == iphone(3)['udid'], 'Empty newest runtime masked another matching runtime')

unavailable = runtime('26.11', isAvailable: false)
intel = runtime('26.12', supportedArchitectures: ['x86_64'])
wrong_platform = runtime('26.13', platform: 'tvOS')
tvos = runtime('26.14').merge('identifier' => 'com.apple.CoreSimulator.SimRuntime.tvOS-26-14')
inventory = [current, unavailable, intel, wrong_platform, tvos]
all_devices = inventory.to_h { |item| [item.fetch('identifier'), [iphone(5)]] }
all_devices[current_id] = [phone]
check.call(select.call('26.2', inventory, all_devices) == phone['udid'], 'Unavailable, Intel, or non-iOS runtime was accepted')

renamed_ipad = iphone(6, deviceTypeIdentifier: 'com.apple.CoreSimulator.SimDeviceType.iPad-Pro', state: 'Booted')
renamed_iphone = iphone(7, name: 'CI phone')
check.call(select.call('26.2', [current], { current_id => [renamed_ipad, renamed_iphone] }) == renamed_iphone['udid'], 'Device display name was used as its type')
check.call(select.call('26.2', [current], { current_id => [iphone(8, isAvailable: false), phone] }) == phone['udid'], 'Unavailable device was accepted')
check.call(select.call('26.2', [current], { current_id => [phone, iphone(9, state: 'Booted')] }) == iphone(9)['udid'], 'Booted preference within matching runtime was lost')
check.call(select.call('26.2', [current.reject { |key, _| key == 'supportedArchitectures' }], { current_id => [phone] }) == phone['udid'], 'Older runtime JSON schema was rejected')
check.call(select.call('26.2', [current], { current_id => [iphone(10, udid: "invalid\nINJECT=1"), phone] }) == phone['udid'], 'Invalid UDID was accepted')

[
  ['26.2', [old], { old['identifier'] => [old_phone] }],
  ['26.2', [current], { current_id => [iphone(11, isAvailable: false)] }],
  ['26.2', [current], {}],
  ["26.2\n", [current], { current_id => [phone] }]
].each do |arguments|
  rejected = false
  begin
    select.call(*arguments)
  rescue ArgumentError
    rejected = true
  end
  check.call(rejected, "Missing or invalid matching runtime did not fail: #{arguments.first.inspect}")
end
puts "Simulator selection: #{checks} checks PASS"
