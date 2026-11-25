// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SkyLoomAPI",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SkyLoomModel",
            targets: ["SkyLoomModel"]),
        .library(
            name: "SkyLoomEnum",
            targets: ["SkyLoomEnum"]
        ),
        .library(
            name: "SkyLoomService",
            targets: ["SkyLoomService"]
        ),
        .library(
            name: "SkyLoomLogger",
            targets: ["SkyLoomLogger"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hishd/NetworkingService", .upToNextMajor(from: "1.0.7")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "SkyLoomModel", dependencies: ["SkyLoomEnum"]),
        .target(name: "SkyLoomEnum"),
        .target(name: "SkyLoomService", dependencies: ["SkyLoomModel", "NetworkingService", "SkyLoomLogger"]),
        .target(name: "SkyLoomLogger"),
        .testTarget(
            name: "SkyLoomAPITests"
        ),
    ]
)
