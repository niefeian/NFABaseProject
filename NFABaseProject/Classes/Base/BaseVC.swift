//
//  BaseVC.swift
//
//  Created by admin on 2019/7/16.
//  Copyright © 2019 聂飞安. All rights reserved.
//

import UIKit
import NFAToolkit

open class BaseVC: UIViewController , IDataPost {
    
    open var postData : AnyObject?
    open var callBack: CBWithParam?
    open var loding = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        #if DEBUG
        print("当前类:\(self.classForCoder)")
        #endif
   UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: -10000, vertical: 0), for: UIBarMetrics.default)
        
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    

    @objc open func reLoadData(){
        
    }
    
    
    lazy public var backImgBtn: UIButton = {
        //设置返回按钮属性
        let backBtn = UIButton(type: UIButton.ButtonType.custom)
        
        backBtn.setImage(UIImage(named: "btn_return"), for: UIControl.State())
        backBtn.setImage(UIImage(named: "btn_return"), for: .highlighted)
        backBtn.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        backBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        backBtn.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 0)
        backBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -15, bottom: 0, right: 0)
        let btnW: CGFloat = AppWidth > 375.0 ? 60 : 54
        backBtn.frame = CGRect(x: 0, y: 0, width: btnW, height: 40)
        return backBtn
    }()

    
    
    //生成一个指定颜色的图片
   public func createImageWithColor(_ color: UIColor, frame: CGRect) -> UIImage? {
        // 开始绘图
        UIGraphicsBeginImageContext(frame.size)
        
        // 获取绘图上下文
        let context = UIGraphicsGetCurrentContext()
        // 设置填充颜色
        context?.setFillColor(color.cgColor)
        // 使用填充颜色填充区域
        context?.fill(frame)
        
        // 获取绘制的图像
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // 结束绘图
        UIGraphicsEndImageContext()
        return image
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = (self.navigationController?.viewControllers.count ?? 0) > 1

    }
    
    var blankImage: CustomImageView?
    var blankLabel: UILabel?
    //加了一个高度属性，针对不同的页面可以自定义头部距离
    public func showBlankDataTip(_ message : String = "网络不可用，请检查您的网络连接"  ,imgString : String = "pic_kong_wangluo",topConstant:CGFloat = AppHeight*0.3, addInTheView: UIView , cb : @escaping CBWithParam) {
        if blankImage?.superview != nil {
            return
        }
        blankImage = CustomImageView(image: UIImage(named: imgString))
        blankImage!.translatesAutoresizingMaskIntoConstraints = false
        let imageTop = NSLayoutConstraint(item: blankImage!, attribute: .top, relatedBy: .equal, toItem: addInTheView, attribute: .top, multiplier: 1, constant:topConstant)
        let imageCenterX = NSLayoutConstraint(item: blankImage!, attribute: .centerX, relatedBy: .equal, toItem: addInTheView, attribute: .centerX, multiplier: 1, constant: 0)
        addInTheView.addSubview(blankImage!)
        addInTheView.addConstraints([imageTop, imageCenterX])
        blankLabel = UILabel()
        blankLabel!.textColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        blankLabel!.translatesAutoresizingMaskIntoConstraints = false
        addInTheView.addSubview(blankLabel!)
        blankLabel!.text = message
        blankLabel?.font = UIFont.systemFont(ofSize: 14)
        blankLabel?.textAlignment = .center
        blankImage?.addClickEvents(cb)
        let dataTop = NSLayoutConstraint(item: blankLabel!, attribute: .top, relatedBy: .equal, toItem: blankImage, attribute: .bottom, multiplier: 1, constant: 10)
        let dataCenterX = NSLayoutConstraint(item: blankLabel!, attribute: .centerX, relatedBy: .equal, toItem: blankImage, attribute: .centerX, multiplier: 1, constant: 0)
        addInTheView.addConstraints([dataTop, dataCenterX])
      
    }
    
   public func hiddenBlankDataTip() {
        blankImage?.removeFromSuperview()
        blankLabel?.removeFromSuperview()
        blankImage = nil
        blankLabel = nil
    }

    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    open func postData(_ postData : AnyObject?) {
        self.postData = postData
    }
    
    open func regCallBack(_ cb : @escaping CBWithParam) {
        self.callBack = cb
    }
    
    deinit {
        #if DEBUG
        print("\(self.classForCoder)销毁")
        #endif
        
    }
    
    @objc open func backAction() {
        Tools.popView(self)
    }
    
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.default
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

