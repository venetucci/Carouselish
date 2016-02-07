//
//  IntroViewController.swift
//  Carouselish
//
//  Created by Michelle Harvey on 2/6/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introTile1: UIImageView!
    @IBOutlet weak var introTile2: UIImageView!
    @IBOutlet weak var introTile3: UIImageView!
    @IBOutlet weak var introTile4: UIImageView!
    @IBOutlet weak var introTile5: UIImageView!
    @IBOutlet weak var introTile6: UIImageView!
    
    var imageViews : [UIView]?
    var yOffsets : [CGFloat] = [-285, -156, -248, -248, -305, -297]
    var xOffsets : [CGFloat] = [-62, 19, 6, 57, -65, -58]
    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1136)

        imageViews = [introTile1, introTile2, introTile3, introTile4, introTile5, introTile6]

        scrollView.delegate = self
        
        
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
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        for (index, imageView) in imageViews!.enumerate() {
            let xoffset = xOffsets[index]
            let yoffset = yOffsets[index]
            let scale = scales[index]
            let rotation = rotations[index]
            
            let offset = CGFloat(scrollView.contentOffset.y)
            let r = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotation, r2Max: 0)
            let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xoffset, r2Max: 0)
            let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yoffset, r2Max: 0)
            let sx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scale, r2Max: 1)
            let rotateTransform = CGAffineTransformMakeDegreeRotation(r)
            let translateTransform = CGAffineTransformMakeTranslation(tx,ty)
            let scaleTransform = CGAffineTransformMakeScale(sx, sx)
            
            imageView.transform = CGAffineTransformConcat(rotateTransform, translateTransform)
            imageView.transform = CGAffineTransformConcat(imageView.transform, scaleTransform)
        }
    }

}
