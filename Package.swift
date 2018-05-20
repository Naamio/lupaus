// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Lupaus",
    products: [
        .library(
            name: "Lupaus",
            targets: ["Lupaus"]
        ),
    ],
    dependencies: [
          .package(url: "https://github.com/apple/swift-nio.git", from: "1.7.0"),
    ],
    targets: [
        .target(name: "Lupaus", dependencies: ["NIO"]),
        .testTarget(name: "LupausTests", dependencies: ["Lupaus"]),
    ]
)
