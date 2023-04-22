//
//  ViewController.swift
//  URLSessionAPIDemo
//
//  Created by Akshay Kumar on 21/04/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var dataTableView: UITableView!
    
    
    //MARK: Define Variable
    var dataArray = [DataModel]()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        
        dataTableView.delegate = self
        dataTableView.dataSource = self
        
        apiCalling()
        // Do any additional setup after loading the view.
    }
    
    //MARK: RegisterTableViewCell
    func registerTableViewCell(){
        dataTableView.register(UINib(nibName: "CellDataTVC", bundle: nil), forCellReuseIdentifier: "CellDataTVC")
    }
    
    
    
    
    //MARK: Calling API
    func apiCalling(){
        
        DataService.sharedInstance.getUser { resultDict, error in
            print(resultDict)
            if error != "" {
                if let value = resultDict["data"] as? [NSDictionary] {
                    print(value)
                    
                    self.dataArray.removeAll()
                    
                    for i in 0..<value.count {
                        let dict = value[i]
                        
                        let email = dict["email"] as? String ?? ""
                        let gender = dict["gender"] as? String ?? ""
                        let id = dict["id"] as? Int ?? 0
                        let name = dict["name"] as? String ?? ""
                        let status = dict["status"] as? String ?? ""
                        
                        self.dataArray.append(DataModel.init(email: email, gender: gender, id: id, name: name, status: status))
                    }
                    DispatchQueue.main.async {
                        self.dataTableView.reloadData()
                    }
                }
            }
            else {
                print("Something went wrong")
            }
        }
    }
    
}


//MARK: UITableView Deleagte & DataSource Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellDataTVC") as? CellDataTVC else {
            return UITableViewCell()
        }
        
        let data = dataArray[indexPath.row]
        
        cell.userIdLbl.text = "id: \(data.id ?? 0)"
        cell.userNameLbl.text = "Name: \(data.name ?? "")"
        cell.userGenderLbl.text = "Gender: \(data.gender ?? "")"
        cell.userEmailLbl.text = "Email: \(data.email ?? "")"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataArray[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowDetailVC") as! ShowDetailVC
        vc.userId = "id: \(data.id ?? 0)"
        vc.name = "Name: \(data.name ?? "")"
        vc.email = "Email: \(data.email ?? "")"
        vc.gender = "Gender: \(data.gender ?? "")"
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
