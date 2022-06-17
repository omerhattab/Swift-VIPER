//
//  Podcast.swift
//  PodcastAPI
//
//  Created by omer-mac on 22.01.2022.
//

import Foundation

public struct Podcast: Decodable{
    
    public enum CodingKeys : String, CodingKey{
        case artistName
        case releaseDate
        case name
        case image = "artworkUrl100"
        case genres
    }
    
    public let artistName : String
    public let releaseDate : Date
    public let name : String
    public let image : URL
    public let genres : [Genres]

}

public struct Genres: Decodable{
    public let name : String
}
