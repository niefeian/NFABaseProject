

import Foundation
import UIKit
import NFAToolkit

public class CustTabBarVC: UITabBarController , UITabBarControllerDelegate{
    
    var imageView : UIImageView?
   
    private var userTabBarItem : UITabBarItem?// 我的界面的下标
    
    override public var shouldAutorotate : Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
       
        let attr = NSDictionary(object:  UIColor.initString("##1D2742"), forKey: NSAttributedString.Key.foregroundColor as NSCopying)
        UITabBarItem.appearance().setTitleTextAttributes(attr as? [NSAttributedString.Key : Any], for: UIControl.State.selected)
        
        let attr2 = NSDictionary(object: UIColor.initString("##929DB2"), forKey: NSAttributedString.Key.foregroundColor as NSCopying)
        UITabBarItem.appearance().setTitleTextAttributes(attr2 as? [NSAttributedString.Key : Any], for: UIControl.State.normal)
//        initTabBarState()
        
//        if  UserDefaults.standard.object(forKey: "CustTabBarVC") == nil {
//               UserDefaults.standard.set("CustTabBarVC", forKey: "CustTabBarVC")
//              self.selectedIndex = 3
//           }
        
//        self.delegate = self
    }
    

    func initTabBarState() {
        // 初始化底部页签的状态
        let uis = self.customizableViewControllers
        self.tabBarController?.tabBar.delegate = self
        for ui in uis! {
            let tabBar = ui.tabBarItem
            if ui.tabBarItem.tag == 1 {
                tabBar?.image = UIImage(named: "tab_fengshui_def")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_fengshui_sele")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            } else if ui.tabBarItem.tag == 0 {
                tabBar?.image = UIImage(named: "tab_yunshi_def")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_yunshi_sele")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            } else if ui.tabBarItem.tag == 2 {
                tabBar?.image = UIImage(named: "tab_luopan_def")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_loupan_sele")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            } else if ui.tabBarItem.tag == 3 {
                tabBar?.image = UIImage(named: "tab_bazi_def")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_bazi_sele")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            }else if ui.tabBarItem.tag == 4 {
                tabBar?.image = UIImage(named: "tab_me_def")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_me_sele")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            }
        }
    }
    
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
        
}

