//
//  Employee.swift
//  CompanyDirectory
//
//  Created by 大林拓実 on 2021/02/17.
//

import Foundation

struct Employee {
    var name: String
    var status: Status
    var contactAddress: String
    var teamType: TeamType
}

enum Status: String {
    case online = "オンライン"
    case offline = "オフライン"
}
