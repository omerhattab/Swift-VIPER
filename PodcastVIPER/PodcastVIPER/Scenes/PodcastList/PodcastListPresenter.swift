//
//  MovieListPresenter.swift
//  Movie
//
//  Created by omer-mac on 13.04.2022.
//

import Foundation

final class PodcastListPresenter: PodcastListPresenterProtocol{
    
    private unowned let view: PodcastListViewProtocol
    private let interactor:PodcastListInteractorProtocol
    private let router : PodcastListRouterProtocol
    
    init(view: PodcastListViewProtocol,
         interactor: PodcastListInteractorProtocol,
         router: PodcastListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        view.handleOutput(.updateTitle("Podcast"))
        interactor.load()
    }
    
    func selectPodcast(at index: Int) {
        interactor.selectPodcast(at: index)
    }
    
}

extension PodcastListPresenter: PodcastListInteractorDelegate{
    func handleOutput(_ output: PodcastListInteractorOutput) {
            switch output {
            case .setLoading(let isLoading):
                view.handleOutput(.setLoading(isLoading))
            case .showPodcastList(let podcast):
                let podcastPresentations = podcast.map(PodcastPresentation.init)
                view.handleOutput(.showPodcastList(podcastPresentations))
            case .showMPodcastDetail(let podcast):
                router.navigate(to: .detail(podcast))
        }
    }
}
