//
//  ITaskListener.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

protocol ITaskListener {
    /*
     * Method gets call just before the thread starts to communicate with server.
     * Some intialization process can be done, such as setting Url,headers.
     */
    func onPreTaskExecute()
    
    /*
     * This method will be called from the separate thread, so do here the require functionality.
     Such as requesting the server.
     */
    func doInBackGround()
    
    /*
     * The method gets call when thread completes its execution.
     */
   // func onTaskStopExecution()
    
    /*
     * This methods gets call on responce came from server.
     */
    func onResponse(responseData:NSData)
}