//
//  HomePageViewModel.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation
protocol HomePageViewModelDelegate{
    func homePagerequestCompleted()
}

class HomePageViewModel{
    var homePageArray = [HomePageModel]()
    var updateHomePageArray = [HomePageResults]()
    var delegate: HomePageViewModelDelegate?
    var homePageResultsArray:[HomePageResults] = []
}

extension HomePageViewModel{
    func getData(pageCount:Int,completionHandler:@escaping([HomePageResults])-> ()){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US&page="+String(pageCount))!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = try? Data(contentsOf: request.url!)
        
        do {
            let json = try? JSONDecoder().decode(HomePageModel.self, from: data!)
            homePageArray.append(json!)
            homePageResultsArray.append(contentsOf: json!.results)
            
        }
        completionHandler(homePageResultsArray)
        self.delegate?.homePagerequestCompleted()
    }
    func updateData(pageCount:Int,completionHandler:@escaping([HomePageResults])-> ()){
           var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US&page="+String(pageCount))!)
           
           request.httpMethod = "GET"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           let data = try? Data(contentsOf: request.url!)
           
           do {
               let json = try? JSONDecoder().decode(HomePageModel.self, from: data!)
               homePageArray.append(json!)
               updateHomePageArray.append(contentsOf: json!.results)
               
           }
           completionHandler(updateHomePageArray)
       }
}
