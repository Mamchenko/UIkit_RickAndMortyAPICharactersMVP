//
//  RootPresenter.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 31.01.2021.
//

import Foundation

class RootPresenter {
    
    
   private func userDefaultValueCheck () -> Bool {
        return UserDefaults.standard.value(forKey: "LOGIN") != nil
    }
    
    
}
