
import Foundation

struct GoalModel: Codable {
    let type: Category
    let goalName: String
    let budgetAmount: Float
    let currentCosts: Float
    
}

struct Category: Codable {
    let name: String
}
