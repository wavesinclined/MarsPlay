//
//  Coordinator.swift
//  MarsPlay
//
//  Created by alice singh on 05/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import Foundation
import  UIKit

class Coordinator {
    static let shared: Coordinator = Coordinator()
    private init() { }
    
    let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    func start() {
        let homePage = MovieController()
        homePage.delegate = self
        let homeNav = UINavigationController(rootViewController: homePage)
        self.window.rootViewController = homeNav
        self.window.makeKeyAndVisible()
    }
    
}

extension Coordinator: MovieControllerDelegate {
    func movieControllerDidSelectMovie(_ movie: Movie, controller: UIViewController) {
        let detail = MovieDetailViewController(movie)
        controller.navigationController?.pushViewController(detail, animated: true)
    }
}
