// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v15),
		.tvOS(.v15),
	],
    products: [
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
		.package(
			name: "Core",
			path: "../Core"
		),
    ],
    targets: [
		.target(
			name: "API",
			dependencies: [
				.product(
					name: "Utilities",
					package: "Core"
				)
			],
			exclude: [
				"TestUtilities",
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
				.product(
					name: "TestingUtilities",
					package: "Core"
				)
			]
		),
    ]
)
