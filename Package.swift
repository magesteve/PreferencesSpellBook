// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PreferencesSpellBook",
    products: [
        .library(
            name: "PreferencesSpellBook",
            targets: ["PreferencesSpellBook"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PreferencesSpellBook",
            dependencies: []),
        .testTarget(
            name: "PreferencesSpellBookTests",
            dependencies: ["PreferencesSpellBook"]),
    ]
)
