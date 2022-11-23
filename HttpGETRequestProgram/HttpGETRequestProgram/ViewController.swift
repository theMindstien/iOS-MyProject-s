//
//  ViewController.swift
//  HttpGETRequestProgram
//
//  Created by apple on 01/11/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indicator.isHidden = true
    }
    
    
    
    @IBAction func actionOnDownload(_ sender: Any) {
        indicator.isHidden = false
        
        let strURL = "https://images.immediate.co.uk/production/volatile/sites/23/2019/10/Federico_Veronesi_Lions-cover-image-e359a4e.jpg"
        
        let myUrl:URL = URL(string: strURL)!
        
        var request:URLRequest = URLRequest(url: myUrl)
        request.httpMethod = "GET"
        
        let urlSession:URLSession = URLSession.shared
        
        let dataTask:URLSessionDataTask = urlSession.dataTask(with: request, completionHandler: downloadHandler(data:response:err:))
        
        dataTask.resume()
    }
    
    func downloadHandler(data:Data?,response:URLResponse?,err:Error?)->Void
    {
        
        print(data,response,err)
        if (data != nil && err == nil){
            
            let mainq = DispatchQueue.main
            mainq.async {
                self.imageView.image = UIImage(data: data!)
                self.indicator.isHidden = true
            }
            
            
        }
        
        
    }
    
    
    
    
    
}

