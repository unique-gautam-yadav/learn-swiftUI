//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import SwiftUI
import RegexBuilder

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user: UserModel = UserModel()
    @Published var alert: AlertModel? = nil
    
    
    func saveChange (){
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alert = AlertContext.userSaveSuccess
        } catch {
            alert = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            alert = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else  {
            alert = AlertContext.requredfields
            return false
        }
        
        guard user.email.isValidMail else {
            alert = AlertContext.invalidMail
            return false
        }
        
        return true
    }

    
}


extension String {
    var isValidMail: Bool {
        let reg             = Regex {
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf(".-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "."
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
        }
        
        return self.wholeMatch(of: reg) != nil
      
    }
}
