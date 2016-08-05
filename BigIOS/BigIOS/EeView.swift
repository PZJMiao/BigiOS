//
//  EeView.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/3.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import UIKit

@IBDesignable  //动态刷新

extension UIView {
    
    @IBInspectable var eeBorderColor:UIColor{
        get{
            return UIColor.init(CGColor: self.layer.borderColor!)
        }
        
        set(aColor){
            self.layer.borderColor=aColor.CGColor
        }
    }
    
    @IBInspectable var eeBorderWidth:CGFloat{
        get{
            return self.layer.borderWidth
        }
        set(aWidth){
            self.layer.borderWidth=aWidth
        }
    }
    
    @IBInspectable var eeCornerRadius:CGFloat {
        get{
            return self.layer.cornerRadius
        }
        
        set(aRadius){
            self.layer.cornerRadius=aRadius
        }
    }
    
    func animateWhenClicked() {
        self.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        self.layer.transform = CATransform3DMakeScale(1, 1, 0)
        UIView.animateWithDuration(0.9, animations: {
            self.backgroundColor = UIColor.whiteColor()
            self.layer.transform = CATransform3DMakeTranslation(1, 1, 1)
        })
    }
}
