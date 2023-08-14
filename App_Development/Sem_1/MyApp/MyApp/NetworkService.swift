//
//  NetworkService.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = "vk1.a.iE_PzcsecS_DPI1OXCOJLpJhSLYvyMTtnFFBNCRJpOmFStARSt3tGqeAaaspwezz3pyJWFba4K73vRUx9VWMofynNMnKoixjs1rXtYbcmnTu9xsEjDpf3dL4W4LSJdqLrACcVDFSSgptUu9PNXarfirhveMC17Hnxorxpdn3v-YNeAdeOLIHlGe_EarFhaY0ygXGkbs_W1RAid2b8KzYsQ"
    static var userID = "582582415"
    
    func getPhotos() {
        let url = URL(string: "")
        
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
        let url = URL(string: "https://api.vk.com/method/friends.get?user_id=\(NetworkService.userID)&access_token=\(NetworkService.token)&v=5.131")
        session.dataTask(with: url!) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                print(data)
                let towns = try JSONDecoder().decode([FriendsModel].self, from: data)
                print(towns)
            } catch {
                print(error)
            }
        }.resume()    }
}
