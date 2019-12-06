//
//  BaseTextFieldVC.swift
//  Fengshui
//
//  Created by 聂飞安 on 2019/11/7.
//  Copyright © 2019 Nie. All rights reserved.
//

import UIKit

open class BaseTextFieldVC: BaseVC {

   public var keyboardWillShows = [UIView]()
   public var textFields = [UITextField]()
   public var isShowTextField = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        registerKeyboardNotification()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.oneTap))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func oneTap(){
           
    }
    
    
   public func registerKeyboardNotification() {
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
          
    @objc public func keyboardWillShow(notification: NSNotification) {
           let userInfo = notification.userInfo! as NSDictionary
            let keyboardBounds = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            if keyboardBounds == nil {
                return
            }
            isShowTextField = true
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let h : CGFloat = (UIApplication.shared.statusBarFrame.height == 44) ?  33 : 0
            var deltaY = keyboardBounds!.height - 1 - h// 减去分割线高度 1
            if deltaY < 0 {
                deltaY = 270
            }
            let animation:(() -> Void) = {
               for view in self.keyboardWillShows{
                   view.transform = CGAffineTransform(translationX: 0, y: -deltaY)
               }
            }
            if duration > 0 {
                let options = UIView.AnimationOptions(rawValue: UInt((userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
                UIView.animate(withDuration: duration, delay: 0, options: options, animations: animation, completion: nil)
            } else {
                animation()
            }
       }

    @objc public func keyboardWillHide(notification: NSNotification) {
        isShowTextField = false
        
       let animation:(() -> Void) = {
           for view in self.keyboardWillShows{
               view.transform = .identity
           }
       }
       let userInfo = notification.userInfo! as NSDictionary
       let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
       if duration > 0 {
           let options = UIView.AnimationOptions(rawValue: UInt((userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
           UIView.animate(withDuration: duration, delay: 0, options: options, animations: animation, completion: nil)
       } else {
           animation()
       }
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
extension BaseTextFieldVC : UIGestureRecognizerDelegate{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let vString = "\(touch.view!.classForCoder)"
        if  vString == "UITextField" {
            return false
        }
        if isShowTextField {
            for textField in textFields{
                if textField.isFirstResponder {
                textField.resignFirstResponder()
                return true
                }
            }
        }
        return true
    }
}
