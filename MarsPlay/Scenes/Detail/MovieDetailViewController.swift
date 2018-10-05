//
//  GameDetailViewController.swift
//  MarsPlay
//
//  Created by alice singh on 1/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: Movie?
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.dataSource = self
        table.separatorStyle = .none
        return table
    }()
    
     init(_ movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
      }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    
    func setUpViews() {
        self.navigationItem.title = "Detail"
        self.view.backgroundColor = UIColor.flatWhite
        self.view.addSubview(tableView)
    }
    
    func setUpConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    lazy var avatarCell: MovieDetailAvatarCell = {
        var cell = MovieDetailAvatarCell()
        cell.setUpData(self.movie!)
        return cell
    }()
    
    lazy var titleCell: MovieDetailTitleCell = {
        var cell = MovieDetailTitleCell()
        cell.setUpData(self.movie!)
        return cell
    }()
    
    lazy var typeCell: MovieDetailTypeCell = {
        var cell = MovieDetailTypeCell()
        cell.setUpData(self.movie!)
        return cell
    }()
    
    lazy var yearCell: MovieDetailYearCell = {
        var cell = MovieDetailYearCell()
        cell.setUpData(self.movie!)
        return cell
    }()
    
    lazy var cells: [UITableViewCell] = [self.avatarCell, self.titleCell, self.typeCell, self.yearCell]
}


 extension MovieDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}
