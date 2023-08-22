//
//  NewsModel.swift
//  SwiftUIProject
//
//  Created by Den on 22.08.2023.
//

import Foundation

struct NewsModel: Decodable {
    var results: [News]
}

struct News: Decodable , Identifiable{
    var id: Int
    var date: Double
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "publication_date"
        case title
    }
}
