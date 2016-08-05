//
//  CategoryModel.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/4.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import ObjectMapper

public class CategoryModel: BaseModel {
    var sc_id:String=""
    var sc_name:String=""
    var sc_pic:String=""
    var sc_sort:String=""
    var sc_parent_id:String=""
    var if_show:String=""
    var subclass=[CategoryModel]()
    
    override public func mapping(map: Map) {
        self.sc_id <- map["sc_id"]
        self.sc_name <- map["sc_name"]
        self.sc_pic <- map["sc_pic"]
        self.sc_sort <- map["sc_sort"]
        self.sc_parent_id <- map["sc_parent_id"]
        self.if_show <- map["if_show"]
        self.subclass <- map["subclass"]
    }
    
    public func getPicURL() -> NSURL{
       return NSURL(string: sc_pic)!
    }
}
