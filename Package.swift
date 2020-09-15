// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
  name: "JzOsSqlHelper",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v9)
  ],
  products: [
    .library(
      name: "JzOsSqlHelper",
      targets: ["JzOsSqlHelper"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "JzOsSqlHelper",
      exclude: ["mydb.sqlite"],
      resources: [
        .process("Resources/mydb.sqlite")
      ]
    ),
    .testTarget(
      name: "JzOsSqlHelperTests",
      dependencies: ["JzOsSqlHelper"]
    )
  ]
)
