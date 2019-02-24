//
//  ViewController.swift
//  JsonParsing_Decodable
//
//  Created by CSS on 24/02/19.
//  Copyright © 2019 css. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadAPI()
        loadPostAPI()
        // Do any additional setup after loading the view, typically from a nib.
    }
        //https://api.github.com/users/kumareshsaran
    
    private func loadAPI(){
        let url = URL(string: "https://api.github.com/users/kumareshsaran")
        guard url != nil else {
            return
        }
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                let gitGuthubData = try decoder.decode(GitHubModel?.self, from: data!)
                
                print(gitGuthubData?.login)
            }catch {
                print(error)
            }
        }.resume()
    }
    
    
    private func loadPostAPI(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        guard url != nil else {
            return
        }
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var PostAPIModelParms = PostAPIModel()
        PostAPIModelParms.body = "skdjk"
        PostAPIModelParms.title = "ertyuiohgxfghjkl;"
        PostAPIModelParms.userId = 1
        
        do {
            let enCoder = try? JSONEncoder().encode(PostAPIModelParms)
            urlRequest.httpBody = enCoder
        }
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data , error == nil, response != nil else {
                return
            }
            do {
                let deCoder = JSONDecoder()
                
                let data = try deCoder.decode(PostAPIModelResponse.self, from: data)
                print(data.title)
                print(response.debugDescription)
            }catch {
                print("Err \(error)")
            }
            
        }.resume()
        
    }
    
}


