//
//  TopPodcastResponse.swift
//  PodcastAPI
//
//  Created by omer-mac on 22.01.2022.
//

import Foundation


public struct TopPodcastResponse : Decodable {
    
    private enum RootCodingKeys : String, CodingKey{
        case feed
    }
    
    private enum FeedCodingKeys : String, CodingKey{
        case results
    }
    
    public let results : [Podcast]
    
    public init(from decoder : Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Podcast].self, forKey: .results)
        
    }
}
