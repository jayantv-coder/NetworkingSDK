Pod::Spec.new do |s|
  s.name             = "NetworkingSDK"
  s.version          = "1.0.0"
  s.summary          = "Reusable Networking SDK using Alamofire"
  s.description      = <<-DESC
                        A lightweight and reusable networking SDK for iOS projects built on top of Alamofire.
                        Supports GET, POST, PUT, DELETE, Upload, Download and structured error handling.
                       DESC
  s.homepage         = "https://github.com/yourusername/NetworkingSDK"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Your Name" => "your@email.com" }
  s.source           = { :git => "https://github.com/yourusername/NetworkingSDK.git", :tag => s.version }
  s.ios.deployment_target = "12.0"
  s.source_files     = "NetworkingSDK/*.swift"
  s.dependency       "Alamofire", "~> 5.8"
  s.swift_version    = "5.0"
end