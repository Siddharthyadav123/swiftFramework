//
//  BaseModel.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class BaseModel : Model, ITaskListener, NSURLConnectionDelegate, NSURLConnectionDataDelegate {
    
    /*********************************** Varaibles Declaration  ***********************************/
    
    /*
     * The HttpHandlerImpl instance to perform server related operation.
     */
    //var httpRequestHandlerImpl : HttpRequestHandlerImpl
    
    /*
     * Request Data to be send with request.
     */
    var requestData : NSData?
    
    /*
     * Maintains the execution thread.
     */
    var executionThread : NSThread?
    
    /*
     * Is thread execution task is finished or not.
     */
    var isTaskFinished : Bool?
    
    /*
     * Respose that comes from server.
     */
    
    var responseData: NSMutableData?
    
    /*
     * The HttpHandlerImpl instance to perform server related operation.
     */
    var httpRequestHandlerImpl:HttpRequestHandlerImpl?
    
    /*
     * sets the error code here.
     */
    var errorCode : NSInteger?
    
    /*
     * Maintains the error message here.
     */
    var errorMessage :NSString?
    
   
    
    
    /*********************************** Method Defination  ***********************************/
    
    
    /**
     * Initializing Model Data
     */
    override func initialize(){
        
        super.initialize()
        responseData = NSMutableData()
        isTaskFinished = false
        httpRequestHandlerImpl = HttpRequestHandlerImpl()
        httpRequestHandlerImpl!.connectionDelegate = self
        
        httpRequestHandlerImpl!.initialize()
        
        //here initializes the thread
        executionThread = NSThread.init(target: self, selector:#selector(run), object: nil)
    }
    
    
    func executeTask(){
        
        //first method is to call onPreExecute.
        onPreTaskExecute()
        //start thread
        executionThread?.start()
    }
    
    
    func run(){
        //here calls the callback method so that the execution of the server communication functionality can be done from thread.
        doInBackGround()
        while(!isTaskFinished!){
            //This line below is the magic!
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate.distantFuture())
            
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        if(response.isEqual(nil)){
            print("In didReceiveResponse REsponse value is nil")
            
        }
        else{
            let httpResponse = response as? NSHTTPURLResponse
            errorCode = httpResponse?.statusCode
            errorMessage = NSHTTPURLResponse.localizedStringForStatusCode(errorCode!)
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        
        let didReceiveData:NSString = NSString.init(data: data, encoding: NSUTF8StringEncoding)!
        print("Response in didReceiveData string %@",didReceiveData);
        
        // Append the new data to receivedData.
        responseData?.appendData(data)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        errorCode = error.code
        print("Did fail with error code %d",errorCode);
        errorMessage = error.localizedDescription
        runOnUIThread(onResponse(responseData!))
        
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        var didReceiveData:NSString = NSString.init(data: responseData!, encoding: NSUTF8StringEncoding)!
        print("Response in string %@",didReceiveData);
        //[self runOnUIThread:(^{[self onResponse:_responseData];})];
        runOnUIThread(onResponse(responseData!))
        isTaskFinished = true
    }
    
    /*
     *Executes the provided block in UI i.e. Main method.
     */
    //    func runOnUIThread:(void(^)(void))block{
    //    dispatch_async(dispatch_get_main_queue(), block);
    //    }
    //
    func runOnUIThread() -> () {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //Your Code here
        })
    }
    
    /**
     * To Destroy Model data.
     */
    override func destory(){
        super.destory()
        
    }
    
    
    /**
     * To Register AbstaractView with model
     */
    override func registerview(view: AbstractViewController) {
        super.registerview(view)
    }
    
    
    /**
     * To UnRegister a AbstractView
     */
    override func unregisterview(view: AbstractViewController) {
        super.unregisterview(view)
    }
    
    func onPreTaskExecute(){
        
    }
    
    
    func doInBackGround(){
        
    }
    
  
    func onResponse(responseData:NSData){
        
    }
    
    
}
