//
//  CellDataTVC.swift
//  URLSessionAPIDemo
//
//  Created by Akshay Kumar on 21/04/23.
//

import UIKit

class CellDataTVC: UITableViewCell {

    //MARK: cell Outlets
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userGenderLbl: UILabel!
    
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
