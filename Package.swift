// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "rwblickhan.org",
    products: [
        .executable(name: "rwblickhan.org", targets: ["rwblickhan.org"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rwblickhan/publish.git", .branch("master")),
        .package(url: "https://github.com/Ze0nC/SwiftPygmentsPublishPlugin", .branch("master")),
        .package(url: "https://github.com/johnbehnke/s3publishdeploy", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "rwblickhan.org",
            dependencies: ["Publish", "SwiftPygmentsPublishPlugin", "S3PublishDeploy"]),
    ])
