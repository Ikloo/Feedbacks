// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Feedbacks",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "Feedbacks", targets: ["Feedbacks"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Feedbacks", dependencies: [])
    ]
)
