//
//  NodeSerializeViewController.swift
//  Coding
//
//  Created by Tony Cheng on 5/23/19.
//  Copyright © 2019 Tony Cheng. All rights reserved.
//

/*
 This problem was asked by Google.
 
 Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), which deserializes the string back into the tree.
 
 For example, given the following Node class
 
 class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
         self.left = left
         self.right = right
 The following test should pass:
 
 node = Node('root', Node('left', Node('left.left')), Node('right'))
 assert deserialize(serialize(node)).left.left.val == 'left.left'
*/

import Foundation
import UIKit

class Node {
    var val: String = ""
    var left: Node?
    var right: Node?
    
    convenience init(val: String, left: Node? = nil, right: Node? = nil) {
        self.init()
        
        self.val = val
        self.left = left
        self.right = right
    }
    
    convenience init(fromString: String) {
        self.init()
        
        let characters = Array(fromString)
        var currentVal = ""
        var leftNode: Node?
        var rightNode: Node?
        
        (0..<fromString.count).forEach { (i) in
            let currentChar = characters[i]
            if currentChar == "(" {
                
            } else if currentChar == ")" {
                // finished
            } else if currentChar == "," {
                
            } else {
                currentVal.append(currentChar)
            }
        }
    }
    
    func serialize() -> String {
        var serialString: String = "(\(self.val)"
        
        if let left = left {
            serialString.append(",\(left.serialize())")
        }
        if let right = right {
            serialString.append(",\(right.serialize())")
        }
        serialString.append(")")
        return serialString
    }
    
}

final class NodeSerializeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let node = Node(val: "root", left: Node(val: "left", left: Node(val: "left.left")), right: Node(val: "right"))
        let serial = node.serialize()
        print(serial)
    }
    
}
