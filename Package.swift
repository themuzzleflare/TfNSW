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
  targets: [
    .target(
      name: "TfNSW"
    )
  ]
)
