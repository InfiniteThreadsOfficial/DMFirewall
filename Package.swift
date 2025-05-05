// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DMFirewall",
    platforms: [.iOS("15.6")],
    products: [
        .library(
            name: "DMFirewall",
            targets: ["DMFirewall"]
        ),
    ],
    targets: [
        .target(
            name: "DMFirewall",
            dependencies: [],
            path: "Sources/DMFirewall",
            exclude: ["Private"],
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
