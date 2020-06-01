//
//  TrailersViewModel.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation
protocol TrailersViewModelDelegate{
    func trailersRequestCompleted()
}

class TrailersViewModel{
    var trailersArray = [TrailersModel]()
    var delegate: TrailersViewModelDelegate?
    var segmentedTrailersArray = [TrailersModel]()
}

extension TrailersViewModel{
    func getData(id : String){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/tv/" + id + "/videos?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
               request.httpMethod = "GET"
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
               
        do {
                guard let json = try? JSONDecoder().decode(TrailersModel.self, from: data) else{return}
                    trailersArray.append(json)
               }
               catch{
                print("Error JsonDecode")
        }
        
    }
    
    func getSegmentedDatagetData(id : String){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/" + id + "/videos?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
               request.httpMethod = "GET"
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
               
               do {
                guard let json = try? JSONDecoder().decode(TrailersModel.self, from: data) else{return}
                    segmentedTrailersArray.append(json)
               }
               catch{
                print("Error JsonDecode")
        }
        
    }
    
}
