//
//  IModel.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
protocol IModel:NSObjectProtocol {

    /**
     * Initializing Model Data
     */
    
    func initialize()
    
    /**
     * To Destroy Model data.
     */
    func destory()

    
    /**
     * To Register AbstaractView with model
     */
    func registerview(view:AbstractViewController)
    
    /**
     * To UnRegister a AbstractView
     */
    func unregisterview(view:AbstractViewController)
    
    
    /**
     * To Inform AbtractViews about any update in model
     */
  func informView()
    


}