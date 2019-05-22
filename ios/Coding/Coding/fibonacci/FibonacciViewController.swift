//
//  FibonacciViewController.swift
//  Coding
//
//  Created by Tony Cheng on 5/22/19.
//  Copyright © 2019 Tony Cheng. All rights reserved.
//

import Foundation
import UIKit

class FibonacciViewController: UIViewController {
    lazy var fibView: FibonacciView = {
        let view = FibonacciView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "fibonacci"
    }
    
    override func loadView() {
        view = fibView
    }
    
}
