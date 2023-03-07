//
//  UserModel.swift
//  MVVMBindings
//
//  Created by Андрей on 02.03.2023.
//

import Foundation

struct UserModel: Codable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}
