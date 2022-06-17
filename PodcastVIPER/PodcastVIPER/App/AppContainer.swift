//
//  AppContainer.swift
//  PodcastVIPER
//
//  Created by omer-mac on 26.04.2022.
//

import Foundation
import PodcastAPI

let app = AppContainer()

final class AppContainer{
    let router = AppRouter()
    let service = TopPodcastService()
}
