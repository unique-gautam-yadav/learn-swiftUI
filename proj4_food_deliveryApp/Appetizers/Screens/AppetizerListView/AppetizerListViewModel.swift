//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import Foundation

final class AppetizerListViewModel : ObservableObject  {
    
    @Published var appetizers:[AppetizerModel] = []
    @Published var alert: AlertModel?
    @Published var isLoading: Bool = false
    
    @Published var detailShown: Bool = false
    @Published var selectedItem: AppetizerModel? = nil
    
    func getData() {
        self.isLoading = true
        self.appetizers = []
        
         Task {
            do {
              appetizers = try await NetworkManager.shared.getAppetizers()
            } catch {
                alert = AlertContext.invalidResponse
            }
             self.isLoading = false
        }
        

        
//         NetworkManager.shared.getAppetizers { [self] res in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch res {
//                case .success(let data):
//                    self.appetizers = data
//                case .failure(let err):
//                    switch err {
//                        
//                    case .invalidURL:
//                        self.alert = AlertContext.invalidUrl
//                    case .invalidResponse:
//                        self.alert = AlertContext.invalidResponse
//                    case .invalidData:
//                        self.alert = AlertContext.invalidData
//                    case .unableToComplete:
//                        self.alert = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
    }
}
