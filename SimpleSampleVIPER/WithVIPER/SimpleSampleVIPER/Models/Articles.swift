//
//  Articles.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

struct Articles: Codable {
    
    let author: String?
    let image: String?
    let title: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case author
        case image = "urlToImage"
        case title
        case description
    }
    
}
