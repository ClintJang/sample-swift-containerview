//
//  RightViewController.swift
//  TestScrollViewAndContainerView
//
//  Created by Clint on 2018. 7. 26..
//  Copyright © 2018년 clint. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    }
    
    // willMove -> It appears on the parent screen.
    override func willMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)   // TestScrollViewAndContainerView.ViewController
        }
    }
    
    // It appears on the parent screen. -> didMove
    override func didMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
}
