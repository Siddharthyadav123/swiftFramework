//
//  AbstractViewController.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

protocol AbstractViewController{
    
    /*
     * Variable to hold type of view controller's.
     */
    var viewControllerType: Int { get set }
    
    /**
     * Destroy View and Model Data for the given Screen.
     *
     */
    func destroy()
    
    /**
     * To update a view
     */
    
    func update()
    
    /**
     * method calls when screen poped up from stack and dismissed from UI.
     */
    
    func onScreenPopedUp()
    
    /*
     * Method calls when go back to previous screen due to top screen is finished
     */
    func onTopScreenFinished()
    
    /*
     * Method calls when response from server comes. It override update method.
     */
    func update(identifier:Int)
    
    
    
}