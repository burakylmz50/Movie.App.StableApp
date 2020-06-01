//
//  TrendsModel.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation

struct TrendsModel : Codable {
let page : Int?
let results : [Results]!
let total_pages : Int?
let total_results : Int?
}

struct Results : Codable {
let id : Int!
let video : Bool?
let vote_count : Int?
let vote_average : Double?
let title : String?
let release_date : String?
let original_language : String?
let original_title : String?
let genre_ids : [Int]?
let backdrop_path : String?
let adult : Bool?
let overview : String?
let poster_path : String?
let popularity : Double?
let media_type : String?
}


