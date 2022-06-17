//
//  PodcastListBuilder.swift
//  PodcastVIPER
//
//  Created by omer-mac on 26.04.2022.
//

import UIKit

final class PodcastListBuilder {
    
    static func make() -> PodcastListVC {
        let storyBoard = UIStoryboard(name: "PodcastList", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier:"PodcastListVC") as! PodcastListVC
        let router = PodcastListRouter(view: view)
        let interactor = PodcastListInteractor(service: app.service)
        let presenter = PodcastListPresenter(view: view,
                                             interactor: interactor,
                                             router: router)
        view.presenter = presenter
        return view
    }
}
