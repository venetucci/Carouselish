//
//  CreateViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/14/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var fieldInitialY: CGFloat!
    var fieldOffset: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        fieldInitialY = fieldParentView.frame.origin.y
        fieldOffset = -70

        buttonInitialY = buttonParentView.frame.origin.y
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func keyboardWillShow(notification: NSNotification!) {
        
        buttonOffset = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size.height
        
        fieldParentView.frame.origin.y = fieldInitialY + fieldOffset
        
        buttonParentView.frame.origin.y = buttonInitialY - buttonOffset
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = fieldInitialY
        
        buttonParentView.frame.origin.y = buttonInitialY
        
    }
    
    @IBAction func createButtonDidPress(sender: AnyObject) {
        performSegueWithIdentifier("createAccountSegue", sender: self)

    }
    
    @IBAction func didPressCheckBox(sender: AnyObject) {
        checkBoxButton.selected = !checkBoxButton.selected
    }

}
