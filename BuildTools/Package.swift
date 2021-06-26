// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "BuildTools",
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.41.2"),
    ],
    targets: [.target(name: "BuildTools", path: "")]
)
