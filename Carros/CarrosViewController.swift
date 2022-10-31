//
//  CarrosViewController.swift
//  Carros
//
//  Created by Eduardo Junior on 29/10/22.
//

import UIKit
import WebKit

class CarrosViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL? = URL(string: "https://carros-flutterweb.firebaseapp.com")
        
        if let value = url {
            
            self.myWebView.load(URLRequest(url: value))
            
            self.myWebView.allowsBackForwardNavigationGestures = true
        }
    }
}
