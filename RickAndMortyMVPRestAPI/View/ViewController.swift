//
//  ViewController.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 16.01.2021.
//

import UIKit


class ViewController: ChildViewController, LoginViewProtocol {

    
    private var usernameTextField : UITextField  = {
        let field = UITextField()
        return field
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var logoImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private var validLoginMessageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    var presenter: Presenter?

    
    
    func labelArlert() {
        usernameTextField.text = presenter?.validationMessage?.usernameValidationMessage()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
       presenter = Presenter(controller: self)
    }
    
    private func configureViewComponents () {
        [usernameTextField, loginButton, logoImageView, validLoginMessageLabel].forEach {self.view.addSubview($0)}
    }


}

private func constraintesSetUp () {
    
}



protocol LoginViewProtocol {
func labelArlert ()
}



