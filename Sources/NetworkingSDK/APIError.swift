import Foundation
import Alamofire

public struct APIError: Error {
    public let statusCode: Int?
    public let message: String

    public init(error: AFError, data: Data?) {
        self.statusCode = error.responseCode
        if let data = data, let message = try? JSONDecoder().decode(ServerErrorMessage.self, from: data) {
            self.message = message.message
        } else if let data = data, let string = String(data: data, encoding: .utf8) {
            self.message = string
        } else {
            self.message = error.localizedDescription
        }
    }
}

public struct ServerErrorMessage: Codable {
    public let message: String
}