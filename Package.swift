// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "elementary-css",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "ElementaryCSS", targets: ["ElementaryCSS"]),
        .plugin(name: "ElementaryCSSGenerator", targets: ["ElementaryCSSGenerator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elementary-swift/elementary", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "ElementaryCSS",
            dependencies: [
                .product(name: "Elementary", package: "elementary"),
                .target(name: "CSSDefinitions"),
            ]
        ),
        .target(name: "CSSDefinitions"),
        .testTarget(
            name: "ElementaryCSSTests",
            dependencies: ["ElementaryCSS"]
        ),
        .plugin(
            name: "ElementaryCSSGenerator",
            capability: .command(
                intent: .custom(
                    verb: "generate-css",
                    description: "Generates the ElementaryCSS style sheet"
                ),
                permissions: [
                    .writeToPackageDirectory(reason: "Write generated CSS file.")
                ]
            ),
            dependencies: [
                "ElementaryCSSGeneratorTool"
            ]
        ),
        .executableTarget(
            name: "ElementaryCSSGeneratorTool",
            dependencies: ["CSSDefinitions"],
            path: "Tools/CSSGenerator"
        ),
    ]
)
