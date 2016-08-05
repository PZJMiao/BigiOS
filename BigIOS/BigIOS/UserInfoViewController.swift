//
//  UserInfoViewController.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/3.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import UIKit
import ObjectMapper
import Haneke

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelAccount: UILabel!
    @IBOutlet weak var labelNick: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelBirth: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userStr=NSUserDefaults.standardUserDefaults().stringForKey(BaseVar.KEY_MEMBER)
        if userStr?.isEmpty==false {
            let user=Mapper<UserModel>().map(userStr);
            if user?.member_id.isEmpty==false {
                labelAccount.text=user?.member_name
                labelNick.text=user?.member_nickname
                labelGender.text=user?.getGenderDesc()
                labelBirth.text=user?.member_birthday
                imageAvatar.hnk_setImageFromURL((user?.getAvatarURL())!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBackClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    @IBAction func onLogoff(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setValue("", forKey: BaseVar.KEY_MEMBER)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
