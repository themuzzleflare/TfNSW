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
      name: "SwiftDate",
      url: "https://github.com/malcommac/SwiftDate.git",
      from: "6.3.1"
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
