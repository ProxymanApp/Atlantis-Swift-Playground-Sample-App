// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dependencies",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Dependencies",
            targets: ["Dependencies"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Dependencies",
            dependencies: []),
        .testTarget(
            name: "DependenciesTests",
            dependencies: ["Dependencies"]),
    ]
)

package.dependencies = [
    .package(name: "Atlantis", url: "https://github.com/ProxymanApp/atlantis", revision: "eba542f71d1db80a0b94d97a207400bd2b66a3b6")
]
package.targets = [
    .target(name: "Dependencies",
        dependencies: [
            .product(name: "Atlantis", package: "Atlantis")
        ]
    )
]
package.platforms = [
    .iOS("13.0"),
    .macOS("10.15"),
    .tvOS("13.0")
]
