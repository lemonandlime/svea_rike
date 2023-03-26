// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "GameLogic",
    platforms: [.iOS(.v16), .macCatalyst(.v16)],
    products: [
        .library(
            name: "GameLogic",
            targets: ["GameLogic"]
        ),
    ],
    dependencies: [
        .package(path: "../Models"),
        .package(path: "../Resources"),
        .package(path: "../Common"),
    ],
    targets: [
        .target(
            name: "GameLogic",
            dependencies: ["Models", "Resources", "Common"]
        ),
        .testTarget(
            name: "GameLogicTests",
            dependencies:
                [
                    "GameLogic",
                    .product(name: "TestHelper", package: "Common"),
                ]
        ),
    ]
)
