//
//  ViewController.swift
//  MarsPlay
//
//  Created by alice singh on 1/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework
import MJRefresh

protocol MovieControllerDelegate: class {
    func movieControllerDidSelectMovie(_ movie: Movie , controller: UIViewController)
}

class MovieController: UIViewController {
    weak var delegate: MovieControllerDelegate?

    var movieList: [Movie] = []
    var currentPage: Int = 1
    
    lazy  var layout: UICollectionViewLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self.view.frame.width - 30) / 2, height: self.view.frame.height/3)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseId)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        fetchData()
    }
    
    func setUpViews() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Movies"
        self.view.addSubview(collectionView)
        
        let footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(handleFooterAction))!
        //footer.isAutomaticallyHidden = true
        footer.setTitle( "-", for: .noMoreData)
        footer.setTitle( "", for: .idle)
        footer.isRefreshingTitleHidden = true
        collectionView.mj_footer = footer
    }
    
    func setUpConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func fetchData() {
        OMDBClient.moviesGET("Batman", currentPage)
            .done { (response) in
                //self.movieList = response.search ?? [] // replace old array with new result
                self.movieList.append(contentsOf: response.search ?? [])
                self.collectionView.reloadData()
            }.catch { (error) in
                print(error)
            }.finally {
                self.collectionView.mj_footer.endRefreshing()
            }
    }
}

// Actions
extension MovieController {
    @objc func handleNext() {
        currentPage += 1
        // fetch
        fetchData()
    }
    
    @objc func handleFooterAction() {
        guard currentPage < 101 else { // valid range is [1-100]
            self.collectionView.mj_footer.endRefreshingWithNoMoreData()
            return
        }
        
        currentPage += 1
        // fetch
        fetchData()
    }
}

extension  MovieController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseId, for: indexPath) as! MovieCell
        let movie = movieList[indexPath.item]
        cell.setUpData(movie)
        return cell
    }
}

extension MovieController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movieList[indexPath.item]
        self.delegate?.movieControllerDidSelectMovie(movie, controller: self)
    }
}
