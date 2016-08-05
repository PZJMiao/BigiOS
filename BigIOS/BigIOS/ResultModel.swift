//
//  ResultModel.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/3.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//
import ObjectMapper

public class ResultModel: BaseModel {
    var hasmore:Bool = false
    var msg:String = ""
    var error:String = ""
    var result:AnyObject?=nil
    
    override public func mapping(map: Map) {
        
        self.hasmore <- map["hasmore"]
        self.msg <- map["msg"]
        self.error <- map["error"]
        self.result <- map["result"]
    }
    
    public func isSuccessed() -> Bool{
        return error=="0"
    }
}
