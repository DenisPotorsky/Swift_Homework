//
//  ProfileModel.swift
//  MyApp
//
//  Created by Den on 20.08.2023.
//

import Foundation

struct ProfileModel: Decodable {
    var response: [Profile]
}

struct Profile: Decodable {
    var firstName: String?
    var lastName: String?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
}
