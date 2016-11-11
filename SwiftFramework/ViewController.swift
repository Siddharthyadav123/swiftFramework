//
//  ViewController.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CustomPopUpProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        var testModel : TestModel = TestModel()
        //        testModel.initialize();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    @IBAction func showPopUpButtonClicked(sender: AnyObject) {
        
        var customPopUpViewController : CustomPopUpViewController = CustomPopUpViewController()
        customPopUpViewController.setDialogAlignment(AlignementOptionCentered)
        
        self.presentPopinController(customPopUpViewController, animated: true, completion: {
            print("Popin presented !")
        })

    }
    

}

