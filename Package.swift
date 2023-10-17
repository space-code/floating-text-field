// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FloatingTextField",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "FloatingTextField", targets: ["FloatingTextField"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.12.0"
        ),
    ],
    targets: [
        .target(name: "FloatingTextField", dependencies: []),
        .testTarget(
            name: "FloatingTextFieldTests",
            dependencies: [
                "FloatingTextField",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
    ]
)
