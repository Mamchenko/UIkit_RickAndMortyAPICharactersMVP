//
//  RootViewController.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 29.01.2021.
//

import UIKit
import SnapKit

class RootViewController: UIViewController, NavigationDelegate {
    
    
    func setRootVC() {
        
        
    }
    

    let loginVC: UIViewController? = nil
    let tableViewVC: UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
   
    
    private func ContainerViewConstraints () {
        
    }
}

protocol NavigationDelegate {
    func setRootVC()
}


