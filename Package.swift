// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DMFirewall",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DMFirewall",
            targets: ["DMFirewall"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DMFirewallInternal",
            path: "Frameworks/DMFirewallInternal.xcframework"
        ),
        .target(
            name: "DMFirewall",
            dependencies: ["DMFirewallInternal"], // Add this dependency
            path: "Sources/DMFirewall",
            resources: [
                .copy("private_key.txt")
            ],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug))
            ]
        ),
        .testTarget(
            name: "DMFirewallTests",
            dependencies: ["DMFirewall"],
            path: "Tests/DMFirewallTests"
        )
    ]
)
