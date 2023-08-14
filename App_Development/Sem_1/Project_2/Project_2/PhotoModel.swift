//
//  PhotoModel.swift
//  Project_2
//
//  Created by Den on 11.08.2023.
//

import Foundation

struct PhotoModel: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var items: [Photo]
}

struct Photo: Decodable {
    var id: Int
    var ownerID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
    }
}
