import XCTest

@testable import NetworkingSDK
import Alamofire

final class NetworkingSDKTests: XCTestCase {

    func testGETRequestReturnsData() {
        let expectation = self.expectation(description: "GET request should return data")

        NetworkManager.shared.request(
            url: "https://jsonplaceholder.typicode.com/posts",
            method: .get,
            responseType: [Post].self
        ) { result in
            switch result {
            case .success(let posts):
                XCTAssertFalse(posts.isEmpty)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Request failed: \(error)")
            }
        }

        waitForExpectations(timeout: 5.0, handler: nil)
    }
}

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
