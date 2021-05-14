//
//  CatFact.swift
//  Cat Fact
//
//  Created by JiaChen(: on 14/5/21.
//

import Foundation

struct CatFact: Codable {
    var text: String
    var id: String
    var source: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case id = "_id"
        case source
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try valueContainer.decode(String.self, forKey: CodingKeys.text)
        self.id = try valueContainer.decode(String.self, forKey: CodingKeys.id)
        self.source = try valueContainer.decode(String.self, forKey: CodingKeys.source)
    }
    
}
