//
//  ModelFacde.swift
//  SwiftFramework
//
//  Created by test on 02/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ModelFacde: NSObject,IModel {
    
    var remoteModel : RemoteModel
    var localModel : LocalModel
    
    override init() {
        remoteModel = RemoteModel()
        localModel = LocalModel()
    }
    
    
    func getLocalModel() -> LocalModel {
        return  localModel
    }
    
    
    func getRemoteModel() -> RemoteModel {
        return  remoteModel
    }
    
    
    func initialize()
    {
        localModel.initialize()
        remoteModel.initialize()
        
    }
    
    /*
     * Destroy instance of all models
     */
    
    func destory(){
        localModel.destory()
        remoteModel.destory()
    }
    
    
    func informView()
    {
        
    }
    
    func registerview(view: AbstractViewController)
    {
        // TODO Auto-generated method stub
    }
    
    func unregisterview(view: AbstractViewController)
        
    {
        // TODO Auto-generated method stub
    }
    
    
}
