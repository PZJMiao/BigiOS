//
//  UserModel.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/2.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import Foundation
import ObjectMapper

public class UserModel:BaseModel {
    
    var member_areainfo : String=""
    var member_truename:String=""
    var member_email:String=""
    var member_wx:String=""
    var member_name:String=""
    var member_nickname:String=""
    var member_mobile:String=""
    var member_avatar:String=""
    var token:String=""
    var member_points:String=""
    var talent_id:String=""
    var member_birthday:String=""
    var member_qq:String=""
    var if_shoper:String=""
    var member_exppoints:String=""
    var member_sex:String=""
    var store_id:String=""                 
    var member_id:String=""
    
    
    override public func mapping(map: Map) {
        self.member_areainfo <-  map["member_areainfo"]
        self.member_truename <- map["member_truename"]
        self.member_email <- map["member_email"]
        self.member_wx <- map["member_wx"]
        self.member_name <- map["member_name"]
        self.member_nickname <- map["member_nickname"]
        self.member_mobile <- map["member_mobile"]
        self.member_avatar <- map["member_avatar"]
        self.token <- map["token"]
        self.member_points <- map["member_points"]
        self.talent_id <- map["talent_id"]
        self.member_birthday <- map["member_birthday"]
        self.member_qq <- map["member_qq"]
        self.if_shoper <- map["if_shoper"]
        self.member_exppoints <- map["member_exppoints"]
        self.member_sex <- map["member_sex"]
        self.store_id <- map["store_id"]                 
        self.member_id <- map["member_id"]
    }
    
    public func getGenderDesc() -> String{
        switch self.member_sex {
        case "0":
            return "保密"
        case "1":
            return "男"
        case "2":
            return "女"
        default:
            return "保密"
        }
    }
    
    public func getAvatarURL() -> NSURL{
         return NSURL(string: self.member_avatar)!
    }
}
