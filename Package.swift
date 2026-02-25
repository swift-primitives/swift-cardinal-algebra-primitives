// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-algebra-cardinal-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Algebra Cardinal Primitives",
            targets: ["Algebra Cardinal Primitives"]
        ),
        .library(
            name: "Algebra Cardinal Primitives Test Support",
            targets: ["Algebra Cardinal Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-algebra-semiring-primitives"),
        .package(path: "../swift-cardinal-primitives"),
    ],
    targets: [
        .target(
            name: "Algebra Cardinal Primitives",
            dependencies: [
                .product(name: "Algebra Semiring Primitives", package: "swift-algebra-semiring-primitives"),
                .product(name: "Cardinal Primitives", package: "swift-cardinal-primitives"),
            ]
        ),
        .target(
            name: "Algebra Cardinal Primitives Test Support",
            dependencies: [
                "Algebra Cardinal Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Algebra Cardinal Primitives Tests",
            dependencies: [
                "Algebra Cardinal Primitives",
                "Algebra Cardinal Primitives Test Support",
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
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
