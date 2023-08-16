//
//  NetworkService.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getPhotos() {
        let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(NetworkService.token)&v=5.131&album_id=profile")
        
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotoModel.self, from: data)
                print(photos)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getFriends() {
        let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50&access_token=\(NetworkService.token)&v=5.131")
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                print(friends)
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    func getGroups() {
        let url = URL(string: "https://api.vk.com/method/groups.get?user_id=\(NetworkService.userID)&access_token=\(NetworkService.token)&v=5.131&extended=1")
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                print(groups)
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
