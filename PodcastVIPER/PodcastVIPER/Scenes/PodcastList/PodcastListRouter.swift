//
//  MovieListRouter.swift
//  Movie
//
//  Created by omer-mac on 13.04.2022.
//

import UIKit

final class PodcastListRouter: PodcastListRouterProtocol{
    
    unowned let view: UIViewController
    
    init(view:UIViewController) {
        self.view = view
    }
    
    func navigate(to route: PodcastListRoute) {
        switch route {
        case .detail(let podcast):
            print("Detail")
        }
    }
    
    
}
