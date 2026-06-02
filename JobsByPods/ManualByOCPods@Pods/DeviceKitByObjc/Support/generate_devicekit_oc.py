#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
from pathlib import Path
from typing import Dict, List

ROOT = Path(__file__).resolve().parents[1]
SWIFT = ROOT / "Tools" / "Device.generated.swift"
OUT  = ROOT / "Sources" / "Generated"

def read_text(p: Path) -> str:
    return p.read_text(encoding="utf-8")

def extract_brace_block(s: str, func_name: str) -> str:
    m = re.search(rf'func\s+{re.escape(func_name)}\b[^\{{]*\{{', s)
    if not m:
        raise RuntimeError(f"Cannot find func {func_name}")
    start = s.find("{", m.start())
    depth = 0
    for i in range(start, len(s)):
        if s[i] == "{":
            depth += 1
        elif s[i] == "}":
            depth -= 1
            if depth == 0:
                return s[start:i+1]
    raise RuntimeError("brace not balanced")

def extract_device_cases(swift: str) -> List[str]:
    m = re.search(r'public\s+enum\s+Device\s*\{', swift)
    if not m:
        raise RuntimeError("Cannot find 'public enum Device'")
    start = swift.find("{", m.start())
    depth = 0
    end = None
    for i in range(start, len(swift)):
        if swift[i] == "{":
            depth += 1
        elif swift[i] == "}":
            depth -= 1
            if depth == 0:
                end = i+1
                break
    if end is None:
        raise RuntimeError("Device enum brace not balanced")
    block = swift[start:end]

    cases = []
    for line in block.splitlines():
        line = line.strip()
        if not line.startswith("case "):
            continue
        rest = line[len("case "):].strip()
        parts = [p.strip() for p in rest.split(",")]
        for p in parts:
            name = re.sub(r'\(.*\)$', '', p).strip()
            if name in ("simulator", "unknown"):
                continue
            if name and re.match(r'^[A-Za-z_]\w*$', name):
                cases.append(name)

    seen = set()
    out = []
    for c in cases:
        if c not in seen:
            seen.add(c)
            out.append(c)
    return out

def extract_identifier_map(swift: str) -> Dict[str, str]:
    block = extract_brace_block(swift, "mapToDevice")
    pairs = re.findall(r'case\s+"([^"]+)"\s*:\s*return\s+([A-Za-z_]\w*)', block)
    mapp: Dict[str, str] = {}
    for ident, dev in pairs:
        mapp[ident] = dev

    multi = re.findall(r'case\s+((?:\"[^\"]+\"\s*,\s*)+\"[^\"]+\")\s*:\s*return\s+([A-Za-z_]\w*)', block)
    for group, dev in multi:
        idents = re.findall(r'"([^"]+)"', group)
        for ident in idents:
            mapp[ident] = dev

    return mapp

def extract_description_map(swift: str) -> Dict[str, str]:
    m = re.search(r'var\s+description\s*:\s*String\s*\{', swift)
    if not m:
        return {}
    start = swift.find("{", m.start())
    depth = 0
    end = None
    for i in range(start, len(swift)):
        if swift[i] == "{":
            depth += 1
        elif swift[i] == "}":
            depth -= 1
            if depth == 0:
                end = i+1
                break
    if end is None:
        return {}
    block = swift[start:end]
    pairs = re.findall(r'case\s+\.([A-Za-z_]\w*)\s*:\s*return\s*\"([^\"]*)\"', block)
    return {dev: desc for dev, desc in pairs}

def oc_escape(s: str) -> str:
    return s.replace('\\', '\\\\').replace('"', '\\"')

def write(path: Path, content: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")

def gen_device_type_h(cases: List[str]):
    enum_items = "\n".join([f"    DKDeviceType{c}," for c in cases])
    h = f'''#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DKDeviceType) {{
    DKDeviceTypeUnknown = 0,
    DKDeviceTypeSimulator,
{enum_items}
}};

FOUNDATION_EXPORT NSString *DKDeviceTypeDescription(DKDeviceType type, id _Nullable simulatedDevice, NSString * _Nullable unknownIdentifier);
FOUNDATION_EXPORT NSUInteger DKApplePencilSupportForType(DKDeviceType type, id _Nullable simulatedDevice, NSString * _Nullable unknownIdentifier);
'''
    write(OUT / "DKDeviceType.h", h)

def gen_identifier_map(mapp: Dict[str, str]):
    write(OUT / "DKIdentifierMap.h", '#import <Foundation/Foundation.h>\n@class DKDevice;\nFOUNDATION_EXPORT DKDevice *DKMapIdentifierToDevice(NSString *identifier);\n')

    items = []
    for ident in sorted(mapp.keys()):
        items.append(f'        @"{oc_escape(ident)}": @"{oc_escape(mapp[ident])}",')
    dict_body = "\n".join(items)

    uniq_devs = sorted(set(mapp.values()))

    m = f'''#import "DKIdentifierMap.h"
#import "DKDevice.h"
#import "DKDeviceType.h"

static NSDictionary<NSString *, NSString *> *DKIdentifierToCaseNameMap(void) {{
    static NSDictionary<NSString *, NSString *> *m;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = @{{
{dict_body}
        }};
    }});
    return m;
}}

static BOOL DKIsSimulatorArch(NSString *identifier) {{
    return [identifier isEqualToString:@"i386"] || [identifier isEqualToString:@"x86_64"] || [identifier isEqualToString:@"arm64"];
}}

static DKDeviceType DKCaseNameToType(NSString *caseName) {{
    if (!caseName.length) return DKDeviceTypeUnknown;
'''
    for dev in uniq_devs:
        m += f'    if ([caseName isEqualToString:@"{oc_escape(dev)}"]) return DKDeviceType{dev};\n'
    m += '''    return DKDeviceTypeUnknown;
}

DKDevice *DKMapIdentifierToDevice(NSString *identifier) {
    if (!identifier.length) return [DKDevice unknownWithIdentifier:@"unknown"];

    if (DKIsSimulatorArch(identifier)) {
        NSString *simID = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
        if (!simID.length) simID = @"iOS";
        DKDevice *inner = DKMapIdentifierToDevice(simID);
        return [DKDevice simulatorWithSimulatedDevice:inner];
    }

    NSString *caseName = DKIdentifierToCaseNameMap()[identifier];
    if (!caseName.length) return [DKDevice unknownWithIdentifier:identifier];

    DKDevice *d = [DKDevice new];
    d.type = DKCaseNameToType(caseName);
    d.identifier = identifier;
    return d;
}
'''
    write(OUT / "DKIdentifierMap.m", m)

def gen_device_type_m(desc_map: Dict[str, str], cases: List[str]):
    m = '''#import "DKDeviceType.h"
#import "DKDevice.h"

NSString *DKDeviceTypeDescription(DKDeviceType type, id _Nullable simulatedDevice, NSString * _Nullable unknownIdentifier) {
    switch (type) {
        case DKDeviceTypeSimulator: {
            DKDevice *d = (DKDevice *)simulatedDevice;
            if (d) return [NSString stringWithFormat:@"Simulator (%@)", d.deviceDescription ?: @"Unknown"];
            return @"Simulator";
        }
        case DKDeviceTypeUnknown:
            return unknownIdentifier.length ? unknownIdentifier : @"unknown";
'''
    for c in cases:
        desc = desc_map.get(c, c)
        m += f'        case DKDeviceType{c}: return @"{oc_escape(desc)}";\n'
    m += '''    }
    return @"unknown";
}

NSUInteger DKApplePencilSupportForType(DKDeviceType type, id _Nullable simulatedDevice, NSString * _Nullable unknownIdentifier) {
    // TODO: extend generator to parse Swift applePencilSupport switch and generate full logic here.
    (void)type; (void)simulatedDevice; (void)unknownIdentifier;
    return 0;
}
'''
    write(OUT / "DKDeviceType.m", m)

def main():
    swift = read_text(SWIFT)
    cases = extract_device_cases(swift)
    idmap = extract_identifier_map(swift)
    desc  = extract_description_map(swift)

    gen_device_type_h(cases)
    gen_identifier_map(idmap)
    gen_device_type_m(desc, cases)

    print(f"[OK] Generated {len(cases)} cases, {len(idmap)} identifier mappings into {OUT}")

if __name__ == "__main__":
    main()
