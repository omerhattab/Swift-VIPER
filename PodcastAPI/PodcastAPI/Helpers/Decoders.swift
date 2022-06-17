//
//  Decoders.swift
//  PodcastAPI
//
//  Created by omer-mac on 22.01.2022.
//

import Foundation

public enum Decoders{
    static let plainDateDecoderr : JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
