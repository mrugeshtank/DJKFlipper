//
//  ViewController.swift
//  DJKFlipperExample
//
//  Created by Koza, Daniel on 7/17/15.
//  Copyright (c) 2015 Koza, Daniel. All rights reserved.
//

import UIKit
import DJKFlipper

class ViewController: UIViewController, DJKFlipperDataSource {
    
    fileprivate var flipView: DJKFlipperView!
    
    var flipperViewArray: [UIViewController] = []
    var imageViewArray: [UIImageView] = []
    {
        didSet
        {
            flipView.reload()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flipView = DJKFlipperView()
        flipView.frame = view.frame
        flipView.backgroundColor = .green
        view.addSubview(flipView)
        
        let page1 = UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 500))
        page1.image = UIImage(named: "page1")
        imageViewArray.append(page1)
        
        let page2 = UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 500))
        page2.image = UIImage(named: "page2")
        imageViewArray.append(page2)
        
        let page3 = UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 500))
        page3.image = UIImage(named: "page3")
        page3.layoutSubviews()
        imageViewArray.append(page3)
        
//        let page1 = PageTestViewController()
//        page1.view.frame = self.view.bounds
//        page1.backgroundImage.image = UIImage(named: "page1")
//        page1.view.layoutSubviews()
//
//        let page2 = PageTestViewController()
//        page2.view.frame = self.view.bounds
//        page2.backgroundImage.image = UIImage(named: "page2")
//        page2.view.layoutSubviews()
//
//        let page3 = PageTestViewController()
//        page3.view.frame = self.view.bounds
//        page3.backgroundImage.image = UIImage(named: "page3")
//        page3.view.layoutSubviews()
//
//        let page4 = PageTestViewController()
//        page4.view.frame = self.view.bounds
//        page4.backgroundImage.image = UIImage(named: "page4")
//        page4.view.layoutSubviews()
//
//        let page5 = PageTestViewController()
//        page5.view.frame = self.view.bounds
//        page5.backgroundImage.image = UIImage(named: "page5")
//        page5.view.layoutSubviews()
//
//        let page6 = PageTestViewController()
//        page6.view.frame = self.view.bounds
//        page6.backgroundImage.image = UIImage(named: "page6")
//        page6.view.layoutSubviews()
//
////        add the view controllers to the flipperViewArray
//        flipperViewArray += [page1,page2,page3,page4,page5,page6]
        
                flipView.dataSource = self
        flipView.reload()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - FlipperDataSource Methods
    
    func numberOfPages(_ flipper: DJKFlipperView) -> NSInteger {
        return imageViewArray.count
    }
    
    func viewForPage(_ page: NSInteger, flipper: DJKFlipperView) -> UIView {
        return imageViewArray[page]
    }
}

