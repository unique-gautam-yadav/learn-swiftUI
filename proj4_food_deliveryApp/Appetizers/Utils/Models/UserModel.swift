//
//  UserModel.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import Foundation


struct UserModel: Codable {
    var firstName: String           = ""
    var lastName: String            = ""
    var email: String               = ""
    var birthdate: Date             = Date()
    var napkin: Bool                = false
    var refils: Bool                = false
}
