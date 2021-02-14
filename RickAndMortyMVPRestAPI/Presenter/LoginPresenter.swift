//
//  LoginPresenter.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 16.01.2021.
//

import Foundation

let USERNAME_KEY = "LOGIN"

struct Presenter: LoginPresenterProtocol {
    
    var validationMessage: UsernameValidation?
    
    var controller: LoginViewProtocol
    
    init(controller: LoginViewProtocol) {
        self.controller = controller
    }
    
    mutating func buttonPressed (inputValue: String) {
        if validCheckForUITextField(text: inputValue) {
            validationMessage = .isValid
            saveUsernameToUserDefaults(inputString: inputValue) }
        else {
            validationMessage = .usernamelenghtIsTooShort
            }
        controller.labelArlert()
        }
    
   private func validCheckForUITextField(text: String) -> Bool {
        return text.count > 4
    }
    
   private func saveUsernameToUserDefaults (inputString: String) {
        UserDefaults.standard.setValue(inputString, forKey: USERNAME_KEY)
    }
    
    
    
    
}


protocol LoginPresenterProtocol {
    
    
}

enum UsernameValidation {
    case isValid
    case usernamelenghtIsTooShort
    
    func usernameValidationMessage () -> String {
        switch self {
        case .isValid:
           return " "
        case .usernamelenghtIsTooShort:
            return "Username is too short "
        }
    }
}
