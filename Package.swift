// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pangu",
    platforms: [.macOS(.v11),
                   .iOS(.v14),
                   .tvOS(.v14),
                   .watchOS(.v4),
                   .visionOS(.v1),
       ],
    products: [
        .library(
            name: "Pangu",
            targets: ["Pangu"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnpatrickmorgan/NavigationBackport", from: "0.9.3")
    ],
    targets: [
        .target(
            name: "Pangu",
            dependencies: [
                .product(name: "NavigationBackport", package: "NavigationBackport")
            ]),
        .testTarget(
            name: "PanguTests",
            dependencies: ["Pangu"]),
    ]
)
