//
//  ProductViewModel.swift
//  NextEducationSystemTask
//
//  Created by Nikhil Balne on 17/12/20.
//

import Foundation

struct NoticeBoardViewModel{
    
    // MARK: - Method to Hit Api api and gets Data
    func getStudentNotices(completion: @escaping(_ result: [NoticeBoardResponse]?,Error?,HTTPURLResponse?)-> Void){
        
        HttpUtility.shared.makeApiGetCall(requestUrl: URL(string: ApiEndPoints.studentsDetails)!, resultType: [NoticeBoardResponse].self) { (productResult,error,httpUrlResponse) in
            _ = completion(productResult,error,httpUrlResponse)
        }
        
    }
}
