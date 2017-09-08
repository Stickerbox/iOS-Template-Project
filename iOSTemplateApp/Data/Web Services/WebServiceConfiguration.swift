//
//  Copyright © 2017 Jordan Dixon. All rights reserved.
//

import Foundation

enum BaseURL: String {
    case main = "https://api.myjson.com"
}

extension URLSession {
    
    @discardableResult
    func request<T>(for config: WebServiceConfiguration<T>, completion: @escaping (WebServiceResult<T>) -> Void) -> URLSessionDataTask? {
        
        guard let request = generateRequest(from: config) else {
            completion(.failure(.invalidRequest(config.id)))
            return nil
        }
        
        let task = dataTask(with: request) { (data, response, error) in
            
            guard error == nil, let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse(error: error, id: config.id)))
                }
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(.unableToDecode(error: error, id: config.id)))
                }
            }
            
        }
        
        task.resume()
        
        return task
    }
    
    private func generateRequest<T>(from config: WebServiceConfiguration<T>) -> URLRequest? {
        
        guard var url = URL(string: config.baseURL.rawValue + config.endpoint) else { return nil }
        
        // add config query parameters
        var queryItems = [URLQueryItem]()
        if let queryParameters = config.queryParameters {
            queryItems.append(contentsOf: queryParameters)
        }
        
        // add any query params
        if !queryItems.isEmpty {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            components.queryItems = queryItems
            url = components.url!
        }
        
        var request = URLRequest(url: url)
        request.method = config.method
        
        if let requestJSONBody = config.jsonBody {
            let data = try! JSONSerialization.data(withJSONObject: requestJSONBody, options: [])
            request.httpBody = data
            request.setValue(ContentTypeJSON, forHTTPHeaderField: ContentTypeHttpHeader)
        }
        
        return request
    }
    
}

// The main configuration that you pass to the request function on URLSession

struct WebServiceConfiguration<C: Codable> {
    
    var baseURL: BaseURL
    let endpoint: String
    let method: URLRequest.Request
    var queryParameters: [URLQueryItem]?
    var jsonBody: AnyObject?
    var formBody: [String: String]?
    var id: String // for debugging
    
    init(endpoint: String, method: URLRequest.Request) {
        self.baseURL = .main
        self.endpoint = endpoint
        self.method = method
        self.id = endpoint
    }
    
    init(endpoint: String) {
        self.baseURL = .main
        self.endpoint = endpoint
        self.method = .get
        self.id = endpoint
    }
    
    mutating func appendQueryParameter(key: String, value: String) {
        self.queryParameters?.append(URLQueryItem(name: key, value: value))
    }
    
}

// MARK: Result

enum WebServiceResult<R: Codable> {
    case success(R)
    case failure(WebServiceError)
}

// MARK: Errors

enum WebServiceError: Error {
    case invalidResponse(error: Error?, id: String)
    case invalidRequest(String)
    case unableToDecode(error: Error?, id: String)
    case unableToEncode(error: Error?, id: String)
    
    var message: String {
        
        switch self {
            
        case let .invalidResponse(response):
            return "Error with \(response.id)\nThe response was invalid: \(response.error?.localizedDescription ?? "no message")"
        case let .invalidRequest(id):
            return "The request you constructed for \(id) was invalid"
        case let .unableToDecode(response):
            return "Error with \(response.id)\nUnable to decode: \(response.error?.localizedDescription ?? "no message")"
        case let .unableToEncode(response):
            return "Error with \(response.id)\nUnable to encode: \(response.error?.localizedDescription ?? "no message")"
        }
    }
}

// Just for type safety

extension URLRequest {
    
    enum Request: String {
        case get = "GET"
        case post = "POST"
    }
    
    var method: Request {
        get {
            return Request(rawValue: self.httpMethod ?? "GET") ?? .get
        }
        set {
            self.httpMethod = method.rawValue
        }
    }
    
}

private let ContentTypeHttpHeader = "Content-Type"
fileprivate let ContentTypeForm = "application/x-www-form-urlencoded"
fileprivate let ContentTypeJSON = "application/json"
fileprivate let ContentTypeMultipartForm = "multipart/form-data"
