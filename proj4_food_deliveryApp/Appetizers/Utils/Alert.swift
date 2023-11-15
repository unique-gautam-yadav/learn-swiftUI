//
//  Alert.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import SwiftUI

struct AlertModel : Identifiable {
    var id = UUID()
    var title: Text
    var description: Text
    var dismissButton: Alert.Button
}



struct AlertContext {
    //MARK - Network alerts
    static let invalidUrl           =   AlertModel(title: Text("Server Error"),
                                                   description: Text("There was an issue connection to the server. If this presists, please contact support."),
                                                   dismissButton: .default(Text("OK")))
    
    
    static let invalidResponse      =   AlertModel(title: Text("Server Error"),
                                                   description: Text("Invalid response from the server, please wait or contact to support."),
                                                   dismissButton: .default(Text("OK")))
    
    
    static let invalidData          =   AlertModel(title: Text("Server Error"),
                                                   description: Text("The data received from server is invalid please contact to support."),
                                                   dismissButton: .default(Text("OK")))
    
    
    static let unableToComplete     =   AlertModel(title: Text("Server Error"),
                                                   description: Text("Unable to complete your request at the moment please check your internet connection."),
                                                   dismissButton: .default(Text("OK")))
    
    //MARK - Account Form alerts
    static let requredfields        =   AlertModel(title: Text("Incomplete information"),
                                                   description: Text("All fields are required, please fill up all the fields with correct value"),
                                                   dismissButton: .default(Text("OK")))

    static let invalidMail          =   AlertModel(title: Text("Invalid mail"),
                                                   description: Text("Mail you've entered is invalid, please enter a valid mail."),
                                                   dismissButton: .default(Text("OK")))

    static let userSaveSuccess      =   AlertModel(title: Text("Profile Saved"),
                                                   description: Text("Your profile information was saved successfully."),
                                                   dismissButton: .default(Text("OK")))
    static let invalidUserData      =   AlertModel(title: Text("Profile Error"),
                                                   description: Text("Something went wrong while communication with the local database."),
                                                   dismissButton: .default(Text("OK")))
}
