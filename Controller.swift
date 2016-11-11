//
//  Controller.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

//IController: Protocol

class Controller: NSObject, IController {
    
    /**
     * Handle Event Based on Event ID
     *
     * @param eventId
     *            Event raised by View
     */
    func handleEvent(eventid:Int){
        
    }
    
    /**
     * Handle Event Based on Event ID and Object
     *
     * @param eventId
     *            Event Id based on user actions
     * @param eventObjects
     *            It stores the data for the given Event. so it can forward to
     *            other events
     */
    func handleEvents(eventid:Int, eventObject:NSObject){
        
    }
    
    /**
     * To initialize the Views or Screens, Models
     *
     */
    func initialize(){
        
    }
    
    
    /**
     * Destroy View and Model Data for the given Screen.
     *
     */
    func  destory(){
        
    }
    
    /**
     * This function get called whenever AbstractView redisplay on device screen
     *
     */
    
    func enable(){
        
    }
    
    
    /**
     * This function get called whenever AbstractView overlapped by another
     * AbstractView
     */
    
    func disbale(){
        
    }
    
    
    /**
     * To notify the AbstarctView, that there is an interruption. So
     * AbstractView can handle all the required condition before going
     * application in background.
     *
     */
    
    func showNotify(){
        
    }
    
    /**
     * To notify the AbstractView that application will be visible on the screen
     * after calling this method.
     */
    
    func hideNotify(){
        
    }
}
