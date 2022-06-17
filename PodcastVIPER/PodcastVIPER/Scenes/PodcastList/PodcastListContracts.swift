//
//  MovieListContracts.swift
//  Movie
//
//  Created by omer-mac on 13.01.2022.
//

import Foundation
import struct PodcastAPI.Podcast

// MARK: - Interactor
protocol PodcastListInteractorProtocol: class {
    var delegate : PodcastListInteractorDelegate? { get set }
    func load()
    func selectPodcast(at index: Int)
}

enum PodcastListInteractorOutput{
    case setLoading(Bool)
    case showPodcastList([Podcast])
    case showMPodcastDetail(Podcast)
}

protocol PodcastListInteractorDelegate: class {
    func handleOutput(_ output: PodcastListInteractorOutput)
}

// MARK: - Presenter
protocol PodcastListPresenterProtocol: class {
    func load()
    func selectPodcast(at index: Int)
}

enum PodcastListPresenterOutput:Equatable{
    case updateTitle(String)
    case setLoading(Bool)
    case showPodcastList([PodcastPresentation])
}

// MARK: - View
protocol PodcastListViewProtocol: class {
    func handleOutput(_ output: PodcastListPresenterOutput)
}

// MARK: - Router
enum PodcastListRoute{
    case detail(Podcast)
}

protocol PodcastListRouterProtocol: class {
    func navigate(to route: PodcastListRoute)
}
