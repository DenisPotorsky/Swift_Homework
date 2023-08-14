//
//  FriendsModel.swift
//  Project_2
//
//  Created by Den on 11.08.2023.
//

import Foundation

struct FriendsModel: Codable {
    var response: Friends
}

struct Friends: Codable {
    var items: [Friend]
}

struct Friend: Codable {
    var id: Int
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

