//
//  NetworkManager.swift
//  H4X0RSwiftUIApp
//
//  Created by Usha Sai Chintha on 11/09/22.
//

import Foundation

// in order to pass data from this manager to contents view, we use ObservableObject protocol
// it helps in broadcasting one or many of its properties to interested properties

class NetworkManager: ObservableObject{
    
    // published tag helps in publishing the properties
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error)
                }else{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                    let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
