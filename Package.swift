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
    static var coenttbWeb: Self { .product(name: "CoenttbWeb", package: "coenttb-web") }
    static var codable: Self { .product(name: "MacroCodableKit", package: "macro-codable-kit") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var memberwiseInit: Self { .product(name: "MemberwiseInit", package: "swift-memberwise-init-macro") }
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
        .package(url: "https://github.com/coenttb/macro-codable-kit.git", branch: "main"),
        .package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", from: "0.5.1"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: .googleAnalytics,
            dependencies: [
                .coenttbWeb,
                .memberwiseInit,
            ]
        ),
        .testTarget(
            name: .googleAnalytics + " Tests",
            dependencies: [
                .googleAnalytics
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
