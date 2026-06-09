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
    dependencies: [],
    targets: [
        // MARK: - Namespace
        .target(
            name: "Direction Primitive",
            dependencies: []
        ),

        // MARK: - Umbrella
        .target(
            name: "Direction Primitives",
            dependencies: [
                "Direction Primitive",
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
