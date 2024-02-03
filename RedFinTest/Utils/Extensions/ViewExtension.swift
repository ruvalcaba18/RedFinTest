//
//  ViewExtension.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
import UIKit

extension UIView {
    
     @discardableResult
     func fromNib<T : UIView>() -> T? {
         guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {    // 3
             print("Nib dont show\(String(describing: self))")
             return nil
         }
         contentView.frame = bounds
         contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         contentView.translatesAutoresizingMaskIntoConstraints = true
         addSubview(contentView)
         return contentView
     }
    
    
    
 }
