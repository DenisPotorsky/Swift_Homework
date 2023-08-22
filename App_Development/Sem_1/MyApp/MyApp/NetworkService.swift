//
//  NetworkService.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import Foundation

protocol NetworkServiceDelegate: AnyObject {
    func updateTable(models: [Friend])
}
final class NetworkService {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    //
    
    func getProfile(completion: @escaping (Profile?) -> Void) {
        let url = URL(string: "https://api.vk.com/method/users.get?user_ids=\(NetworkService.userID)&fields=bdate&access_token=\(NetworkService.token)&v=5.131&fields=photo_100")
        
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let profile = try JSONDecoder().decode(ProfileModel.self, from: data)
                completion(profile.response.first)
                print(profile)
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile")
        
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotoModel.self, from: data)
                completion(photos.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getFriends(complition: @escaping ([Friend]) -> Void) {
        let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50,online&access_token=\(NetworkService.token)&v=5.131")
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                complition(friends.response.items)
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    func getGroups(completion: @escaping ([Group]) -> Void) {
        let url = URL(string: "https://api.vk.com/method/groups.get?fields=description&user_id=\(NetworkService.userID)&access_token=\(NetworkService.token)&v=5.131&extended=1")
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                completion(groups.response.items)
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
}
