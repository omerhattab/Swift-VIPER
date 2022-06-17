//
//  TopPodcastService.swift
//  PodcastAPI
//
//  Created by omer-mac on 22.01.2022.
//

import Foundation
import Alamofire

public protocol TopPodcastServiceProtocol {
    func fetchTopPodcast(completion: @escaping (Result<TopPodcastResponse>) -> Void)
}

public class TopPodcastService: TopPodcastServiceProtocol {
    public enum Error: Swift.Error{
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init(){ }
    
    public func fetchTopPodcast(completion: @escaping (Result<TopPodcastResponse>) -> Void) {
        //https://rss.applemarketingtools.com/api/v2/tr/music/most-played/10/music-videos.json
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/music/most-played/10/music-videos.json"
        
        AF.request(urlString).responseData{(response) in
            switch response.result{
            case .success(let data):
                let decoder = Decoders.plainDateDecoderr
                do {
                    let response = try decoder.decode(TopPodcastResponse.self, from: data)
                    completion(.success(response))
                }catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }

}

