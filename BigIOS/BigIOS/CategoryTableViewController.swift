//
//  CategoryTableViewController.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/4.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import UIKit
import XLProgressHUD
import Alamofire
import ObjectMapper

class CategoryTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    var dataArr=[CategoryModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        let cellNib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: BaseVar.CATEGORY_CELL_ID)
        
        getData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let aModel=dataArr[section]
        let subArr=aModel.subclass
        
        return  subArr.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataArr[section].sc_name
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:  CategoryTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(BaseVar.CATEGORY_CELL_ID) as! CategoryTableViewCell
        let model=dataArr[indexPath.section].subclass[indexPath.row]
        cell.labelCategory.text=model.sc_name
        cell.imageCategory.hnk_setImageFromURL(model.getPicURL())
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.view.showMessage(String(indexPath.section)+":"+String(indexPath.row), interval: 0.7, position: "center")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onBackbtnClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func getData(){
        Alamofire.request(.GET, BaseVar.API_GET_CATEGORY).responseJSON{
            response in
            let ajson = response.result.value
            let resultModel = Mapper<ResultModel>().map(ajson)
            
            if resultModel?.isSuccessed()==true{
               self.dataArr = Mapper<CategoryModel>().mapArray(resultModel?.result)!
               self.tableView.reloadData()
            }
        }
    }
}
