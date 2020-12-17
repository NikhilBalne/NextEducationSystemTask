//
//  ProductTableViewCell.swift
//  NextEducationSystemTask
//
//  Created by Nikhil Balne on 17/12/20.
//

import UIKit

class NoticeBoardTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    func setNoticeCellDetails(product:NoticeBoardResponse){
        self.titleLabel.text = product.title
        self.dateLabel.text = product.date
        
        // MARK: - CardView Effect
        cardView.layer.cornerRadius = 20.0
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 12.0
        cardView.layer.shadowOpacity = 0.7
        
    }
    
}

