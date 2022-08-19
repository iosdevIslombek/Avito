//
//  TableViewCell.swift
//  Avito
//
//  Created by Islomjon on 19/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCell"
    static func uinib()-> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
            containerView.layer.shadowColor = UIColor.lightGray.cgColor
            containerView.layer.shadowRadius = 4
            containerView.layer.shadowOpacity = 0.5
            containerView.layer.shadowOffset = CGSize(width: 2, height: 3)
        }
    }
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var skillsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateCell(data: EmployesDM) {
        nameLbl.text = data.name
        phoneNumberLbl.text = "\(data.phoneNumber)"
        skillsLbl.text = data.skillsString()
    }
}
