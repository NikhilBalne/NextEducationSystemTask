//
//  ProductResponse.swift
//  NextEducationSystemTask
//
//  Created by Nikhil Balne on 17/12/20.
//

import Foundation

// MARK: - ProductResponse
struct NoticeBoardResponse: Decodable {
    
    let name,image,description,title,date,teacherName: String?

}
