//
// 
// FileName: NetworkService.swift
// ProjectName: Delicious
//
// Created by MD ABIR HOSSAIN on 09-11-2024 at 3:08 PM
// Website: https://mdabirhossain.com/
//


import Foundation

struct NetworkService {
    // MARK: - Shortcut(CMD+ALT+/(forward slash))
    /// Function helps to create URLRequest
    /// - Parameters:
    ///   - route: Backend path resource
    ///   - method: Type of request (GET, POST, DELETE etc.)
    ///   - parameters: Exra information if needs to send to backend
    /// - Returns: URLRequest
     func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseURL + route.description
        guard let url = urlString.asURL else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
                case .get:
                    var urlComponent = URLComponents(string: urlString)
                    urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: String(describing: $1)) }
                    urlRequest.url = urlComponent?.url
                case .post, .delete, .patch:
                    let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                    urlRequest.httpBody = bodyData
            }
        }
        
        return urlRequest
    }
}
