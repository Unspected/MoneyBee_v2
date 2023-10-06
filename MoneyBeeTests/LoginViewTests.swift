import XCTest
import Combine
import RxSwift

@testable import MoneyBee

class LoginTestsView: LoginViewModel {
    
    var loginValue = CurrentValueSubject<String, Never>("")
    
    var passwordValue = CurrentValueSubject<String, Never>("")
    
    var isValid = PassthroughSubject<Bool, Never>()
    
    func authorization() {
        <#code#>
    }
    
    func signUpButtonPressed() {
        <#code#>
    }
    
    
}

final class LoginViewTests: XCTestCase {
    
    var viewModel: LoginTestsView!
    var cancallables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = LoginTestsView()
        cancallables = Set<AnyCancellable>()
        
    }
    
    func firstTest() {
        viewModel.loginValue.send("login")
        
        
        viewModel.loginValue.sink(receiveValue: { result in
            XCTAssertEqual(result, "login")
        }).store(in: &cancallables)
        
        
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
 

}
