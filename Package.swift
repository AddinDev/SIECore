// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SIECore",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "SIECore",
      targets: ["SIECore"]),
  ],
  dependencies: [
    .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", from: "5.4.4")
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "SIECore",
      dependencies: [
        .product(name: "RealmSwift", package: "Realm"),
      ]),
    .testTarget(
      name: "SIECoreTests",
      dependencies: ["SIECore"]),
  ]
)
