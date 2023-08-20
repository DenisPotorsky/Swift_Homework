//
//  PhotoModel.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import Foundation

struct PhotoModel: Decodable{
    var response: Photos
}

struct Photos: Decodable {
    var items: [Photo]
}

struct Photo: Decodable {
    var id: Int
    var sizes: [Sizes]
}

struct Sizes: Decodable {
    var url: String
}
