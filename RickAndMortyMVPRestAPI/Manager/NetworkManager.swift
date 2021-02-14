//
//  NetworkManager.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 19.01.2021.
//

import Foundation

struct NetworkManager {
    
    
      
    
    func getData (complition: @escaping ((PostsResults) ->(Void))) {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else {return}
        
        
        DispatchQueue.global(qos: .utility).async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                var result : PostsResults
                if error == nil, let parsData = data {
                    guard let posts = try? JSONDecoder().decode([Welcome].self, from: parsData) else {return}
                    result = .success(posts: posts)
                } else {
                    result = .failure(error: error!.localizedDescription)
                }
                complition(result)
            }.resume()
        }
    }
}

enum PostsResults {
    case success(posts: [Welcome])
    case failure(error: String)
}
