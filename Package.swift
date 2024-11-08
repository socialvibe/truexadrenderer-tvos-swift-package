// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TruexAdRenderer",
    platforms:[
        .tvOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TruexAdRenderer",
            targets: ["TruexAdRendererTarget"]),
    ],
    dependencies: [
        .package(url:"https://github.com/Innovid/tvos-xcframework.git", exact: "1.7.10"),
        .package(url:"https://github.com/pusher/pusher-websocket-swift.git", exact: "8.0.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git" , exact: "5.19.2"),
    ],
    targets: [
        .binaryTarget(name: "TruexAdRenderer",
                      url: "https://stash.truex.com/integration/TruexAdRenderer-tvOS-v3.14.1-spm.zip",
                      checksum: "1f8d5852604f182683bbd3b4416b452a4c3dce2fe15e50928328524b185aa98a"),
        .target(name: "TruexAdRendererTarget",
               dependencies: [
                .target(name: "TruexAdRenderer"),
                .product(name: "InnovidAdRendererFramework", package: "tvos-xcframework"),
                .product(name: "PusherSwift", package: "pusher-websocket-swift"),
                .product(name: "SDWebImage", package: "SDWebImage"),
               ])
    ]
)
