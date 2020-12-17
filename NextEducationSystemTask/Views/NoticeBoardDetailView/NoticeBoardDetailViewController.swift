//
//  ProductsDetailViewController.swift
//  NextEducationSystemTask
//
//  Created by Nikhil Balne on 17/12/20.
//

import Foundation
import Kingfisher

class NoticeBoardDetailViewController: UIViewController {

    var product : NoticeBoardResponse? = nil
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    @IBOutlet weak var teacherNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpView()
    }
    
    // MARK: - Setting up Label's Data
    func setUpView(){
        self.titleLabel.text = product?.title
        self.descriptionLabel.text = product?.description
        self.imageViewLabel.kf.indicatorType = .activity
        self.imageViewLabel.kf.setImage(with: URL(string: (product?.image)!)!)
        self.teacherNameLabel.text = "Updated by:\(product!.teacherName!)"
    }
    
}
