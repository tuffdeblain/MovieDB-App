//
//  URLS.swift
//  MovieDB App
//
//  Created by Сергей Кудинов on 13.04.2023.
//

import Foundation

enum URLS: String {
    case mainURL = "https://api.themoviedb.org/3/"
    case imageURL = "https://image.tmdb.org/t/p/w500"
    case trendingMoviesPath = "trending/movie/week?api_key="
    case trendingSerialsPath = "trending/tv/week?api_key="
}
