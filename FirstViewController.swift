//
//  FirstViewController.swift
//  SwiftFramework
//
//  Created by test on 03/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {
    
    
    override func viewWillAppear(animated: Bool) {
        
//        myNavig?.setNavigationBarBackgndClr(UIBarStyle.BlackTranslucent)
//        myNavig?.setNavigationBarTintClr(UIColor.redColor())
//        myNavig?.setBackBtnTitleWithClr("Pop Me...", tintColour: UIColor.redColor())
//        myNavig?.setNavigationBarTitleTextWithClr("First ViewController", titleColour: UIColor.whiteColor())
    
     
     
//        print(">>here")
//        myNavig!.setBackBtnTitleWithClr("Pop Me...", tintColour: UIColor.redColor())
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonClicked(sender: AnyObject) {
        let secondViewController : SecondViewController = SecondViewController()
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    func addTapped(){
        
    }
}
