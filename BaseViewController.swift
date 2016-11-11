//
//  BaseViewController.swift
//  SwiftFramework
//
//  Created by test on 04/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var myNavig:CustomNavigationController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Create Instance of Custom Navigation Controller
       myNavig = self.navigationController as? CustomNavigationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
