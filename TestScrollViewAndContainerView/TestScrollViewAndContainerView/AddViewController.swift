//
//  AddViewController.swift
//  TestScrollViewAndContainerView
//
//  Created by Clint on 2018. 7. 30..
//  Copyright © 2018년 clint. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    deinit {
        // check remove self
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
    // willMove -> It appears on the parent screen.
    override func willMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
    
    // It appears on the parent screen. -> didMove
    override func didMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
    
    // remove child view controller
    @IBAction func onRemoveChildViewController(_ sender: Any) {
        // Notify the parent to remove it by calling willMove.
        // willMove 를 호출해서 제거한다는 것을 알립니다.
        self.willMove(toParent: nil)
        // Remove Constraint.
        // 제약사항 제거
        self.view.removeFromSuperview()
        // Remove the relationship of the child connected to the parent.
        // 부모에 연결된 자식의 관계를 제거합니다.
        self.removeFromParent()
    }
}
