//
//  NetworkService.swift
//  Project_2
//
//  Created by Den on 11.08.2023.
//

import Foundation
//import Alamofire

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getPhotos() {
        let url = URL(string: "")
        
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let photo = try JSONDecoder().decode(PhotoModel.self, from: data)
                print(photo)
            } catch {
                print(error) 
            }
        }.resume()
    }
    
    func getFriends() {
        let url = URL(string: "https://api.vk.com/method/friends.get?user_id=\(NetworkService.userID)&access_token=\(NetworkService.token)&v=5.131")
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                print(data)
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                print(friends)
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    func getGroups() {
        let url = URL(string: "https://api.vk.com/method/groups.get?user_id=\(NetworkService.userID)&access_token=\(NetworkService.token)&v=5.131")
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
        }.resume()    }
}
