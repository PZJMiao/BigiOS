//
//  BaseModel.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/2.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import Foundation
import ObjectMapper

public class BaseModel:Mappable{
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
    }
    
    var description: String {
        get {
            return Mapper().toJSONString(self, prettyPrint: false)!
        }
    }
}