//
//  AccountView.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel: AccountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            
            Form {
                Section(header: Text("Personal Info")) {
                    TextField(text: $viewModel.user.firstName, label: {  Text("First Name") })
                    
                    TextField(text: $viewModel.user.lastName, label: {  Text("Last Name") })
                    
                    TextField(text: $viewModel.user.email, label: {  Text("Email") })
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    
                    DatePicker(selection: $viewModel.user.birthdate, displayedComponents: .date) { Text("Bithday") }
                    
                    Button(action: { viewModel.saveChange() }) { Text ("Save Changes")}
                }
                
                Section( header : Text("Requests")) {
                    Toggle(isOn: $viewModel.user.napkin) { Text("Extra Napkins") }
                    Toggle(isOn: $viewModel.user.refils) { Text("Frequent Refils") }
                }
            }
            .navigationTitle("Account  ")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title, message: alert.description, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
