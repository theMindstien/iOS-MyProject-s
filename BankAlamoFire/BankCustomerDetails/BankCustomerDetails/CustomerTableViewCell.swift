//
//  CustomerTableViewCell.swift
//  BankCustomerDetails
//
//  Created by apple on 11/11/22.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var accTypeLabel: UILabel!
    @IBOutlet weak var accNoLabel: UILabel!
    @IBOutlet weak var balLabel: UILabel!
    @IBOutlet weak var PubDateLabel: UILabel!
    


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
