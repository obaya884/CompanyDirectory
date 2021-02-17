//
//  Team.swift
//  CompanyDirectory
//
//  Created by 大林拓実 on 2021/02/17.
//

import Foundation

struct Team {
    var name: String
    var description: String
    var members: [Employee]
    var teamType: TeamType
}

enum TeamType: String {
    case finance = "ファイナンス"
    case engineering = "エンジニアリング"
    case design = "デザイン"
    case matketing = "マーケティング"
    case legal = "法務"
    case humanResources = "人事"
}
