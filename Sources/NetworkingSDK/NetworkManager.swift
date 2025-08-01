import Foundation
import Alamofire

public class NetworkManager {
    public static let shared = NetworkManager()
    private init() {}

    @discardableResult
    public func request<T: Decodable>(
        url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        responseType: T.Type,
        completion: @escaping (Result<T, APIError>) -> Void
    ) -> DataRequest {
        return AF.request(url,
                          method: method,
                          parameters: parameters,
                          encoding: encoding,
                          headers: headers)
            .validate()
            .responseDecodable(of: responseType) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(APIError(error: error, data: response.data)))
                }
            }
    }

    public func upload<T: Decodable>(
        url: String,
        parameters: [String: String],
        files: [MultipartFile],
        headers: HTTPHeaders? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, APIError>) -> Void
    ) {
        AF.upload(multipartFormData: { formData in
            for (key, value) in parameters {
                formData.append(Data(value.utf8), withName: key)
            }
            for file in files {
                formData.append(file.data, withName: file.name, fileName: file.fileName, mimeType: file.mimeType)
            }
        }, to: url, headers: headers)
        .validate()
        .responseDecodable(of: responseType) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(APIError(error: error, data: response.data)))
            }
        }
    }

    public func download(
        url: String,
        destination: DownloadRequest.Destination? = DownloadRequest.suggestedDownloadDestination(),
        completion: @escaping (Result<URL, APIError>) -> Void
    ) {
        AF.download(url, to: destination)
            .validate()
            .response { response in
                if let fileURL = response.fileURL {
                    completion(.success(fileURL))
                } else if let error = response.error {
                    completion(.failure(APIError(error: error.asAFError ?? AFError.explicitlyCancelled, data: nil)))
                }
            }
    }
}