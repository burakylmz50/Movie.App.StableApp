//
//  TrailersModel.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation

struct TrailersModel : Codable {
var id : Int?
var results : [TrailersResults]?
}
 
struct TrailersResults: Codable {
var id : String?
var iso_639_1 : String?
var iso_3166_1 : String?
var key : String?
var name : String?
var site : String?
var size : Int?
var type : String?
}
