//
//  ImageManager.swift
//  MovieDB App
//
//  Created by Сергей Кудинов on 13.04.2023.
//

import Alamofire
import Foundation

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getPoster(from url: String, completion: @escaping (Data) -> Void) {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let imageData):
                    completion(imageData)
                case .failure(let error):
                    print(error)
                }
        }
    }
}
