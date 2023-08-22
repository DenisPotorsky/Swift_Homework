//
//  NetworkService.swift
//  SwiftUIProject
//
//  Created by Den on 22.08.2023.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    
    func getNews(completion: @escaping ([News]) -> ()) {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?fields=publication_date,title&text_format=text&actual_only=true")
        else {return }
        session.dataTask(with: url) { (data, _, error) in
                    guard let data else {
                        return
                    }
                    do {
                        print(data)
                        let news = try JSONDecoder().decode(NewsModel.self, from: data)
                        completion(news.results)
                    } catch {
                        print(error)
                    }
                }.resume()    }
}
