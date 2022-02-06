// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Darwin

let package = Package(
    name: "shard",
    platforms: [
        .macOS(.v10_14)
    ],
    dependencies: [
        .package(url: "https://github.com/onmyway133/SwiftHash.git", .upToNextMajor(from: "2.0.2")),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.2.1")

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "shard",
            dependencies: [
                "SwiftHash",
                "BigInt",
            ]),
    ]
)
