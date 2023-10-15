// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftProtocolExtension",
    products: [
        .library(
            name: "SwiftProtocolExtension",
            targets: ["SwiftProtocolExtension"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftProtocolExtension"
        ),
        .testTarget(
            name: "SwiftProtocolExtensionTests",
            dependencies: ["SwiftProtocolExtension"]
        ),
    ]
)
