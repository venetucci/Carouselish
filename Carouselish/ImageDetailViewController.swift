//
//  ImageDetailViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/14/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shareSheetView: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    var image: UIImage!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userDefaults.setBool(true, forKey: "task1_completed")
        
        userDefaults.synchronize()
        
        imageView.image = image
        
        initialY = shareSheetView.frame.origin.y
        offset = -351
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doneButtonDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func linkButtonDidTap(sender: AnyObject) {
        performSegueWithIdentifier("linkSegue", sender: nil)
        self.shareSheetView.frame.origin.y = self.initialY 
    }
    
    @IBAction func shareButtonDidTap(sender: AnyObject) {
       
        UIView.animateWithDuration(0.2) { () -> Void in
            self.shareSheetView.frame.origin.y = self.initialY + self.offset
        }
    }
}
