//
//  ViewController.swift
//  ipGetter
//
//  Created by Admin on 3/15/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataSource = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AlamoNetwork()
        tableView.delegate = self
        tableView.dataSource = self
//        networkManager { self.tableView.reloadData() }
        
    }
    
//    func AlamoNetwork () {
//        AF
//            .request("http://api.ipapi.com/46.53.250.179?access_key=79fb189ce31d83736284ac9ea8fab88b&format=1")
//            .response(completionHandler: { [self] response in
//                print(response)
//                switch response.result {
//                case .success(let data):
//
//                    let decoder = JSONDecoder()
//                    self.dataSource = try! JSONDecoder().decode([Location].self, from: data!)
//
//
//
//                case .failure(let error):
//                    print("Error")
//                }
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            })
//    }
    
        
            func networkManager(completed: @escaping () -> ()) {
            let sharedSession = URLSession.shared
            guard let url = URL(string: "http://api.ipapi.com/46.53.250.179?access_key=79fb189ce31d83736284ac9ea8fab88b&format=1") else { return }
            let request = URLRequest(url: url)
            let dataTask = sharedSession.dataTask(with: request) { data, response, error in
                if error == nil {
                    do {
                        
                        self.dataSource = try JSONDecoder().decode([Location].self, from: data!)
                        DispatchQueue.main.async {
                            completed()
                        }
                    } catch {
                        print("JSON crash")
                    }
                }
            }
                dataTask.resume()
        }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)

        let post = dataSource[indexPath.row]
        
        cell.textLabel?.text = post.city
        cell.detailTextLabel?.text = post.countryName
        return cell
        
        }
    }


