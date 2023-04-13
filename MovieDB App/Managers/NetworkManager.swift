//
//  NetworkManager.swift
//  MovieDB App
//
//  Created by Сергей Кудинов on 13.04.2023.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    enum ContentType {
        case movies
        case serials
    }

    func getTrendingContent(type: ContentType, apiKey: String, completion: @escaping ([Any]) -> Void) {
        let path: String
        switch type {
        case .movies:
            path = URLS.trendingMoviesPath.rawValue
        case .serials:
            path = URLS.trendingSerialsPath.rawValue
        }
        
        AF.request(URLS.mainURL.rawValue + path + apiKey)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    switch type {
                    case .movies:
                        guard let results = TrendingMovie.getTopMovies(from: value) else { return }
                        completion(results)
                    case .serials:
                        guard let results = TrendingSerial.getTopSerials(from: value) else { return }
                        completion(results)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }

}
