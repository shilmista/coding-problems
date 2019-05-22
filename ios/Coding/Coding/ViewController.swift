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
        title = "coding problems"
    }
    
    override func loadView() {
        view = listView
    }
    
    // MARK: - ListViewDelegate
    func didSelectViewController(viewController: CodingViewController) {
        if let controllerClass = classFromString(viewController.rawValue) as? UIViewController.Type {
            let newController = controllerClass.init()
            navigationController?.pushViewController(newController, animated: true)
        } else {
            print("class for \(viewController.rawValue) was not found")
        }
    }

}

func classFromString(_ className: String) -> AnyClass? {
    /// get namespace
    if let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String {
        /// get 'anyClass' with classname and namespace
        let cls: AnyClass? = NSClassFromString("\(namespace).\(className)");
        
        return cls;
    }
    return nil
}
