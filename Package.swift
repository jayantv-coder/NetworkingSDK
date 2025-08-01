// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "NetworkingSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "NetworkingSDK", targets: ["NetworkingSDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0")
    ],
    targets: [
        .target(
            name: "NetworkingSDK",
            dependencies: ["Alamofire"],
            path: "Sources/NetworkingSDK"
        ),
        .testTarget(
            name: "NetworkingSDKTests",
            dependencies: ["NetworkingSDK", "Alamofire"],
            path: "Tests/NetworkingSDKTests"
        )
    ]
)
