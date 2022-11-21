// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "TfNSW",
  platforms: [
    .iOS(.v13)
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
      url: "https://github.com/malcommac/SwiftDate.git",
      from: "7.0.0"
    )
  ],
  targets: [
    .target(
      name: "TfNSW",
      dependencies: [
        "SwiftDate"
      ]
    )
  ]
)
