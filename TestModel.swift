//
//  TestModel.swift
//  SwiftFramework
//
//  Created by test on 02/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class TestModel: BaseModel {
    
    override func initialize (){
        print("In initialize of TestModel")
        super.initialize()
        executeTask()
        
    }
    
    override func onPreTaskExecute(){
        print("On Pre Execute Task of TestModel")
        httpRequestHandlerImpl?.setServiceURL = "http://staging.vyako.com/shopvilla/addresses/getAddressList/3.json"
        httpRequestHandlerImpl?.methodType  = HTTP_GET
        
    }
    
    override func doInBackGround(){
        print("Do in background of TestModel")
        request()
    }
    
    func onTaskStopExecution(){
        print("On Task Stop of TestModel")
    }
    
    
    override func onResponse(responseData: NSData) {
        if(responseData.isEqual(nil)){
            print("On Nil Response of TestModel");
            
        }
        else{
            print("On Response of TestModel: %@",responseData);
        }
        //[self informView];
    }
    
    
    
    /*
     * Method to post data in server
     */
    func request(){
        
        httpRequestHandlerImpl?.execute()
        
    }
    
}
