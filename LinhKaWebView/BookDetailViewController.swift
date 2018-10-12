//
//  BookDetailViewController.swift
//  LinhKaWebView
//
//  Created by macbook on 10/12/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var timeButton: UIButton!
    
    var urlString: String!
    var type: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set this view title
        title = urlString
        
        // Set the time button invisible if it is not the html view
        timeButton.hidden = true
        
        // Loading icon
        webView.delegate = self
        myActivity.stopAnimating()
        
        // Read files
        var urlPath = "Default"
        
        switch type {
        case "PDF":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "pdf")!
        case "DOCX":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "docx")!
        case "HTML":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "html")!
            timeButton.hidden = false
        default:
            break
        }
        
        let url: NSURL = NSURL.fileURLWithPath(urlPath)
        let urlRequest = NSURLRequest(URL: url)
        webView.loadRequest(urlRequest)

    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("webViewDidStartLoad")
    }

    // Stop the loading icon.
    func webViewDidFinishLoad(webView: UIWebView) {
        myActivity.stopAnimating()
        myActivity.hidesWhenStopped = true
        print("webViewDidFinishLoad")
    }
    
    // Get-time, reload, go-back and go-forward action.
    @IBAction func controlButtonAction(sender: UIButton) {
        
        switch sender.tag {
        case 101:
            webView.stringByEvaluatingJavaScriptFromString("hello()")
            print(sender.tag)
        case 102:
            webView.reload()
            print(sender.tag)
        case 103:
            webView.goBack()
            print(sender.tag)
        case 104:
            webView.goForward()
            print(sender.tag)
        default:
            break
        }
    }
    
    
    
    
    
    
    

}
