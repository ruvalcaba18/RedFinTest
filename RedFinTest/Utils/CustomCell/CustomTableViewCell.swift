//
//  CustomTableViewCell.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    @IBOutlet var subtitleHeader: NSLayoutConstraint!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.fromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    
}
