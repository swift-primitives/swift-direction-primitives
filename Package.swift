// swift-tools-version: 6.3.1
import PackageDescription

let package = Package(
    name: "swift-direction-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        // MARK: - Namespace
        .library(
            name: "Direction Primitive",
            targets: ["Direction Primitive"]
        ),

        // MARK: - Sub-namespace targets
        .library(
            name: "Direction Equation Primitives",
            targets: ["Direction Equation Primitives"]
        ),
        .library(
            name: "Direction Hash Primitives",
            targets: ["Direction Hash Primitives"]
        ),
        .library(
            name: "Direction Comparison Primitives",
            targets: ["Direction Comparison Primitives"]
        ),

        // MARK: - Umbrella
        .library(
            name: "Direction Primitives",
            targets: ["Direction Primitives"]
        ),

        // MARK: - Test Support
        .library(
            name: "Direction Primitives Test Support",
            targets: ["Direction Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-equation-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-hash-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-comparison-primitives.git", branch: "main"),
    ],
    targets: [
        // MARK: - Namespace (zero external dependencies — [MOD-017])
        .target(
            name: "Direction Primitive",
            dependencies: []
        ),

        // MARK: - Sub-namespace targets (per [MOD-031]): institute Equatable/Hashable/Comparable twins
        .target(
            name: "Direction Equation Primitives",
            dependencies: [
                "Direction Primitive",
                .product(name: "Equation Primitives", package: "swift-equation-primitives"),
            ]
        ),
        .target(
            name: "Direction Hash Primitives",
            dependencies: [
                "Direction Primitive",
                .product(name: "Hash Primitives", package: "swift-hash-primitives"),
            ]
        ),
        .target(
            name: "Direction Comparison Primitives",
            dependencies: [
                "Direction Primitive",
                .product(name: "Comparison Primitives", package: "swift-comparison-primitives"),
            ]
        ),

        // MARK: - Umbrella
        .target(
            name: "Direction Primitives",
            dependencies: [
                "Direction Primitive",
                "Direction Equation Primitives",
                "Direction Hash Primitives",
                "Direction Comparison Primitives",
            ]
        ),

        // MARK: - Test Support
        .target(
            name: "Direction Primitives Test Support",
            dependencies: [
                "Direction Primitives",
            ],
            path: "Tests/Support"
        ),

        // MARK: - Tests
        .testTarget(
            name: "Direction Primitives Tests",
            dependencies: [
                "Direction Primitives",
                "Direction Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
