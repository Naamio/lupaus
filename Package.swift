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
            targets: ["LupausAsync"]
        ),
    ],
    dependencies: [
          .package(url: "https://github.com/apple/swift-nio.git", from: "1.7.0"),
    ],
    targets: [
        .target(
            name: "LupausAsync",
            dependencies: ["NIO"],
            path: getSourcePath("Async"),
            sources: ["."]
        ),
        .testTarget(
            name: "LupausAsyncTests", 
            dependencies: ["LupausAsync"],
            path: getTestPath("Async"),
            sources: ["."]
        )
    ]
)