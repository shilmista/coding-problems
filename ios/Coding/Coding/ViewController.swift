//
//  ViewController.swift
//  Coding
//
//  Created by Tony Cheng on 5/22/19.
//  Copyright © 2019 Tony Cheng. All rights reserved.
//

import UIKit

enum CodingViewController: String, CaseIterable {
    case FibonacciViewController
}

class ViewController: UIViewController, ListViewDelegate {
    
    lazy var listView: ListView = {
        let viewControllers = CodingViewController.allCases.map { $0 }
        let listView = ListView(delegate: self, viewControllers: viewControllers)
        return listView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = listView
    }
    
    // MARK: - ListViewDelegate
    func didSelectViewController(viewController: CodingViewController) {
        if let controllerClass = classFromString(viewController.rawValue) {
            print(controllerClass)
        } else {
            print("class for \(viewController.rawValue) was not found")
        }
    }

}

func classFromString(_ name: String) -> AnyClass? {
    return Bundle.main.classNamed(name)
}
