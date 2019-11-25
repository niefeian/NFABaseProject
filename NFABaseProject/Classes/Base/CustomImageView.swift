//
//  CustomImageView.swift
//  zhouyi
//
//  Created by admin on 2019/7/23.
//  Copyright © 2019 聂飞安. All rights reserved.
//

import UIKit
import NFAToolkit

open class CustomImageView: UIImageView {
    
   public var block : CBWithParam?
   private var tapGestureRecognizer : UITapGestureRecognizer!
    
    open func addClickEvents(_ callback : @escaping CBWithParam){
        if tapGestureRecognizer == nil {
            tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
            tapGestureRecognizer.numberOfTapsRequired = 1
            self.isUserInteractionEnabled = true
            self.contentMode = .scaleAspectFit
            self.addGestureRecognizer(tapGestureRecognizer)
        }
        self.block = callback
    }
    
    @objc func tapGesture(){
        self.block?(nil)
    } 
}

