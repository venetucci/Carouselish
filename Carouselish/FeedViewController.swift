//
//  FeedViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/13/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, UIScrollViewDelegate {

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var scrubberScrollView: UIScrollView!
    @IBOutlet weak var scrubberImageView: UIImageView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var window = UIApplication.sharedApplication().keyWindow
    var isPresenting: Bool = true


    override func viewDidLoad() {
        super.viewDidLoad()

        feedScrollView.contentSize = feedImageView.image!.size
        
        scrubberScrollView.delegate = self
        scrubberScrollView.contentSize = scrubberImageView.image!.size


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let onboardingCompleted = userDefaults.boolForKey("task1_completed") && userDefaults.boolForKey("task2_completed") && userDefaults.boolForKey("task3_completed")
        
        if onboardingCompleted == true {
            UIView.animateWithDuration(0.2) { () -> Void in
               self.bannerView.alpha = 0
            }
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
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        let containerView = transitionContext.containerView()!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let destinationViewController = segue.destinationViewController as! ImageDetailViewController
            destinationViewController.image = self.detailImageView.image
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
        }
    }

    @IBAction func imageDidTap(sender: AnyObject) {
        print("testing_this")
        self.performSegueWithIdentifier("detailSegue", sender: nil)
    }
    @IBAction func bannerDismissDidTap(sender: AnyObject) {
        bannerView.hidden = true
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
         userDefaults.setBool(true, forKey: "task2_completed")
         userDefaults.synchronize()
        print("scrubber")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrubberWidth = scrubberScrollView.contentSize.width - CGRectGetWidth(scrubberScrollView.bounds)
        let percentageScroll = scrubberScrollView.contentOffset.x / scrubberWidth
        let feedViewHeight = feedScrollView.contentSize.height - CGRectGetHeight(feedScrollView.bounds)
        feedScrollView.contentOffset = CGPoint(x: 0, y: feedViewHeight * percentageScroll)
    }
    
    
}
