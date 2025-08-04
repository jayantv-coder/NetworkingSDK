# NetworkingSDK

A reusable networking layer for all iOS applications using Alamofire.

## ✅ Features

- [x] Generic GET/POST/PUT/DELETE requests
- [x] Multipart upload
- [x] File download
- [x] Codable response handling
- [x] Error handling
- [x] CocoaPods support

## 🚀 Installation

```ruby
pod 'NetworkingSDK'
```

## 🔧 Usage

### GET Request

```swift
NetworkManager.shared.request(
    url: "https://api.example.com/users",
    method: .get,
    responseType: [User].self
) { result in
    // Handle result
}
```

### Upload Image

```swift
let imageData = UIImage(named: "profile")!.jpegData(compressionQuality: 0.8)!
let file = MultipartFile(data: imageData, name: "avatar", fileName: "avatar.jpg", mimeType: "image/jpeg")

NetworkManager.shared.upload(
    url: "https://api.example.com/upload",
    parameters: ["userId": "123"],
    files: [file],
    responseType: UploadResponse.self
) { result in
    // Handle result
}
```

## 🧪 Testing

Test cases can be found under `Tests/NetworkingSDKTests.swift`.
