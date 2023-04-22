//
//  ShowDetailVC.swift
//  URLSessionAPIDemo
//
//  Created by Akshay Kumar on 22/04/23.
//

import UIKit

class ShowDetailVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userGenderLbl: UILabel!
    
    
    
    var userId = ""
    var name = ""
    var email = ""
    var gender = ""
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        // Do any additional setup after loading the view.
    }
    
    
    func UISetup(){
        userIdLbl.text = "\(userId)"
        userNameLbl.text = "\(name)"
        userEmailLbl.text = "\(email)"
        userGenderLbl.text = "\(gender)"
    }
}
