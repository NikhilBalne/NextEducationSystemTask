//
//  ProductsViewController.swift
//  NextEducationSystemTask
//
//  Created by Nikhil Balne on 17/12/20.
//

import UIKit

class NoticeBoardViewController: UIViewController {

    @IBOutlet weak var noticesTableView: UITableView!
    var noticesTableData : [NoticeBoardResponse]? = nil
    let noticesViewModel : NoticeBoardViewModel = NoticeBoardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        getNoticeBoardInformation()
    }

    // MARK: - Get Products
    private func getNoticeBoardInformation(){
                
        noticesViewModel.getStudentNotices { (products,error,httpUrlResponse) in
            
            if httpUrlResponse?.statusCode == 200 {
                self.noticesTableData = products
            }
            
            DispatchQueue.main.async {
                self.hideActivityIndicator()
                self.noticesTableView.reloadData()
            }
        }
        
    }
    
}

// MARK: - Products TableView Delegate and DataSource Methods
extension NoticeBoardViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticesTableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noticeCell = (tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? NoticeBoardTableViewCell)!
        let objNotice = noticesTableData?[indexPath.row]
        if let objNotice = objNotice {
            noticeCell.setNoticeCellDetails(product: objNotice)
        }
        
        return noticeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailNoticeView = self.storyboard?.instantiateViewController(identifier: "NoticeBoardDetailViewController") as? NoticeBoardDetailViewController
        detailNoticeView?.product = noticesTableData?[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detailNoticeView!, animated: true)
    }
    
    
}
