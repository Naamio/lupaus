// swift-tools-version:4.0
import PackageDescription

private func getTargetPath(_ name: String, for type: String) -> String {
    return "\(type)/\(name)"
}

private func getSourcePath(_ name: String) -> String {
    return getTargetPath(name, for: "Sources")
}

private func getTestPath(_ name: String) -> String {
    return getTargetPath(name, for: "Tests")
}


let package = Package(
    name: "Lupaus",
    products: [
        .library(
            name: "Lupaus",
            targets: ["LupausFutures"]
        ),
    ],
    dependencies: [
          .package(url: "https://github.com/apple/swift-nio.git", from: "1.7.0"),
    ],
    targets: [
        .target(
            name: "LupausFutures",
            dependencies: [],
            path: getSourcePath("Futures")
        ),
        .testTarget(
            name: "LupausFuturesTests", 
            dependencies: ["LupausFutures"],
            path: getTestPath("Futures")
        )
    ]
)