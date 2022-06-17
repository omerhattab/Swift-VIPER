//
//  MoviePresentation.swift
//  Movie
//
//  Created by omer-mac on 18.04.2022.
//
import UIKit
import PodcastAPI

final class PodcastPresentation: NSObject {
    
    let title: String
    let detail: String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? PodcastPresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}

extension PodcastPresentation {
    convenience init(podcast: Podcast) {
        self.init(title: podcast.name, detail: podcast.artistName)
    }
}
