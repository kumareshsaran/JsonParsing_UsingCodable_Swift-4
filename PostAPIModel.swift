//
//  PostAPIModel.swift
//  JsonParsing_Decodable
//
//  Created by CSS on 24/02/19.
//  Copyright © 2019 css. All rights reserved.
//

import Foundation


struct  PostAPIModel: Codable {
    var title : String?
    var body : String?
    var userId: Int?
}
struct  PostAPIModelResponse: Codable {
    var title : String?
    var body : String?
    var userId: Int?
}
