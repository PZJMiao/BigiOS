//
//  EeImageView.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/4.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import UIKit
@IBDesignable

extension UIImageView{
    @IBInspectable var eeCircleMode:Bool{
        get{
            return self.layer.masksToBounds
        }
        
        set(isCircle){ 
            self.layer.cornerRadius=self.layer.frame.width/2;
            self.layer.masksToBounds=isCircle;
        }
    }
}