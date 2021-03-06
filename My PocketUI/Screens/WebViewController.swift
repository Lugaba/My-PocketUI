//
//  WebViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 19/07/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    var urlString: String = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.backgroundColor = UIColor(named: "bgcolor")
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        urlString = urlString.trimmingCharacters(in: .whitespacesAndNewlines)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        progressView.progressTintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        refresh.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: webView, action: #selector(webView.goBack))
        backButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .done, target: webView, action: #selector(webView.goForward))
        forwardButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        let progressButton = UIBarButtonItem(customView: progressView)

        toolbarItems = [backButton, spacer, forwardButton, spacer ,progressButton, spacer, refresh]
        navigationController?.setToolbarHidden(false, animated: false)

        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)

        if urlString.hasPrefix("www") {
            urlString = "https://" + urlString
        }
        
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: [urlString], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
