import Foundation
import Combine

enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
}

struct NetworkDispatcher {
    let urlSession: URLSession!

    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func dispatch<ReturnType: Codable>(request: URLRequest) -> AnyPublisher<ReturnType, NetworkRequestError> {
        return urlSession
            .dataTaskPublisher(for: request)
            .tryMap({ data, response in
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
                    throw httpError(response.statusCode)
                }
                // print("ReturnType: \(ReturnType.self), \(data.prettyJSON)")

                return data
            })
            .decode(type: ReturnType.self, decoder: SnakeCaseJSONDecoder())
            .mapError { handleError($0) }
            .retry(1)
            .eraseToAnyPublisher()
    }
//        return urlSession
//            .dataTaskPublisher(for: request)
//            .map { $0.data }
//            .decode(type: ReturnType.self, decoder: SnakeCaseJSONDecoder())
//            .mapError { error -> NetworkRequestError in
//                switch error {
//                case is Swift.DecodingError: return NetworkRequestError.decodingError
//                case is URLError: return NetworkRequestError.urlSessionFailed(error as! URLError)
//                default: return NetworkRequestError.unknownError
//                }
//            }
//            .retry(1)
//            .eraseToAnyPublisher()
//    }
}

extension NetworkDispatcher {

    private func httpError(_ statusCode: Int) -> NetworkRequestError {
        //print("HTTP ERROR: \(statusCode)")
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...5999: return .error5xx(statusCode)
        default: return .unknownError
        }
    }

    private func handleError(_ error: Error) -> NetworkRequestError {
        //print("ERROR: \(error)")
        switch error {
        case is Swift.DecodingError: return .decodingError
        case let urlError as URLError: return .urlSessionFailed(urlError)
        case let error as NetworkRequestError: return error
        default: return .unknownError
        }
    }
}
