//
//  Result.swift
//  PodcastAPI
//
//  Created by omer-mac on 22.01.2022.
//

import Foundation

public enum Result<Value>{
    case success(Value)
    case failure(Error)
}

