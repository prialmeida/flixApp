//
//  TrailerViewController.swift
//  flixapp
//
//  Created by Priscila Almeida on 9/28/20.
//  Copyright © 2020 Priscila Almeida. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {

    
    var id:  NSNumber = 0.0
    var key: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let results=dataDictionary["results"] as! NSArray

                let first=results[0] as! [String:Any]
                self.key=first["key"] as! String
                
                let myUrl = URL(string: "https://www.youtube.com/watch?v=\(self.key)")
                let myRequest = URLRequest(url: myUrl!)
                self.webView.load(myRequest)
               
               
            }
        }
        
        task.resume()

    }
    
    
    @IBAction func exitTrailer(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
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
