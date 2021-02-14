//
//  CharactersPresenter.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 25.01.2021.
//

import Foundation

class CharactersPresenter: CharactersPresenterProtocol {
    
    var arrayOfCharacters  : [Welcome]?
  var networkManager = NetworkManager()
    var dataLoaded: Bool = false
    var controller : CharactersViewControllerProtocol
    
     init (controller: CharactersViewControllerProtocol ) {
        self.controller = controller
    }
   
    
     func getArrayOfCharacters () {
        networkManager.getData {  [weak self] (result) -> (Void) in
            DispatchQueue.main.async {
                self?.controller.startLoading()
            switch result {
            case .success(let posts):
                    self?.arrayOfCharacters = posts
                    self?.dataLoaded = true
                    self?.dataCheck()
            case .failure(let error):
                print(error)
            }
            }
        }
    }
    
    
    private func dataCheck () {
        if dataLoaded {
            controller.collectionViewReloaded()
            controller.stopLoading()
            
        }
    }
}

protocol CharactersPresenterProtocol {
    func getArrayOfCharacters ()
}
