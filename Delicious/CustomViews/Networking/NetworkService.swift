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
    
    static let shared = NetworkService()
    
    private init() {}
    
    func makeRequest(completion: @escaping(Result<[Dish], Error>) -> Void) {
        request(route: .temp, method: .get, completion: completion)
    }
    
    private func request<T: Decodable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                       completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not convert DATA to string"
//                print("RESPONSE STRING:: \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("Error is:: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                // TODO: - Decode the result and send it to the user
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?, completion: @escaping (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            
            return
        }
        
        switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                    completion(.failure(AppError.errorDecoding))
                    
                    return
                }
                
                if let error = response.error {
                    completion(.failure(AppError.serverError(error)))
                    
                    return
                }
                
                if let decodedData = response.data {
                    completion(.success(decodedData))
                } else {
                    completion(.failure(AppError.unknownError))
                }
            case .failure(let error):
                completion(.failure(error))
        }
    }
    
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

