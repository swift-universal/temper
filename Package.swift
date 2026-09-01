// swift-tools-version:6.2

import Foundation
import PackageDescription

let environment = ProcessInfo.processInfo.environment
let packageDirectory = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
let useLocalDependencies = (environment["SPM_USE_LOCAL_DEPS"] ?? "false")
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .lowercased()
    .matchesAny(of: "1", "true", "yes", "on")

func localPackagePath(
    environmentKey: String,
    default relativePath: String
) -> String {
    URL(
        fileURLWithPath: environment[environmentKey] ?? relativePath,
        relativeTo: packageDirectory
    ).standardizedFileURL.path
}

let temperSwiftPath = localPackagePath(
    environmentKey: "TEMPER_SWIFT_PATH",
    default: "../../universal/domain/build/toolchains/temper-swift"
)
let temperSwiftDependency: Package.Dependency =
    if useLocalDependencies,
       FileManager.default.fileExists(
           atPath: URL(fileURLWithPath: temperSwiftPath)
               .appendingPathComponent("Package.swift").path
       ) {
        .package(path: temperSwiftPath)
    } else {
        .package(
            url: "https://github.com/swift-universal/temper-swift.git",
            branch: "main"
        )
    }

let package = Package(
    name: "temper",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(name: "TemperCommands", targets: ["TemperCommands"]),
        .executable(
            name: "temper.cli@swift-universal.clia.sh",
            targets: ["TemperExecutable"]
        ),
    ],
    dependencies: [
        temperSwiftDependency,
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "TemperCommands",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "TemperSwiftCommands", package: "temper-swift"),
            ]
        ),
        .executableTarget(
            name: "TemperExecutable",
            dependencies: ["TemperCommands"]
        ),
        .testTarget(
            name: "TemperCommandsTests",
            dependencies: [
                "TemperCommands",
                .product(name: "TemperSwiftCommands", package: "temper-swift"),
            ]
        ),
    ]
)

extension String {
    fileprivate func matchesAny(of values: String...) -> Bool {
        values.contains(self)
    }
}
