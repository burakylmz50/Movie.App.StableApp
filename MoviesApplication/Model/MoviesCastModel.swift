//
//  MoviesCastModel.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 1.06.2020.
//  Copyright © 2020  All rights reserved.
//

import Foundation

struct MoviesCastModel : Codable {
    let cast : [Cast]?
    let crew : [Crew]?
    let id : Int?
}

struct Crew : Codable {
    let credit_id : String?
    let department : String?
    let id : Int?
    let name : String?
    let gender : Int?
    let job : String?
    let profile_path : String?
}
struct Cast : Codable {
    let character : String?
    let credit_id : String?
    let id : Int?
    let name : String?
    let gender : Int?
    let profile_path : String?
    let order : Int?
}
