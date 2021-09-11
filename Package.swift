// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "TfNSW",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15)
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
