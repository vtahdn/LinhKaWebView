//
//  WebViewController.swift
//  LinhKaWebView
//
//  Created by macbook on 10/12/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var urlString: UITextField!
    @IBOutlet weak var webView: UIWebView!
    let baseUrl = "http://www."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myActivity.hidden = true
    }
    
    // Enter event for text field
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        myActivity.hidden = false
        let url = NSURL(string: baseUrl + textField.text!)!
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
        myActivity.startAnimating()
        return true
    }
    
    // Hide the loading icon.
    func webViewDidFinishLoad(webView: UIWebView) {
        myActivity.hidden = true
        myActivity.stopAnimating()
    }
}
