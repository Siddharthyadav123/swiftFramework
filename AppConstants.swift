//
//  AppConstants.swift
//  SwiftFramework
//
//  Created by test on 02/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class AppConstants: NSObject {
    
    enum ViewFactoryScreen {
        case VF_ROOT_VIEW_SCREEN
        case VF_SPLASH_SCREEN
    }
    
    enum Events {
        case EVENT_ID_FINISH_SCREEN
        case EVENT_ID_SPLASH_SCREEN
        case EVENT_ID_ON_SCREEN_FINISH
    }
    
    enum ViewControllerType {
        case VCT_VIEW_CONTROLLER
        case VCT_ROOT_NAVIGATION_CONTROLLER
        case VCT_CHILD_NAVIGATION_CONTROLLER
        case VCT_ROOT_CUSTOM_NAVIGATION_CONTROLLER
        case VCT_CHILD_CUSTOM_NAVIGATION_CONTROLLER
    }
}
