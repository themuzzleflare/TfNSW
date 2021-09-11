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
    ),
    .package(
      url: "https://github.com/vapor/vapor.git",
      from: "4.48.5"
    )
  ],
  targets: [
    .target(
      name: "TfNSW",
      dependencies: [
        "SwiftDate",
        .product(
          name: "Vapor",
          package: "vapor",
          condition: .when(
            platforms: [
              .macOS
            ]
          )
        )
      ]
    )
  ]
)
