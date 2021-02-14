//
//  AnimationManager .swift
//  RickAndMortyMVPRestAPI
//
//  Created by Anatoliy Mamchenko on 05.02.2021.
//

import Foundation
import UIKit
import SnapKit

class AnimationManager {
    

    
}


extension  UIView  {
 
    func customViewAnimation (duration: AnimationSlideTransition, view: UIView) {
        
        switch duration {
        case .leftSideAnimation:
            UIView.animate(withDuration: 1.5) {
                self.changingConstraintsToLeft(view: view)
                self.layoutIfNeeded()
            }
        case .rightSideAnimation:
            UIView.animate(withDuration: 1.5) {
                self.changingConstraintsToRight(view: view)
                self.layoutIfNeeded()
            }
        }
        
    }
    
    
    private func changingConstraintsToLeft (view: UIView) {
        self.snp.remakeConstraints { (make) in
            make.trailing.equalTo(view.snp.leading)
            make.leading.equalTo(view.snp.leading)
        }
    }
    
    private func changingConstraintsToRight (view: UIView) {
        self.snp.remakeConstraints { (make) in
            make.trailing.equalTo(view.snp.trailing)
            make.leading.equalTo(view.snp.trailing)
    }
    
}


}

extension UITableViewCell {
    
}

enum AnimationSlideTransition {
    case leftSideAnimation
    case rightSideAnimation
}
