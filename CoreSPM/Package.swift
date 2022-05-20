// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreSPM",
	platforms: [
		.iOS(.v15)
	],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Utilities",
            targets: [
				"Utilities",
			]
		),
		.library(
			name: "API",
			targets: [
				"API"
			]
		),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
		.target(
			name: "Utilities",
			dependencies: []
		),
		.testTarget(
			name: "UtilitiesTests",
			dependencies: ["Utilities"]
		),
		.target(
			name: "API",
			dependencies: ["Utilities"]
		),
		.target(
			name: "APITestUtilities",
			dependencies: ["API"]
		),
		.testTarget(
			name: "APITests",
			dependencies: ["API"]
		),
    ]
)
