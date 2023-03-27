// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Core",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v15),
		.tvOS(.v15),
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
			name: "TestingUtilities",
			targets: [
				"TestingUtilities",
			]
		),
	],
	dependencies: [
		.package(
			url: "https://github.com/apple/swift-algorithms",
			from: "1.0.0"
		),
		.package(
			url: "https://github.com/apple/swift-numerics",
			from: "1.0.0"
		),
	],
	targets: [
		.target(
			name: "Localization",
			dependencies: []
		),
		.testTarget(
			name: "LocalizationTests",
			dependencies: [
				.target(name: "Localization"),
			]
		),
		.target(
			name: "TestingUtilities",
			dependencies: []
		),
		.testTarget(
			name: "TestingUtilitiesTests",
			dependencies: [
				.target(name: "TestingUtilities"),
			]
		),
		.target(
			name: "Utilities",
			dependencies: []
		),
		.testTarget(
			name: "UtilitiesTests",
			dependencies: [
				.target(name: "Utilities"),
			]
		),
	]
)
