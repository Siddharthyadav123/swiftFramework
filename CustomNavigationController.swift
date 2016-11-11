//
//  CustomNavigationController.swift
//  SwiftFramework
//
//  Created by test on 03/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
   
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController);
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * Method to set navigation bar style/Style
     */
    func setNavigationBarBackgndClr(colour:UIBarStyle){
        let navigationBar = self.navigationBar
        navigationBar.barStyle = colour
    }
    
    /*
     * Method to set navigation bar style/Style
     */
    func setNavigationBarTintClr(colour:UIColor){
        
        let navigationBar = self.navigationBar
        navigationBar.tintColor = colour
        
    }
    
    /*
     * Method to set navigation bar back button title with colour
     */
    func setBackBtnTitleWithClr(title:NSString, tintColour:UIColor){
        
        //        let backItem = UIBarButtonItem()
        //        backItem.title = title as String
        //        //        navigationItem.leftBarButtonItem = backItem
        //        navigationItem.backBarButtonItem = backItem
        
        
        let navigationBar = self.navigationBar
        navigationBar.backItem?.title = title as String
        
        
        
        //        //Initialising "back button"
        //        let btnLeftMenu: UIButton = UIButton()
        //        //btnLeftMenu.setImage(UIImage(named: "back_arrow"), forState: UIControlState.Normal)
        //        btnLeftMenu.addTarget(self, action: #selector(self.popToRoot(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        //        btnLeftMenu.frame = CGRectMake(0, 0, 33/2, 27/2)
        //        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        ////        self.navigationItem.leftBarButtonItem = barButton
        //        self.navigationItem.backBarButtonItem = barButton
        
        
        //        let newBackButton = UIBarButtonItem(title: title as String, style: UIBarButtonItemStyle.Bordered, target: self, action: #selector(CustomNavigationController.popToRoot(_:)))
        //        self.navigationItem.leftBarButtonItem = newBackButton;
        
        
    }
    
    func popToRoot(sender:UIBarButtonItem){
        print("Back button clicked")
        //self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    
    func setRightButton(title:NSString){
//        let newBackButton = UIBarButtonItem(title: title as String, style: UIBarButtonItemStyle.Bordered, target: self, action: #selector(self.popToRoot(_:)))
////        let secondBackButton = UIBarButtonItem(title: title as String, style: UIBarButtonItemStyle.Bordered, target: self, action: #selector(self.popToRoot(_:)))
////        let buttonArray :NSArray = [newBackButton, secondBackButton]
//        self.navigationItem.rightBarButtonItem = newBackButton
        
        
         self.navigationItem.title=title as String;
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        backButton.setBackgroundImage(UIImage(named: "backlogo.png"), forState: .normal)
        backButton.addTarget(self, action: #selector(self.popToRoot(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)
       
      
    }
    
    /*
     * Method to set title text with colour
     */
    func setNavigationBarTitleTextWithClr(title:NSString, titleColour:UIColor){
        let navigationBar = self.navigationBar
        
        //Set title of navigation bar
        navigationBar.topItem!.title = title as String
        
        //Change title colour
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:titleColour]
        
        
        
        
        //self.navigationItem.title = title as String
        
        
    }
    
    
    func pushNewViewController(viewController: UIViewController, animated: Bool, backBtnTitle:String) {
    
      
        super.pushViewController(viewController, animated: animated);
    }
    
}
