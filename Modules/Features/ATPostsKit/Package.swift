// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ATPostsKit",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ATPostsKit",
            targets: ["ATPostsKit"]),
    ],
    dependencies: [
        .package(path: "../ATInterfacesKit"),
        .package(path: "../ATNetworkingKit"),
        .package(path: "../ATDataModel"),
        .package(path: "../ATUIKit")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ATPostsKit",
            dependencies: ["ATInterfacesKit", "ATNetworkingKit", "ATDataModel", "ATUIKit"]
        ),
        .testTarget(
            name: "ATPostsKitTests",
            dependencies: ["ATPostsKit", "ATInterfacesKit", "ATNetworkingKit", "ATDataModel", "ATUIKit"]),
    ]
)
