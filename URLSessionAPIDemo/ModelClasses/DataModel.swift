//
//  DataModel.swift
//  URLSessionAPIDemo
//
//  Created by Akshay Kumar on 21/04/23.
//

import Foundation

struct DataModel {
    var email: String?
    var gender : String?
    var id : Int?
    var name : String?
    var status : String?
    
    init(email: String? = nil, gender: String? = nil, id: Int? = nil, name: String? = nil, status: String? = nil) {
        self.email = email
        self.gender = gender
        self.id = id
        self.name = name
        self.status = status
    }
}
