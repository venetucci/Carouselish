//
//  GetStartedViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/14/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var task1: UIButton!
    @IBOutlet weak var task2: UIButton!
    @IBOutlet weak var task3: UIButton!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let task1Completed = userDefaults.boolForKey("task1_completed")
        let task2Completed = userDefaults.boolForKey("task2_completed")
        let task3Completed = userDefaults.boolForKey("task3_completed")
        
        task1.selected = task1Completed
        task2.selected = task2Completed
        task3.selected = task3Completed
        
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
}
