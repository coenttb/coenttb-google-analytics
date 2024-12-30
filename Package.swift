// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let googleAnalytics: Self = "GoogleAnalytics"
}

extension Target.Dependency {
    static var googleAnalytics: Self { .target(name: .googleAnalytics) }
}

extension Target.Dependency {
    static var coenttbWeb: Self { .product(name: "Coenttb Web", package: "coenttb-web") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
}

let package = Package(
    name: "coenttb-google-analytics",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: .googleAnalytics, targets: [.googleAnalytics]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-web", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: .googleAnalytics,
            dependencies: [
                .coenttbWeb,
                .dependenciesMacros,
            ]
        ),
        .testTarget(
            name: .googleAnalytics + " Tests",
            dependencies: [
                .googleAnalytics,
                .dependenciesTestSupport,
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
