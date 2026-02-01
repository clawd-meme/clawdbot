// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ClawdbotKit",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
    ],
    products: [
        .library(name: "ClawdbotProtocol", targets: ["ClawdbotProtocol"]),
        .library(name: "ClawdbotKit", targets: ["ClawdbotKit"]),
        .library(name: "ClawdbotChatUI", targets: ["ClawdbotChatUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/steipete/ElevenLabsKit", exact: "0.1.0"),
        .package(url: "https://github.com/gonzalezreal/textual", exact: "0.3.1"),
    ],
    targets: [
        .target(
            name: "ClawdbotProtocol",
            path: "Sources/ClawdbotProtocol",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .target(
            name: "ClawdbotKit",
            dependencies: [
                "ClawdbotProtocol",
                .product(name: "ElevenLabsKit", package: "ElevenLabsKit"),
            ],
            path: "Sources/ClawdbotKit",
            resources: [
                .process("Resources"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .target(
            name: "ClawdbotChatUI",
            dependencies: [
                "ClawdbotKit",
                .product(
                    name: "Textual",
                    package: "textual",
                    condition: .when(platforms: [.macOS, .iOS])),
            ],
            path: "Sources/ClawdbotChatUI",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]),
        .testTarget(
            name: "ClawdbotKitTests",
            dependencies: ["ClawdbotKit", "ClawdbotChatUI"],
            path: "Tests/ClawdbotKitTests",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
                .enableExperimentalFeature("SwiftTesting"),
            ]),
    ])
