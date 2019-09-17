//  rankList的model

import Foundation

struct DMModel: Codable {
    var status: StrInt
    var msg: String
    var data: TestUser
    
//    struct DMData: Codable {
//        var stateCode: StrInt
//        var message: String
//        var returnData: DMReturnData?
//    }
//
//    struct DMReturnData: Codable {
//        var rankinglist: [DMRankingList]?
//    }
//
//    struct DMRankingList: Codable {
//        var title: String
//        var subTitle: String
//        var cover: String
//        var argName: String
//        var argValue: StrInt
//        var rankingType: String
//    }
    
    struct TestUser: Codable {
        var password: String
            
        var id: StrInt
        
        var phone: String
        //    var password = ""
        var username: String
        var sex: StrInt
        var age: StrInt
        var token: String
    }
}

