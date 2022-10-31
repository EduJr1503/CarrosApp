//
//  ViewController.swift
//  Carros
//
//  Created by Eduardo Junior on 28/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var senhaLogin: UITextField!
    @IBAction func botaoLogin(_ sender: UIButton) {
        makeRequest()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // API
    
    private func makeRequest() {
        let url = URL(string: "https://carros-springboot.herokuapp.com/api/v2/login")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "username": emailLogin.text ?? "",
            "password": senhaLogin.text ?? ""
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("deu erro porque ERROR não é nulo!")
            } else if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("deu erro porque não retornou um statusCode válido!")
                print("response: \(response)")
                
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(CarrosViewController(), animated: true)
                }
                
            } else {
                if let data = data {
                    do {
                        //                        let result = try JSONDecoder().decode(T.self, from: data)
                        print("data: \(String(decoding: data, as: UTF8.self))")
                        
                    } catch (let error) {
                        print(error)
                    }
                } else {
                    print("deu erro porque não retornou valor do DATA!")
                    return
                }
            }
        }.resume()
    }
}


