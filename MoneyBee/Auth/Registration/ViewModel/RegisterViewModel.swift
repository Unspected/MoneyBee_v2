//
//  RegisterViewModel.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/18/23.
//

import Foundation
import RxSwift
import RxCocoa


protocol RegisterViewModel {
    
    var usernamePublisher: BehaviorSubject<String> { get }
    var emailPublisher: BehaviorSubject<String> { get }
    var passwordPublisher: BehaviorSubject<String> { get }
    var repeatPasswordPublisher: BehaviorSubject<String> { get }
    var users: PublishSubject<UserModel> { get }
    var validPassword: PublishSubject<Bool> { get}
    var validUserData: PublishSubject<Bool> { get }
    var isValidFullUserData: PublishSubject<Bool> { get }
    func createNewUser()
    var users1: BehaviorRelay<UserModel?> { get }
}
