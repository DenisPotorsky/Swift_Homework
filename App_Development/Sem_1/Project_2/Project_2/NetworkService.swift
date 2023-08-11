//
//  NetworkService.swift
//  Project_2
//
//  Created by Den on 11.08.2023.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = "vk1.a.cosjGAhsidr8c4ew78JMQSwc2SRZ45Z4syqB7Y8he9YCKRNEsqnRUnQ0ecUsYKxOlhYZMQWdMz0Zw3RLcc3SYCS0Zqb2XWiWtL2-hZre-2HJnkm-ABptLi5Ycs5rZK8LFFKAWusTGhAFNsWpz-D58BQJlbks6AhZjUCQJ59MMAq7RX76GYmj0O4O9JmfEUfoyARgpoW0NkmqQBndWZlGFQ"
    static var userID = "582582415"
    
    func getPhotos() {
        let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile")
        
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let towns = try JSONDecoder().decode(PhotoModel.self, from: data)
                print(towns)
            } catch {
                print(error)
            }
        }.resume()
    }
    func getFriends() {
        let url = URL(string: "https://api.vk.com/method/friends.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131")
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let towns = try JSONDecoder().decode(FriendsModel.self, from: data)
                print(towns)
            } catch {
                print(error)
            }
        }.resume()    }
}
