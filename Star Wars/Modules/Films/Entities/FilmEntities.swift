//
//  FilmEntities.swift
//  Star Wars
//
//  Created by TejaDanasvi on 19/11/21.
//

import Foundation

struct Film: Codable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    
    private enum CodingKeys : String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
    }
}
