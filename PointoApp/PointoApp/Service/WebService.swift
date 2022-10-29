//
//  WebService.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 29.10.2022.
//

import Foundation

final class WebService {
    
    static let shared = WebService()
    
    private init () {}
    
    struct Constants {
        static let baseAPIURL = "https://raw.githubusercontent.com/bydevelopertr/enerjisa/main/menu.json"
    }
    
    enum HTTPMethod: String {
        case GET
        case POST
        case DELETE
        case PUT
    }
    enum APIError : Error {
        case failedToGetData
    }
    
    private func createRequest (with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
            guard let apiURL = url else {return}
            let request = URLRequest(url: apiURL)
            completion(request)
    }
    
    public func getHomePageData(completion: @escaping ((Result<Main,Error>)) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Main.self, from: data)
                    completion(.success(result))
//                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                    print(json)
                }catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
}
