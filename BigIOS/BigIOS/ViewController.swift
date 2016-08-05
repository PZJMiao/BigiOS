//
//  ViewController.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/5/9.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import XLProgressHUD
import ObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet weak var btnUserInfo: UIButton!

    @IBOutlet weak var textFieldAccount: UITextField!
    
    @IBOutlet weak var textFieldPwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let userStr=NSUserDefaults.standardUserDefaults().stringForKey(BaseVar.KEY_MEMBER)
        if userStr?.isEmpty==false {
            let user=Mapper<UserModel>().map(userStr);
            if user?.member_id.isEmpty==false {
                gotoUserInfoController()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnUserInfoClick(sender: AnyObject) {
        let account=textFieldAccount.text
        let password=textFieldPwd.text
        
        if account?.isEmpty==true {
            self.view.showMessage("账号不能为空", interval: 0.7, position: "center");
            return
        }
        
        if password?.isEmpty==true {
            self.view.showMessage("密码不能为空", interval: 0.7, position: "center");
            return
        }
        
        var params=[String:String]()
        params["account"]=account
        params["password"]=password
        
        
        self.view.showLoadingTilteActivity("登录验证中",position:"center")
        
        Alamofire.request(.POST,BaseVar.API_LOGIN,parameters:params)
            .responseJSON { response in
                self.view.hideActivity()
                let ajson=response.result.value;
                let resultModel = Mapper<ResultModel>().map(ajson)
                if resultModel?.isSuccessed()==true {
                    
                    let user=Mapper<UserModel>().map(resultModel?.result);
                    
                    NSUserDefaults.standardUserDefaults().setValue(user?.description, forKey: BaseVar.KEY_MEMBER)
                    
                    self.view.showMessage(resultModel?.msg, interval: 0.7, position: "center")
                    self.gotoUserInfoController()
                }else{
                    self.view.showMessage("登录失败", interval: 0.7, position: "center")
                }
        }
    }

    
    func gotoUserInfoController(){
        let userInfoController=UserInfoViewController(nibName:"UserInfoViewController",bundle:nil);
        userInfoController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        self.presentViewController(userInfoController, animated: true) {
        }
    }
    
    func showAlert(content:String){
        let alert=UIAlertController(title: "提示", message: content, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)
    
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.presentViewController(alert,animated:true,completion: nil)
    }
    
    
    @IBAction func onBtnFindClick(sender: AnyObject) {
        let tableController=CategoryTableViewController(nibName: "CategoryTableViewController", bundle: nil)
        tableController.modalTransitionStyle=UIModalTransitionStyle.CoverVertical
        self.presentViewController(tableController, animated: true, completion: nil);
    }
    @IBAction func onBtnExplorerClick(sender: AnyObject) {
        let explorerController=CategoryCollectionViewController(nibName: "CategoryCollectionViewController", bundle: nil)
        
        explorerController.modalTransitionStyle=UIModalTransitionStyle.CoverVertical
        self.presentViewController(explorerController, animated: true, completion: nil)
    }

    
}

