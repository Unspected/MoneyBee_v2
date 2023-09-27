
import Foundation

struct ProfileModel {
    let firstName: String?
    let lastName: String?
    let email: String?
    let phone: String?
    let license: [DictionaryData]?
}

struct DictionaryData {
    let id: Int?
    let name: String?
}
