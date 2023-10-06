
import SwiftUI
import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var isEditProfile: Bool = false
    @Published var validationError: Bool = false
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    
    init(profile: ProfileModel) {
        self.firstName = profile.firstName ?? "uknown"
        self.lastName = profile.lastName ?? "uknown"
        self.email = profile.email ?? "uknown"
        self.phone = profile.phone ?? "uknown"
        
    }
}
