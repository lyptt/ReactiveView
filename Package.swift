// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "ReactiveView",
  products: [
    .library(
      name: "ReactiveView",
      targets: ["ReactiveView"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "ReactiveView",
      dependencies: []),
    .testTarget(
      name: "ReactiveViewTests",
      dependencies: ["ReactiveView"]),
  ]
)
