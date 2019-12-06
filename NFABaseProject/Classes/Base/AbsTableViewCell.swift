//
//  AbsTableViewCell.swift
//  iOSUtils
//
//  Created by 聂飞安 on 2019/6/15.
//  Copyright © 2019 聂飞安. All rights reserved.
//

import Foundation
import UIKit
import NFAToolkit

open class AbsTableViewCell: UITableViewCell {
    
    // 用户数据，传递数据用
    public var userData : AnyObject?
    public weak var baseView : UIViewController!
    public var cb : CB!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
