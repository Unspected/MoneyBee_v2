//
//  RegisterViewModelImpl.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/18/23.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class RegisterViewModelImpl: RegisterViewModel {
    
    var isValidFullUserData = PublishSubject<Bool>()
    
    let bag = DisposeBag()
    
    var usernamePublisher = BehaviorSubject<String>(value: "")
    
    var emailPublisher = BehaviorSubject<String>(value: "")
    
    var passwordPublisher = BehaviorSubject<String>(value: "")
    
    var repeatPasswordPublisher = BehaviorSubject<String>(value: "")
    
    var validPassword = PublishSubject<Bool>()
    
    var validUserData = PublishSubject<Bool>()
    
    var users = PublishSubject<UserModel>()
    
    
    func createNewUser() {
        
        Observable.combineLatest(passwordPublisher, repeatPasswordPublisher).subscribe { passwordValue,passwordValue2 in
            if passwordValue.count > 5 && passwordValue == passwordValue2 {
                self.validPassword.onNext(true)
            } else {
                self.validPassword.onNext(false)
            }
        }.dispose()
        
        Observable.combineLatest(usernamePublisher, emailPublisher).subscribe { username, email in
            if username.isValidShortname() && email.isValidLoginEmail() {
                self.validUserData.onNext(true)
            } else {
                self.validUserData.onNext(false)
            }
        }.dispose()
        
//        Observable.combineLatest(validUserData, validPassword).subscribe { validUserAndEmail, validPassword in
//            if validUserAndEmail && validPassword {
//                self.isValidFullUserData.onNext(true)
//            } else {
//                self.isValidFullUserData.onNext(false)
//            }
//        }.disposed(by: bag)
    }
    
    
   
    
    
}
