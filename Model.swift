//
//  Model.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class Model: NSObject,IModel {
    let abstractView: NSMutableArray = NSMutableArray()
    
    
    func initialize()
    {
        
    }
    
    func destory()
    {
        
        
    }
    
    func registerview(view:AbstractViewController)    {
        
       // abstractView.addObject(view)
        

    }
    
    
    func unregisterview(view:AbstractViewController)
    {
        if (abstractView.count > 0) {
          //  abstractView.removeObject(view)
        }
        
    }
    
    
    func informView()
    {
        //  update each AbstractView register to this model
        for (var i = 0; i < abstractView.count; ++i) {
            
            abstractView.objectAtIndex(i).update()
            
        }
        
    }
    
    
}
