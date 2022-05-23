// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v15),
	],
    products: [
        .library(
            name: "Localization",
            targets: [
				"Localization",
			]
		),
		.library(
			name: "Utilities",
			targets: [
				"Utilities",
			]
		),
		.library(
			name: "API",
			targets: [
				"API",
			]
		),
		.library(
			name: "APITestUtilities",
			targets: [
				"APITestUtilities",
			]
		),
    ],
    dependencies: [
    ],
    targets: [
		.target(
			name: "Localization",
			dependencies: []
		),
		.testTarget(
			name: "LocalizationTests",
			dependencies: ["Localization"]
		),
		.target(
			name: "Utilities",
			dependencies: []
		),
		.testTarget(
			name: "UtilitiesTests",
			dependencies: [
				"Utilities",
			]
		),
		.target(
			name: "API",
			dependencies: [
				"Utilities",
				"Localization",
			],
			exclude: [
				"TestUtilities",
			],
			resources: [
				.process("Resources"),
			]
		),
		.target(
			name: "APITestUtilities",
			dependencies: [
				"API",
			],
			path: "Sources/API/TestUtilities"
		),
		.testTarget(
			name: "APITests",
			dependencies: [
				"APITestUtilities",
			]
		),
    ]
)
