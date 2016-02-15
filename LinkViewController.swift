//
//  LinkViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/14/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class LinkViewController: UIViewController {

    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func doneButtonDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didPressCopyButton(sender: AnyObject) {
        userDefaults.setBool(true, forKey: "task3_completed")
        userDefaults.synchronize()
        
        let AlertController = UIAlertController(title: "Link copied", message: nil, preferredStyle: .Alert)
        
        self.presentViewController(AlertController, animated: true) {
            AlertController.dismissViewControllerAnimated(true, completion: { () -> Void in
            })
        }

        
    }
}
