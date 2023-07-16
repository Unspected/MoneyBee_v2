//
//  LoginViewModelImpl.swift
//  MoneyBee

import Foundation
import Combine
import UIKit

class LoginViewModelImpl: LoginViewModel {
    
    
    let users = [UserModel(userName: "pasha", password: "123", email: ""),
                 UserModel(userName: "masha", password: "321", email: ""),
                 UserModel(userName: "vasya", password: "542", email: ""),
                 UserModel(userName: "petya", password: "643", email: ""),
                 UserModel(userName: "admin", password: "1", email: "admin")
    ]
    
    
    init() {
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
