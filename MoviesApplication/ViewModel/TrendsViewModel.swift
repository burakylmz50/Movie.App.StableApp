//
//  TrendsViewModel.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation
import UIKit


protocol TrendsViewModelDelegate{
    func requestCompleted()
}
protocol MovieDetailsViewModelDelegate{
    func requestCompleted76()
}
protocol MoviesCastViewModelDelegate{
    func requestCompleted()
}
//-----------------------------------//
class TrendsViewModel{
    var array = [TrendsModel]()
    var delegate: TrendsViewModelDelegate?
}

class SeriesViewModel{
    var array1 = [SeriesModel]()
    var delegate: TrendsViewModelDelegate?
}

class MovieDetailsViewModel{
    var moviesDetailsArray = [MovieDetailsModel]()
    var delegate: MovieDetailsViewModelDelegate?
    var segmentedMoviesArray = [MoviesSegmentedModel]()
}
class MoviesCastViewModel{
    var moviesCastArray = [MoviesCastModel]()
    var delegate: MoviesCastViewModelDelegate?
    var segmentedMovieCastArray = [MoviesCastModel]()
}




extension TrendsViewModel{
    func getData(){

        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=1218591a465b03f80cfebb0ef37a2275")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = try? Data(contentsOf: request.url!)
        
        do {
            let json = try? JSONDecoder().decode(TrendsModel.self, from: data!)
            array.append(json!)
        }
        self.delegate?.requestCompleted()
 
       
        
    }
    }

extension SeriesViewModel{
    func getDataSeries(){
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/tv?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US&sort_by=popularity.desc&page=1&include_null_first_air_dates=false")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(SeriesModel.self, from: data) else{return}
            array1.append(json)
        }
        catch{
            print("Error JsonDecode")
        }
        
    }
}


extension MovieDetailsViewModel{
    
    func getDataMovieDetails( id: String,completed: @escaping () -> ()) {
        
        
        var request = URLRequest(url: URL(string:"https://api.themoviedb.org/3/tv/" + id + "?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(MovieDetailsModel.self, from: data) else{return}
            moviesDetailsArray.append(json)
         
        }
      
        completed()
           self.delegate?.requestCompleted76()
        
    }
    
    func getDataSegmented( id: String,completed: @escaping () -> ()) {
        
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/" + id + "?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(MoviesSegmentedModel.self, from: data) else{return}
            segmentedMoviesArray.append(json)
         
        }
      
        completed()
           self.delegate?.requestCompleted76()
        
    }
    
}


extension MoviesCastViewModel{
    
    func getMoviesCast( id: String,completed: @escaping () -> ()) {
        
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/tv/" + id + "/credits?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(MoviesCastModel.self, from: data) else{return}
            moviesCastArray.append(json)
        }
      
        completed()
        self.delegate?.requestCompleted()
        
    }
    
    
    func getSegmentedCast( id: String,completed: @escaping () -> ()) {
           
           
           var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/" + id + "/credits?api_key=1218591a465b03f80cfebb0ef37a2275")!)
           request.httpMethod = "GET"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           guard let data = try? Data(contentsOf: request.url!)else {return}
           
           do {
               guard let json = try? JSONDecoder().decode(MoviesCastModel.self, from: data) else{return}
               segmentedMovieCastArray.append(json)
           }
         
           completed()
           self.delegate?.requestCompleted()
           
       }

}

