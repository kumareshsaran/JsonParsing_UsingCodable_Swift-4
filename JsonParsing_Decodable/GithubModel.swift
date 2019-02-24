//
//  GithubModel.swift
//  JsonParsing_Decodable
//
//  Created by CSS on 24/02/19.
//  Copyright © 2019 css. All rights reserved.
//

import Foundation

class GitHubModel : Codable {
    var login : Int?
    var id : Int?
    
   required init(with deCoder: Decoder) throws {
        let values = try deCoder.container(keyedBy: CodingKeys.self)
        login = try? values.decode(Int.self, forKey: .login)
        id = try? values.decode(Int.self, forKey: .id)
    }
}
