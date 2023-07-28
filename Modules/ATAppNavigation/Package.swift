// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ATAppNavigation",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ATAppNavigation",
            targets: ["ATAppNavigation"]),
    ],
    dependencies: [
        .package(path: "../ATInterfacesKit"),
        .package(path: "../ATNetworkingKit"),
        .package(path: "../ATPostsKit"),
        .package(path: "../ATUsersKit")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ATAppNavigation",
            dependencies: ["ATInterfacesKit", "ATNetworkingKit", "ATPostsKit", "ATUsersKit"]
        ),
        .testTarget(
            name: "ATAppNavigationTests",
            dependencies: ["ATAppNavigation", "ATInterfacesKit", "ATNetworkingKit", "ATPostsKit", "ATUsersKit"]
        ),
    ]
)
