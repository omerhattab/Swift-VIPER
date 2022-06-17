//
//  PodcastTests.swift
//  PodcastAPITests
//
//  Created by omer-mac on 22.04.2022.
//

import XCTest
@testable import PodcastAPI

class PodcastTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsing() throws {
        let bundle = Bundle(for: PodcastTests.self)
        let url = bundle.url(forResource: "podcast", withExtension: "json")!
        let data =  try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoderr
        let podCast = try decoder.decode(Podcast.self, from: data)
        print(podCast)
    }

    

}
