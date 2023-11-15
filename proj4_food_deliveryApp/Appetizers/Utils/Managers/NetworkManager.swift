//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import Foundation
import UIKit

enum AppError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    let baseURL: String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init() {}
    
//    func getAppetizers (completed: @escaping (Result<[AppetizerModel], AppError>) -> Void ) {
//        guard let url = URL(string: baseURL + "appetizers") else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let res = response as? HTTPURLResponse , res.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let dt = data else{
//                completed(.failure(.invalidData))
//                return
//            } 
//            
//            do {
//                let decoder = JSONDecoder()
//                let decodedRes = try decoder.decode(AppetizerResponse.self, from: dt)
//                completed(.success(decodedRes.request))
//            } catch {
//                print("Error while decoding JSON : \(error)")
//                completed(.failure(.invalidData))
//            }
//          
//        }
//        task.resume()
//    }
//    
    
    func getAppetizers () async throws -> [AppetizerModel] {
        guard let url = URL(string: baseURL) else {
            throw AppError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedRes = try JSONDecoder().decode(AppetizerResponse.self, from: data)
            return decodedRes.request
        } catch {
            throw AppError.invalidData
        }
    }
    
    func downloadImage(imageUrl url : String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: url)
        
        if let image = self.cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let uri = URL(string: url) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: uri )) { data, res, err in
        
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
