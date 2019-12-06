//
//  TableViewVC.swift
//  zhouyi
//
//  Created by 聂飞安 on 2019/9/16.
//  Copyright © 2019 聂飞安. All rights reserved.
//

import UIKit
import NFAToolkit
open class TableViewVC: BaseVC {
    
    public var tableView : UITableView!
    public var style : UITableView.Style! =  UITableView.Style.plain
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight),style: style)
        tableView.tableFooterView = UIView()
        tableView.sectionFooterHeight = 0.1
        
        tableView.tableHeaderView = UIView()
        tableView.sectionHeaderHeight = 0.1
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        self.view.addSubview(tableView)
       
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
      
        // Do any additional setup after loading the view.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

