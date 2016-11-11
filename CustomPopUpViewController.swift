//
//  CustomPopUpViewController.swift
//  SwiftFramework
//
//  Created by test on 10/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

/****************** CONSTANT OF DIALOG TransitionStyle   ************************/
/**
 *  When the view controller is presented, its view slide in the parent view controller and slide out on dismiss
 */
let TransitionStyleSlide = 0
/**
 *  When the view controller is presented, its view fade in and fade out on dismiss. Transition direction is ignored for this kind of transition.
 */
let TransitionStyleCrossDissolve = 1
/**
 *  When the view controller is presented, its view fade in with a zoom out effect and fade out with a zoom in effect on dismiss. Transition direction is ignored for this kind of transition.
 */
let TransitionStyleZoom = 2
/**
 *  When the view controller is presented, its view slide in with a bounce effect and slide out on dismiss.
 */
let TransitionStyleSpringySlide = 3
/**
 *  When the view controller is presented, its view zoom and fade in with a bounce effect. Transition direction is ignored for this kind of transition.
 */
let TransitionStyleSpringyZoom = 4
/**
 *  When the view controller is presented, its view has a undefined behavior.
 */
//UIDynamics transition styles
let TransitionStyleSnap = 5
/**
 *  When the view controller is presented, its view has a custom animation.
 */
let TransitionStyleCustom = 6


/****************** CONSTANT OF DIALOG Alignment   ************************/

/**
 *  Popin will be centered in container
 */
let AlignementOptionCentered = 0
/**
 *  Popin will be stuck to top in container
 */
let AlignementOptionUp = 1
/**
 *  Popin will be left-aligned in container
 */
let AlignementOptionLeft  = 2
/**
 *  Default will be stuck to bottom in container
 */
let AlignementOptionDown  = 3
/**
 *  Popin will be right-aligned in container
 */
let AlignementOptionRight = 4


/****************** CONSTANT OF DIALOG Alignment   ************************/

/**
 *  Presentation transition will start from the bottom of the parent view. Respectively, dismiss transition will end to the bottom of the parent view.
 */
let TransitionDirectionBottom = 0
/**
 *  Presentation transition will start from the top of the parent view. Respectively, dismiss transition will end to the top of the parent view.
 */
let TransitionDirectionTop = 1
/**
 *  Presentation transition will start from the left of the parent view. Respectively, dismiss transition will end to the left of the parent view.
 */
let TransitionDirectionLeft = 2
/**
 *  Presentation transition will start from the right of the parent view. Respectively, dismiss transition will end to the right of the parent view.
 */
let TransitionDirectionRight = 3



class CustomPopUpViewController: UIViewController,CustomPopUpProtocol {
    
    /****************** VARIABLES  ************************/
    
    var dialogTransitionStyle: BKTPopinTransitionStyle!
    var dialogAlignement : BKTPopinAlignementOption!
    var dialogTransitionDirection : BKTPopinTransitionDirection!
    var alpha : CGFloat!
    var dismissable:Bool = true
    
    
    /****************** METHODS  ************************/
    
    override func viewWillAppear(animated: Bool) {
        
        showCustomDialog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showCustomDialog() {
        
        //Set TransitionStyle of popup dialog
        self.setPopinTransitionStyle(getDialogTransitionStyle())
        
        //Dismiss popup dialog
        self.dismissDialog()
        
        //Set popin alignement according to value in segmented control
        self.setPopinAlignment(getDialogAlignment())
        
        //Create a blur parameters object to configure background blur
        self.setBackGrndBlurParameter()
        
        //Set content size of Dialog
        self.setDialogContentSize()
        
        //Set popin transition direction
        self.setPopinTransitionDirection(getTransitionDirection())
        
    }
    
    
    /*
     * Create a blur parameters object to configure background blur
     */
    func setBackGrndBlurParameter() {
        var blurParameters:BKTBlurParameters = BKTBlurParameters()
        blurParameters.alpha = getBackgroundAlpha()
        blurParameters.radius = 8.0
        blurParameters.saturationDeltaFactor = 1.0
        //        blurParameters.tintColor = UIColor.init(colorLiteralRed: 0.966, green: 0.851, blue: 0.038, alpha: 0.1)
        
        self.setBlurParameters(blurParameters)
        
        //Add option for a blurry background
        self.setPopinOptions(BKTPopinOption.BlurryDimmingView)
    }
    
    
    /*
     * Method to dismiss dialog
     */
    func dismissDialog()  {
        if (dismissable) {
            
            self.setPopinOptions(BKTPopinOption.Default)
            
        } else {
            
            self.setPopinOptions(BKTPopinOption.DisableAutoDismiss)
            
        }
    }
    
    /*
     * Method to Set content size of Dialog (Frame of dialog)
     */
    func setDialogContentSize()  {
        //  self.setPreferedPopinContentSize:CGSizeMake(280.0, 240.0)
        
        var screenRect:CGRect = UIScreen.mainScreen().bounds
        
        //Set dialog in centre of screen
        self.setPreferedPopinContentSize(CGSizeMake(screenRect.size.width/0.5, screenRect.size.height/2))
    }
    
    
    /*
     * Setter of TransitionStyle (i.e animation type to launch a popup )
     * @ transitionStyle : hold value of Style
     */
     func setDialogTransitionStyle(transitionStyle: Int) {
        self.dialogTransitionStyle = BKTPopinTransitionStyle.init(rawValue: transitionStyle)
        
        //Define a custom transition style.
        //If TransitionStyle is custom, don't present it in simple way. Just applied a small - funcky animation
        if ( self.dialogTransitionStyle == BKTPopinTransitionStyle.Custom)
        {
            self.setPopinCustomInAnimation({ (popinController, initialFrame, finalFrame) in
                popinController.view.frame = finalFrame;
                popinController.view.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4)/4)
            })
            
        }
    }
    
    /*
     * Getter of TransitionStyle
     */
    func getDialogTransitionStyle() -> BKTPopinTransitionStyle {
        if(self.dialogTransitionStyle == nil){
            self.dialogTransitionStyle = BKTPopinTransitionStyle.SpringyZoom
        }
        return self.dialogTransitionStyle
    }
    
    
    /*
     * Setter of DialogAlignment (i.e position of a popup )
     * @ alignment : hold value of alignment position
     */
     func setDialogAlignment(alignment: Int) {
        
        self.dialogAlignement = BKTPopinAlignementOption.init(rawValue: alignment)
    }
    
    
    /*
     * Getter of DialogAlignment
     */
    func getDialogAlignment() -> BKTPopinAlignementOption {
        
        if(self.dialogAlignement==nil){
            self.dialogAlignement = BKTPopinAlignementOption.Centered
        }
        return self.dialogAlignement
    }
    
    
    
    /*
     * Setter to set background view alpha value
     */
      func setBackgroundAlpha(alpha: CGFloat) {
        
        self.alpha = alpha
    }
    
    
    /*
     * Getter of background view alpha value
     */
    func getBackgroundAlpha() -> CGFloat {
        
        if(self.alpha==nil){
            self.alpha = 0.5
        }
        return self.alpha
    }
    
    
    /*
     * Setter to set dialogTransition Direction of dialog
     */
      func setTransitionDirection(direction: Int) {
        self.dialogTransitionDirection = BKTPopinTransitionDirection.init(rawValue: direction)
        
    }
    
    
    /*
     * Getter dialogTransition Direction of dialog
     */
    func getTransitionDirection() -> BKTPopinTransitionDirection {
        
        if(self.dialogTransitionDirection==nil){
            self.dialogTransitionDirection = BKTPopinTransitionDirection.Top
        }
        return self.dialogTransitionDirection
    }
    
    
    
}
