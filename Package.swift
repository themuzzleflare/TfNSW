// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TfNSW",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "TfNSW",
      targets: [
        "TfNSW"
      ]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-algorithms",
      from: "1.0.0"
    ),
    .package(
      url: "https://github.com/malcommac/SwiftDate.git",
      from: "7.0.0"
    )
  ],
  targets: [
    .target(
      name: "TfNSW",
      dependencies: [
        .product(
          name: "Algorithms",
          package: "swift-algorithms"
        ),
        "SwiftDate"
      ]
    )
  ]
)
