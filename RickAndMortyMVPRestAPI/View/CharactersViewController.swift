//
//  CharactersViewController.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 19.01.2021.
//

import UIKit

private let reuseIdentifire = "RickAndMortyCell"

class CharactersViewController: ChildViewController, CharactersViewControllerProtocol {
    
    func collectionViewReloaded() {
        self.collectionView.reloadData()
    }
    
    func startLoading() {
        view.addSubview(loader)
        loader.startAnimating()
    }
    
    func stopLoading() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.loader.stopAnimating()
        }
    }
    
    

    
    
    private let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        return loader
    }()
    
    lazy private var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionViewPosition = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
      var collectionView = UICollectionView(frame: collectionViewPosition, collectionViewLayout: collectionViewLayout)
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifire)
        collectionView.backgroundColor = . red
        return collectionView
    }()
    
    var presenter: CharactersPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = CharactersPresenter(controller: self)
        configureViewComponents()
    }
    
    func configureViewComponents () {
        
        navigationController?.navigationBar.barTintColor = . red
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Rick and Morty"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = . white
        collectionView.dataSource = self
        collectionView.delegate = self
    view.addSubview(collectionView)
    }
    
   @objc private func showSearchBar () {
    print ("123")
    }
    
    


}

  //MARK: - Collection view DataSource and Delegate
extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath) as! CharactersCollectionViewCell
        cell.backgroundColor = .green
        cell.layer.cornerRadius = 16
//        cell.layer.
        return cell
    }

}


//MARK: - UICollectionViewDelegateFlowLayout
extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 2
        let height = (view.frame.height - 36) / 3
        
        return CGSize(width: width, height: height)
    }
}


protocol CharactersViewControllerProtocol {
    func startLoading ()
    func stopLoading ()
    func collectionViewReloaded ()
    
}






