//
//  ViewController.swift
//  TestScrollViewAndContainerView
//
//  Created by Clint on 2018. 7. 26..
//  Copyright © 2018년 clint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollViewContainerViewWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the ContainerView's width size for the ScrollView
        scrollViewContainerViewWidth.constant = UIScreen.main.bounds.size.width * 2
    }
    
    // addChildController
    @IBAction func onAddChildController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Other", bundle: nil)
        let addViewController = storyboard.instantiateViewController(withIdentifier: "AddViewController")
        // if Constraints
//        addViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(addViewController)
        self.view.addSubview(addViewController.view)
        
        // if Constraints
//        self.view.addConstraints(addViewController.view.constraints)
        
        addViewController.didMove(toParent: self)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Current X,Y are X:\(scrollView.contentOffset.x), Y: \(scrollView.contentOffset.y)")
        let currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        print("current page : \(currentPage)")
    }
}
