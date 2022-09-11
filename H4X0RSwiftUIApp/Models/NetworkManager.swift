//
//  NetworkManager.swift
//  H4X0RSwiftUIApp
//
//  Created by Usha Sai Chintha on 11/09/22.
//

import Foundation

class NetworkManager{
    
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
