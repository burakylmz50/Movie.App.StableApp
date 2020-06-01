//
//  HomePageModel.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//
import Foundation
//struct HomePageModel : Codable {
//let page : Int?
//let results : [HomePageResults]?
//let total_pages : Int?
//let total_results : Int?
//}
//
//struct HomePageResults : Codable {
//let original_name : String?
//let id : Int?
//let name : String?
//let vote_count : Int?
//let vote_average : Double?
//let first_air_date : String?
//let poster_path : String?
//let genre_ids : [Int]?
//let original_language : String?
//let backdrop_path : String?
//let overview : String?
//let origin_country : [String]?
//let popularity : Double?
//let media_type : String?
//}

// MARK: - Welcome
struct HomePageModel : Codable {
//    let page, totalResults, totalPages: Int
    let results: [HomePageResults]

//    enum CodingKeys: String, CodingKey {
//        case page
//        case totalResults = "total_results"
//        case totalPages = "total_pages"
//        case results
//    }
}

// MARK: - Result
struct HomePageResults: Codable {
//    let originalName: String
//    let genreIDS: [Int]
    let name: String?
//    let popularity: Double
//    let originCountry: [OriginCountry]
//    let voteCount: Int
//    let firstAirDate: String
//    let backdropPath: String?
//    let originalLanguage: OriginalLanguage
    let id: Int
//    let voteAverage: Double
//    let overview: String
    let poster_path: String?

//    enum CodingKeys: String, CodingKey {
//        case originalName = "original_name"
//        case genreIDS = "genre_ids"
//        case name, popularity
//        case originCountry = "origin_country"
//        case voteCount = "vote_count"
//        case firstAirDate = "first_air_date"
//        case backdropPath = "backdrop_path"
//        case originalLanguage = "original_language"
//        case id
//        case voteAverage = "vote_average"
//        case overview
//        case posterPath = "poster_path"
//    }
}
//
//enum OriginCountry: String, Codable {
//    case cn = "CN"
//    case gb = "GB"
//    case mx = "MX"
//    case us = "US"
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case es = "es"
//    case zh = "zh"
//}
