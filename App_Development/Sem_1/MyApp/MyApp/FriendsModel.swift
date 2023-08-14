//
//  File.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import Foundation

struct FriendsModel: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}

struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
