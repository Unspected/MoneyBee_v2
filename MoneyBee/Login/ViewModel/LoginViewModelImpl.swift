//
//  LoginViewModelImpl.swift
//  MoneyBee

import Foundation
import Combine
import UIKit

class LoginViewModelImpl: LoginViewModel {
    
    var goals = CurrentValueSubject<[GoalModel], Never>([])
    
    let users = [UserModel(userName: "pasha", password: "123", email: ""),
                 UserModel(userName: "masha", password: "321", email: ""),
                 UserModel(userName: "vasya", password: "542", email: ""),
                 UserModel(userName: "petya", password: "643", email: ""),
                 UserModel(userName: "admin", password: "1", email: "admin")
    ]
    
    
    func fetchUser(url: URL) {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            .decode(type: [GoalModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { print ("Received completion: \($0).") },
                  receiveValue: { [weak self] value in
                self?.goals.value = value
            })
            .store(in: &cancellable)
    }
    
    init() {
        fetchUser(url: URL(string: "lalala")!)
    }
    
    
    var cancellable = Set<AnyCancellable>()
    
    var isValid = PassthroughSubject<Bool, Never>()
    
    var loginValue =  CurrentValueSubject<String, Never>("")
    
    var passwordValue = CurrentValueSubject<String, Never>("")
    
    func authorization() {
        let loginPublisher = Publishers.CombineLatest(loginValue, passwordValue)
            .map { (login, password) in
                if self.users.contains(where: { model in
                    model.userName == login && model.password == password
                }) {
                    return true
                    
                } else {
                    return false
                }
            }
        // CANCEL SUBSCRIBE HERE
        loginPublisher.sink { sucess in
            self.isValid.send(sucess)
        }.cancel()
        
    }

}
