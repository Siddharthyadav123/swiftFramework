//
//  INetworkHandler.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

protocol INetworkHandler {
    /**
     * Initializing necessary data
     */
  func initialize()
    
    /**
     * To Destroy Other data.
     */
   func  destroy()
    
    ///**
    // * To Open Connection
    // */
    //public HttpURLConnection openConnection() throws Exception;
    
    /**
     * To Close Connection
     */
    func closeConnection()
    

}