// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "RangeSeekSlider",
    products: [
        .library(
            name: "RangeSeekSlider",
            targets: ["RangeSeekSlider"]),
    ],
    dependencies: [],
    targets:[
        .target(
            name: "RangeSeekSlider",
            path: "Sources"
        )
    ]
)
