// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "rwblickhan.org",
    products: [
        .executable(name: "rwblickhan.org", targets: ["rwblickhan.org"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "rwblickhan.org",
            dependencies: ["Publish"]
        )
    ]
)
