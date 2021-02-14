//
//  CharactersCollectionViewCell.swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 19.01.2021.
//

import UIKit
import SnapKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10 
        return view 
    }()
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        return label
    }()
    
    let statusLabel: UILabel = {
        let label: UILabel = UILabel()
        return label
    }()
    
    let lastKnownLocationLabel: UILabel = {
        let label: UILabel = UILabel()
        return label
    }()
    
    let firstSeenLabel: UILabel = {
        let label: UILabel = UILabel()
        return label
    }()
    
    
    func configureViewComponents() {
        [imageView, nameLabel, statusLabel, lastKnownLocationLabel, firstSeenLabel].forEach{addSubview($0)}
        
        imageView.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.top).offset(10)
            
        }
    }
    
}

