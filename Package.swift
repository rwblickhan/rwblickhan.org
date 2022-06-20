// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "rwblickhan.org",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "rwblickhan.org", targets: ["rwblickhan.org"]),
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/rwblickhan/publish.git", .branch("master")),
        .package(name: "SwiftPygmentsPublishPlugin", url: "https://github.com/rwblickhan/SwiftPygmentsPublishPlugin", .branch("master")),
        .package(name: "S3PublishDeploy", url: "https://github.com/rwblickhan/s3publishdeploy", .branch("master")),
    ],
    targets: [
        .executableTarget(
            name: "rwblickhan.org",
            dependencies: ["Publish", "SwiftPygmentsPublishPlugin", "S3PublishDeploy"]),
    ])
