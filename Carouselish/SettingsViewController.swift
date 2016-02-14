//
//  SettingsViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/13/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = settingsImageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissButtonDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func signOutDidTap(sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("signOutSegue", sender: self)
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
 
        presentViewController(alertController, animated: true) {
        }

    }
}
