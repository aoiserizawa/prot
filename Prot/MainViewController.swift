//
//  ViewController.swift
//  Prot
//
//  Created by Luisito Yumang on 3/15/16.
//  Copyright © 2016 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import Material

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var navigationBarView: NavigationBarView!
    
    @IBOutlet weak var navigationBarViewHeightConstraint: NSLayoutConstraint!
    
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        // If landscape.
        if UIInterfaceOrientationIsLandscape(toInterfaceOrientation) {
            /**
            The height of the NavigationBarView is dependant on the device being used.
            If the device is an iPad, the height should stay the same as in Portrait
            view, otherwise it should strink to the Landscape height for iPhone.
            */
            navigationBarViewHeightConstraint?.constant = .iPad == MaterialDevice.type ? navigationBarView!.heightForPortraitOrientation :  navigationBarView!.heightForLandscapeOrientation
        } else {
            navigationBarViewHeightConstraint?.constant = navigationBarView!.heightForPortraitOrientation
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        prepareView()
        prepareNavigationBarView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// General preparation statements.
    private func prepareView() {
        view.backgroundColor = MaterialColor.white
    }
    
    func handleMenuButton() {
        print("menu is clicked")
        sideNavigationViewController?.toggleLeftView()
    }
    
    /// Prepare the navigationBarView.
    func prepareNavigationBarView() {
        // Stylize.
        navigationBarView.backgroundColor = MaterialColor.indigo.darken1
        
        // To lighten the status bar add the "View controller-based status bar appearance = NO"
        // to your info.plist file and set the following property.
        navigationBarView.statusBarStyle = .LightContent
        
        // Menu button.
        let img1: UIImage? = UIImage(named: "ic_menu_white")
        let btn1: FlatButton = FlatButton()
        btn1.pulseScale = false
        btn1.setImage(img1, forState: .Normal)
        btn1.setImage(img1, forState: .Highlighted)
        btn1.addTarget(self, action: "handleMenuButton", forControlEvents: .TouchUpInside)
        
        
        // Add buttons to left side.
        navigationBarView.leftControls = [btn1]
        
    }



}

