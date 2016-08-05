//
//  BaseVar.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/3.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

public class BaseVar {
    
    //CELL
    static let CATEGORY_CELL_ID="category_cell_id"
    static let CATEGORY_COLLECTION_CELL="category_collection_cell"
    static let CATEGORY_HEADER_CELL="category_header_cell"
    
    //APP DATA KEY
    static let KEY_MEMBER="key_of_memberInfo"
    
    //API
    static let FLAG="&flag=ios"
    static let HOST = "http://www.fenhongshop.com"
    static let API_LOGIN = HOST + "/api/index.php?act=common_member&op=login"+FLAG
    static let API_GET_MEMBER_INFO=HOST+"/api/index.php?act=common_member&op=get_member_info"+FLAG
    static let API_GET_CATEGORY=HOST+"/api/index.php?act=buyer_discovery&op=get_shop_class"+FLAG
}
