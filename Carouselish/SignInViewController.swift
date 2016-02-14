//
//  SignInViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/6/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
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
        fieldOffset = -90
        
        buttonInitialY = buttonParentView.frame.origin.y
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func keyboardWillShow(notification: NSNotification!) {
        
        buttonOffset = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size.height
        
        fieldParentView.frame.origin.y = fieldInitialY + fieldOffset
        
        buttonParentView.frame.origin.y = buttonInitialY - buttonOffset
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = fieldInitialY
        
        buttonParentView.frame.origin.y = buttonInitialY
        
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    @IBAction func didPressSignIn(sender: AnyObject) {
        
        let emailAlertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
        let alertController = UIAlertController(title: "Email or Password is incorrect", message: "Please check your email and password", preferredStyle: .Alert)
        let signInAlertController = UIAlertController(title: "Signing In", message: nil, preferredStyle: .Alert)
        
            if emailField.text == "m@lyft.com" && passwordField.text == "123" {
               presentViewController(signInAlertController, animated: true) {
               signInAlertController.dismissViewControllerAnimated(true, completion: { () -> Void in
                   self.performSegueWithIdentifier("signInSegue", sender: nil)
               })
           }

        } else if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            emailAlertController.addAction(cancelAction)
            presentViewController(emailAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        } else {
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }

        }
    
    }

    
}
