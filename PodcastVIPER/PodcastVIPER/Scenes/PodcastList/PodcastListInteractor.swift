//
//  MovieListInteractor.swift
//  Movie
//
//  Created by omer-mac on 13.01.2022.
//

import Foundation
import PodcastAPI

final class PodcastListInteractor: PodcastListInteractorProtocol{
    
    weak var delegate: PodcastListInteractorDelegate?
    
    private let service : TopPodcastServiceProtocol
    
    private var podcasts : [Podcast] = []
    
    init(service: TopPodcastServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        service.fetchTopPodcast { [weak self] result in
            guard let self = self else {return}
            self.delegate?.handleOutput(.setLoading(false))
            
            switch result{
            case .success(let value):
                self.podcasts = value.results
                self.delegate?.handleOutput(.showPodcastList(value.results))
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func selectPodcast(at index: Int) {
        let podcast = podcasts[index]
        delegate?.handleOutput(.showMPodcastDetail(podcast))
    }
}
