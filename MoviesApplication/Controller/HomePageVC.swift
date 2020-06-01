//
//  MoviesVC.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import UIKit
import SnapKit
import AVKit
import AVFoundation
import WebKit
import XCDYouTubeKit

class HomePageVC: UIViewController, WKUIDelegate, WKNavigationDelegate{
    
    var page : Int = 1
    var moviesDetails = MovieDetailsVC()
    
    var isPageRefreshing : Bool = false
    let container = UIView()
    func setContainer(){
        view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(view)
        }
    }
    
    
    let todayLabel = UILabel()
    func setTodayLabel() {
        container.addSubview(todayLabel)
        todayLabel.snp.makeConstraints { (make) -> Void  in
            todayLabel.text = "Today"
            todayLabel.textColor = .white
            todayLabel.font = todayLabel.font.withSize(30)
            make.height.equalTo(50)
            make.top.equalTo(container).offset((navigationController?.navigationBar.frame.height)!+15)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }
    
    
    let newTrendLabel = UILabel()
    func setnewTrendLabel() {
        container.addSubview(newTrendLabel)
        newTrendLabel.snp.makeConstraints { (make) -> Void  in
            newTrendLabel.text = "New and Trending"
            newTrendLabel.textColor = .lightGray
            newTrendLabel.font = newTrendLabel.font.withSize(25)
            make.height.equalTo(30)
            make.top.equalTo(todayLabel.snp.bottom)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }
    
    
    
    fileprivate let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    func setCollectionView(){
        container.addSubview(collectionView)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.snp.makeConstraints { (make) -> Void in
            collectionView.layer.cornerRadius = 10.0
            make.top.equalTo(newTrendLabel.snp.bottom).offset(0)
            make.leading.equalTo(container).offset(20)
            make.trailing.equalTo(container.snp.trailing).offset(-20)
            make.bottom.equalTo(container.snp.bottom)
        }
    }
    
    
    func setupDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    //    func playVideo(key :String) {
    //
    //        let playerViewController = AVPlayerViewController()
    //        self.present(playerViewController, animated: true, completion: nil)
    //
    //        XCDYouTubeClient.default().getVideoWithIdentifier(key) { (video: XCDYouTubeVideo?, error: Error?) in
    //            if let streamURL = video?.streamURLs[XCDYouTubeVideoQuality.HD720.rawValue] {
    //                playerViewController.player = AVPlayer(url: streamURL)
    //            } else {
    //                self.dismiss(animated: true, completion: nil)
    //            }
    //        }
    //    }
    
    //TODO: Checks whether data is up to date.
    func dataUpdateCheck(){
        _ = Timer.scheduledTimer(withTimeInterval:60, repeats: true) {
            (_) in
            let pageNum = 1
            self.homePageViewModel.updateHomePageArray.removeAll()
            self.homePageViewModel.updateData(pageCount: pageNum, completionHandler: {
                response in
                for index in 0...self.homePageViewModel.updateHomePageArray.count-1{
                    if(self.homePageViewModel.homePageResultsArray[index].id != response[index].id){
                        self.homePageViewModel.updateHomePageArray.removeAll()
                        self.homePageViewModel.homePageResultsArray = response
                        
                        let alert = UIAlertController(title: "Cool!", message: "Data updated.", preferredStyle: UIAlertController.Style.alert)
                        
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                        DispatchQueue.main.async {
                            //TODO: Go to top of page after data is refreshed
                            self.collectionView.contentOffset.y = 0
                            self.collectionView.reloadData()
                        }
                    }
                    else{
                        //Data is up to date
                    }
                }
            })
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        dataUpdateCheck()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainer()
        setTodayLabel()
        setnewTrendLabel()
        setCollectionView()
        
        setupDelegate()
        self.homePageViewModel.getData(pageCount: page, completionHandler: {
            response in
            self.homePageViewModel.homePageResultsArray = response
        })
        self.trailersViewModel.getData(id: String(id))
        
        navigationController?.navigationBar.isHidden = true
        
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: collectionView.frame.size.height)
        flowLayout.scrollDirection = .vertical
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        collectionView.collectionViewLayout = flowLayout
        
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
            let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
            let pageSide = (layout.scrollDirection == .vertical) ? self.pageSize.width : self.pageSize.height
            let offset = (layout.scrollDirection == .vertical) ? scrollView.contentOffset.x : scrollView.contentOffset.y
            currentPage = Int(floor(offset - pageSide / 2) / pageSide + 1)
        }
    }
    
    
    
    fileprivate var currentPage: Int = 0 {
        didSet{
            print("")
        }
    }
    fileprivate var pageSize: CGSize{
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .vertical {
            pageSize.width += layout.minimumLineSpacing
            
        } else{
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    lazy var homePageViewModel: HomePageViewModel = {
        let homePageVM = HomePageViewModel()
        homePageVM.delegate = self
        return homePageVM
    }()
    
    
    lazy var trailersViewModel: TrailersViewModel = {
        let trailersVM = TrailersViewModel()
        trailersVM.delegate = self
        return trailersVM
    }()
}

var id = Int()
extension HomePageVC: HomePageViewModelDelegate, TrailersViewModelDelegate{
    func homePagerequestCompleted() {
        DispatchQueue.main.async {
            
        }
    }
    
    func trailersRequestCompleted() {
        
    }
    
}

extension HomePageVC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePageViewModel.homePageResultsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.posterImage.image = nil
        cell.memberNameFirstLetter.text = homePageViewModel.homePageResultsArray[indexPath.row].name?.uppercased()
        let a = homePageViewModel.homePageResultsArray[indexPath.row].poster_path
        
        
        if(a?.isEmpty == false){
            cell.posterImage.alpha = 0
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1.0) {
                    cell.posterImage.alpha = 1
                }
                cell.posterImage.loadImageAsync(with: "https://image.tmdb.org/t/p/original" + a!, completed: {
                    cell.memberNameFirstLetter.isHidden = true
                })
                
            }
            cell.memberNameFirstLetter.isHidden = true
        }
        cell.memberNameFirstLetter.isHidden = false
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == homePageViewModel.homePageResultsArray.count-5 ) {
            self.page = self.page + 1
            DispatchQueue.global(qos: .background).async {
                print("Run on background thread")
                self.homePageViewModel.getData(pageCount: self.page, completionHandler: {
                    response in
                    self.homePageViewModel.homePageResultsArray = response
                }
                )
                DispatchQueue.main.async {
                    self.collectionView.insertItems(at: [indexPath])
                }
            }
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 275, height: 412)
    }
    
    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moviesDetails.movieID = String(homePageViewModel.homePageArray[0].results[indexPath.row].id)
        self.present(moviesDetails, animated: true, completion: nil)
    }
    
}
