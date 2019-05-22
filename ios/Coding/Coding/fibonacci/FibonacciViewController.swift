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
        
        self.fib(n: 20)
    }
    
    override func loadView() {
        view = fibView
    }
    
    func fib(n: Int) {
        // Write Fibonacci to N
        var current = 1
        var historical = 0
        (0...n).forEach { fibIndex in
            let next = current + historical
            print(next)
            historical = current
            current = next
        }
    }
}
