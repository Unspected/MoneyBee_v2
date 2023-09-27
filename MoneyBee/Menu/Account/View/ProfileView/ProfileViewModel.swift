
import SwiftUI
import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var isEditProfile: Bool = false
    @Published var validationError: Bool = false
    @Published var firstName: String = "" {
        didSet {
            if !self.firstName.contains("@") {
                validationError = true
            }
        }
    }
    
    @Published var lastName: String = ""
    
    init(profile: ProfileModel) {
        self.firstName = profile.firstName ?? ""
        self.lastName = profile.lastName ?? ""
        
    }
}
