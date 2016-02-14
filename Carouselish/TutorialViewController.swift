//
//  TutorialViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/13/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var spinButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        pageControl.numberOfPages = 4
        
        let pageWidth = scrollView.bounds.width
        let pageHeight = scrollView.bounds.height
        
        scrollView.contentSize = CGSizeMake(4*pageWidth, pageHeight)
        scrollView.pagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        spinButton.alpha = 0
        
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
    
    @IBAction func pageControlDidPage(sender: AnyObject) {
        let xOffset = scrollView.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPointMake(xOffset,0) , animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        if pageControl.currentPage == 3 {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.spinButton.alpha = 1
                self.pageControl.hidden = true
            })
        } else {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.spinButton.alpha = 0
                self.pageControl.hidden = false
            })
        }
    }

}
