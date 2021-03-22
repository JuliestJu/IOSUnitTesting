//
//  ViewController.swift
//  NetworkRequest
//
//  Created by Юлия Воротченко on 19.03.2021.
//  Copyright © 2021 Юлия Воротченко. All rights reserved.
//

import UIKit

protocol URLSessionProtocol {
     func dataTask(with request: URLRequest,
                   completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class ViewController: UIViewController {

    @IBOutlet private(set) var button: UIButton!
    var session: URLSessionProtocol = URLSession.shared
    private var dataTask: URLSessionDataTask?
    
    deinit {
        print("ViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func buttonTapped() {
        searchForBook(terms: "Out from bonewille")
       // searchForBook(terms: "the great cow race")
    }
    
    private func searchForBook(terms: String) {
        guard let encodedTerms = terms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=\(encodedTerms)") else { return }
        
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request) { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let self = self else { return }
            
            let decoded = String(data: data ?? Data(), encoding: .utf8)
            print("response: \(String(describing: response))")
            print("data: \(String(describing: data))")
            print("error: \(String(describing: error))")
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.dataTask = nil
                self.button.isEnabled = true
            }
            
        }
        
        button.isEnabled = false
        dataTask?.resume()
    }
}

extension URLSession: URLSessionProtocol {}
