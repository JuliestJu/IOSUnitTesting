//
//  ViewController.swift
//  Naviagation
//
//  Created by Юлия Воротченко on 19.03.2021.
//  Copyright © 2021 Юлия Воротченко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) weak var codePushButton: UIButton!
    @IBOutlet private(set) weak var codeModalButton: UIButton!
    @IBOutlet private(set) weak var seguePushButton: UIButton!
    @IBOutlet private(set) weak var segueModalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func pushNextViewController(_ sender: UIButton) {
        let nextVC = CodeNextViewController(labelText: "Pushed from code")
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func presentModalNextViewController(_ sender: UIButton) {
        let nextVC = CodeNextViewController(labelText: "Modal from code")
        self.present(nextVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "pushNext":
            guard let nextVC = segue.destination as? SegueNextViewController else { return }
            
            nextVC.labelText = "Pushed from segue"
        case "modalNext":
            guard let nextVC = segue.destination as? SegueNextViewController else { return }
            nextVC.labelText = "Modal from Segue"
        default:
            return
        }
    }
    
}

