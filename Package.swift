// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Yammit",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Yammit",
            targets: ["Yammit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.6"),
        .package(name: "Swog", url: "https://github.com/ericrabil/swog", from: "1.0.1")
    ],
    targets: [
        .target(
            name: "Yammit",
            dependencies: ["Yams", "Swog"]),
        .testTarget(
            name: "YammitTests",
            dependencies: ["Yammit"]),
    ]
)
