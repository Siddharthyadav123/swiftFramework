//
//  CustomPopUpProtocol.swift
//  SwiftFramework
//
//  Created by test on 10/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

// @objc : Need to make optional method. optional will only work for @objc


@objc protocol CustomPopUpProtocol {
    
    /*
     * Setter of TransitionStyle (i.e animation type to launch a popup )
     * @ transitionStyle : hold value of Style
     */
  optional func setDialogTransitionStyle(transitionStyle: Int)
    
    /*
     * Setter of DialogAlignment (i.e position of a popup )
     * @ alignment : hold value of alignment position
     */
  optional  func setDialogAlignment(alignment: Int)
    
    /*
     * Setter to set background view alpha value
     */
   optional func setBackgroundAlpha(alpha: CGFloat)
    
    /*
     * Setter to set dialogTransition Direction of dialog
     */
   optional func setTransitionDirection(direction: Int)
}