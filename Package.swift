// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-cardinal-algebra-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Cardinal Algebra Primitives",
            targets: ["Cardinal Algebra Primitives"]
        ),
        .library(
            name: "Cardinal Algebra Primitives Test Support",
            targets: ["Cardinal Algebra Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-algebra-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-cardinal-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Cardinal Algebra Primitives",
            dependencies: [
                .product(name: "Algebra Semiring Primitives", package: "swift-algebra-primitives"),
                .product(name: "Cardinal Primitives", package: "swift-cardinal-primitives"),
            ]
        ),
        .target(
            name: "Cardinal Algebra Primitives Test Support",
            dependencies: [
                "Cardinal Algebra Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Cardinal Algebra Primitives Tests",
            dependencies: [
                "Cardinal Algebra Primitives",
                "Cardinal Algebra Primitives Test Support",
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
