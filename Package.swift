// swift-tools-version:5.4
import PackageDescription

let package = Package(
  name: "RangeSeekSlider",
  platforms: [
    .iOS(.v10)
  ],
  products: [
    .library(name: "RangeSeekSlider", targets: ["RangeSeekSlider"])
  ],
  targets: [
    .target(name: "RangeSeekSlider", path: "Sources")
  ]
)
