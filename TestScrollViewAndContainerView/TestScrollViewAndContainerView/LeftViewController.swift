//
//  LeftViewController.swift
//  TestScrollViewAndContainerView
//
//  Created by Clint on 2018. 7. 26..
//  Copyright © 2018년 clint. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    
    // willMove -> It appears on the parent screen.
    override func willMove(toParentViewController parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)   // TestScrollViewAndContainerView.ViewController
        }
    }
    
    // It appears on the parent screen. -> didMove
    override func didMove(toParentViewController parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
}
