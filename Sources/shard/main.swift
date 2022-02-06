//
//  main.swift
//  Mac-Sharding
//
//  Created by Jim Zajkowski on 9/29/20.
//

import Foundation
import SwiftHash
import BigInt

func hardwareDeviceId() -> String? {
    let platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"))
    defer { IOObjectRelease(platformExpert) }

    guard platformExpert != 0 else { return nil }
    return IORegistryEntryCreateCFProperty(platformExpert, kIOPlatformUUIDKey as CFString, kCFAllocatorDefault, 0).takeRetainedValue() as? String
}

if let udid = hardwareDeviceId(),
    let md5 = BigInt(MD5(udid), radix: 16) {

    // modulo 100 to get 0-99, then add 1 to get 1-100
    let shard = (md5 % BigInt(100)) + BigInt(1)

    print(shard)
}
