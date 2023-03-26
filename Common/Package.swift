// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Common",
    platforms: [.iOS(.v16), .macCatalyst(.v16)],
    products: [
        .library(
            name: "Common",
            targets: ["Common"]
        ),
        .library(
            name: "TestHelper",
            targets: ["TestHelper"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Common",
            dependencies: []
        ),
        .target(name: "TestHelper", dependencies: []),
        .testTarget(
            name: "CommonTests",
            dependencies: ["Common"]
        ),
    ]
)
