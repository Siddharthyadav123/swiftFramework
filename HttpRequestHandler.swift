//
//  HttpRequestHandler.swift
//  SwiftFramework
//
//  Created by test on 27/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

/************************ Global Constants *******************/

/**
 * Constant for communicating with server with standard HTTP GET Method
 */

let HTTP_GET = "GET"

/**
 * Constant for communicating with server with standard HTTP POST Method
 */
let HTTP_POST = "POST"

/**
 * Constant for communicating with server with standard HTTP DELETE Method
 */


let HTTP_DELETE = "DELETE"

/**
 * Constant for communicating with server with standard HTTP PUT Method
 */


let HTTP_PUT = "PUT"

/**
 * Possible MAX Redirection
 */
let MAX_REDIERCTION = 2

/**
 * Request Count to handle request if any error occur for connection
 */
//protected int requestCount = 0;

/**
 * Max Request Count, If there is an error to communicate with server this
 * class will retry the connection till MAX_REQUEST
 */
let MAX_REQUEST = 5
/**
 * Maximum buffer size for reading data in one chunk
 */
let MAX_BUFFER = 1024 * 16// in KB

// Below added by Gaurav

/**
 * maximum time should be taken to connect to the server
 */
let CONNECTION_TIMEOUT = 40.0 // 10 sec

/**
 * maximum time should be taken to read from server
 */

let READ_TIMEOUT = 20000 // 20 sec



class HttpRequestHandler: NSObject {
    
    
    /**************************** VARIABLES *********************************/
    //var data: NSData? = nil
    /*
     * Variable to hold Method type value
     */
    var theMethodTypes : NSString?
    
    /**
     * Dictionary to set headers parameters in request.
     */
    var theSetHeaders : NSMutableDictionary?
    /**
     * Dictionary to add headers parameters in request
     */
    var addHeaders : NSMutableDictionary?
    
    /**
     * Cancel Request Variable to handle connection cancellation
     */
    var cancelRequests : Bool = false
    
    /*
     * Request body to be provided for requesting server.
     */
    var request: NSMutableURLRequest?
    
    
    /**
     * The URL to connect to the server
     */
    var theServiceURLs: NSString?
    
    /*
     * Connection Delegete to receive server response.
     */
    var connectionDelegate:AnyObject?
    
    
    /**
     * Request Count to handle request if any error occur for connection
     */
    var requestCount:NSInteger?
    
    //    /**
    //     * Cancel Request Variable to handle connection cancellation
    //     */
    //    var cancelRequest:Bool
    
    /*
     * HTTPURL Response comes from the server.
     */
    var httpUrlResponse:NSHTTPURLResponse?
    /*
     * Error if any comes from server side.
     */
    var serverError:NSError?
    /*
     * Response data comes from server.
     *
     */
    var result:NSData?
    
    
    /**************************** Setter-Getter of VARIABLES *********************************/
    
    //    override init() {
    //
    //    }
    
    
    //    / *************** DUMMY SETTER GETTER *************/
    //    // this stores the actual data, do not access it directly, consider it private
    //    var theFileName: String = ""
    //
    //    // this is the real interface
    //    var fileName: String {
    //        get {
    //            return self.theFileName
    //        }
    //        set(name) {
    //            self.theFileName = name + ".fileType"
    //        }
    //    }
    
    
    /*
     * Setter getter of "methodTypes"
     */
    var methodType: NSString {
        get {
            if !((theMethodTypes?.isEqual(""))!) {
                return self.theMethodTypes!
            }
            return ""
        }
        set(setMethodType) {
            self.theMethodTypes = setMethodType
        }
    }
    
    /**
     * To set headers parameter before creating connection
     *
     * @param key
     *            To set key for header
     * @param value
     *            To set value for given key in header
     */
    
    func setHeader(key : NSString ,value : NSString ) {
        if(theSetHeaders != nil){
            self.theSetHeaders!.setValue(value, forKey:key as String);
        }
    }
    
    
    /**
     * To set headers parameter before creating connection
     *
     * @param key
     *            To set key for header
     * @param value
     *            To set value for given key in header
     */
    
    func addHeader(key : NSString ,value : NSString ) {
        if(addHeaders != nil){
            self.addHeaders!.setValue(value, forKey:key as String);
        }
    }
    
    
    func getHeaders() -> NSMutableDictionary{
        if(theSetHeaders != nil){
            return self.theSetHeaders!
        }
        return theSetHeaders!
    }
    
    /**
     * Cancel Server Communication Request
     */
    func cancelRequest() {
        self.cancelRequests = false
        closeConnection()
    }
    
    /**
     * Server url to request
     *
     * @param url
     */
    var setServiceURL: NSString {
        get {
            if !((theServiceURLs?.isEqual(""))!) {
                return self.theServiceURLs!
            }
            return ""
        }
        set(url) {
            self.theServiceURLs = url
        }
    }
    
    
    /**
     * Initializing necessary data
     */
    func initialize(){
        
        theSetHeaders = NSMutableDictionary()
        addHeaders = NSMutableDictionary()
        
    }
    
    /**
     * Execute the request with data body and returns the response.
     */
    func execute(requestData:NSData?){
        request = openConnection()
        
        if (request != nil) {
            if (requestData != nil) {
                request!.HTTPBody = requestData;
                request!.addValue(String(format:"%d",requestData!.length), forHTTPHeaderField:"Content-Length")
                var connection: NSURLConnection = NSURLConnection(request: request!, delegate: connectionDelegate, startImmediately: true)!
                
            }
            
        }
        
        
    }
    
    /**
     * Execute the request without data body and returns the response.
     */
    func execute(){
        request = openConnection()
        if (request != nil) {
            var connection: NSURLConnection = NSURLConnection(request: request!, delegate: connectionDelegate, startImmediately: true)!
        }
    }
    
    /**
     * To Destroy Other data.
     */
    func destroy(){
        if (theSetHeaders != nil) {
            theSetHeaders?.removeAllObjects()
            theSetHeaders = nil
        }
        if (addHeaders != nil) {
            addHeaders?.removeAllObjects()
            addHeaders = nil
        }
        
        theServiceURLs = nil;
        requestCount = nil;
        httpUrlResponse = nil;
        serverError = nil;
        result = nil;
        
    }
    
    
    /**
     * To Open Connection and create the request by setting the url and headers.
     */
    func openConnection() -> NSMutableURLRequest{
        var request : NSMutableURLRequest!
        
        if !((theServiceURLs?.isEqual(""))!) {
            let url = NSURL(string: theServiceURLs as! String)
             request = NSMutableURLRequest(URL: url!)
            if !((request.isEqual(nil))) {
                request.HTTPMethod = methodType as String
            }
            //sets the headers here.
            setHeadersTorequest(request)
            request.timeoutInterval = CONNECTION_TIMEOUT;
            return request;
        }
        
        return request
        
    }
    
    
    /*
     * Here, sets & adds the headers tot the request if any.
     */
    func setHeadersTorequest(request:NSMutableURLRequest){
        //first check for setting set headers.
        if(theSetHeaders != nil){
            var headesrsKeys:NSArray?
            headesrsKeys = theSetHeaders?.allKeys
            if(headesrsKeys != nil){
                //var key : NSString?
                for key in headesrsKeys!{
                    request.setValue(theSetHeaders?.objectForKey(key) as? String, forHTTPHeaderField: key as! String)
                    request.setValue("abc", forHTTPHeaderField:key as! String)
                    
                    //            NSLog(@"From Headers: %@",[request ])
                }
            }
        }
        
        //then if any headers those need to be added to the request,
        if(addHeaders != nil){
            var headesrsKeys:NSArray?
            headesrsKeys = addHeaders?.allKeys
            if(headesrsKeys != nil){
                //var key : NSString?
                for key in headesrsKeys!{
                    request.addValue((addHeaders?.objectForKey(key) as? String)!, forHTTPHeaderField:  key as! String)
                    
                    //            NSLog(@"From Headers: %@",[request ])
                }
            }
        }
        
    }
    
    
    /**
     * To Close Connection
     */
    func closeConnection() {
        
    }
}
