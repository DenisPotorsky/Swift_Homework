//
//  GroupsModel.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import Foundation

struct GroupsModel: Decodable {
    var response: Groups
}

struct Groups: Decodable {
    var items: [Group]
}

struct Group: Decodable {
    var id: Int
    var name: String?
    
}
