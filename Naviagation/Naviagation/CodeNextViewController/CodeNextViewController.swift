//
//  CodeNextViewController.swift
//  Naviagation
//
//  Created by Юлия Воротченко on 19.03.2021.
//  Copyright © 2021 Юлия Воротченко. All rights reserved.
//

import UIKit

class CodeNextViewController: UIViewController {
let label = UILabel()
    
    init(labelText: String) {
        self.label.text = labelText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .secondarySystemBackground
        self.view.addSubview(label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        self.activateEqualConstraints(.centerX, fromItem: self.label, toItem: self.view)

    }
    
    private func activateEqualConstraints(_ attribute: NSLayoutConstraint.Attribute,
                                          fromItem: UIView,
                                          toItem: UIView) {
        NSLayoutConstraint(item: fromItem, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: attribute, multiplier: 1, constant: 0).isActive = true
    }

}
