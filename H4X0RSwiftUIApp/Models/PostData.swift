//
//  PostData.swift
//  H4X0RSwiftUIApp
//
//  Created by Usha Sai Chintha on 11/09/22.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post:Decodable, Identifiable{
    // computed properties
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let url: String? // as url in the response is sometimes nil.. so we updated the data type accordingly
    let points: Int
}
