//
//  CategoryCollectionViewController.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/4.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class CategoryCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataArr=[CategoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource=self
        collectionView.delegate=self
        
        let cellNib=UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: BaseVar.CATEGORY_COLLECTION_CELL)
        
        let headerNib=UINib(nibName: "CategoryCollectionReusableView", bundle: nil);
        collectionView.registerNib(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: BaseVar.CATEGORY_HEADER_CELL)
        
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onBtnBackClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let aModel=dataArr[section]
        let subArr=aModel.subclass
        
        return  subArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CategoryCollectionViewCell = self.collectionView.dequeueReusableCellWithReuseIdentifier(BaseVar.CATEGORY_COLLECTION_CELL, forIndexPath: indexPath) as! CategoryCollectionViewCell
    
        let aModel=dataArr[indexPath.section].subclass[indexPath.row]
        
        cell.labelCategory.text = aModel.sc_name
        cell.imageCategory.hnk_setImageFromURL(aModel.getPicURL())
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var cell=CategoryCollectionReusableView()
        
        if kind==UICollectionElementKindSectionHeader {
            cell=self.collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: BaseVar.CATEGORY_HEADER_CELL, forIndexPath: indexPath) as! CategoryCollectionReusableView
            cell.labelTitle.text = dataArr[indexPath.section].sc_name
        }
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let awidth = UIScreen.mainScreen().bounds.width / 3
        return CGSizeMake(awidth-2, awidth-2)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    func getData(){
        Alamofire.request(.GET, BaseVar.API_GET_CATEGORY).responseJSON{
            response in
            let ajson = response.result.value
            let resultModel = Mapper<ResultModel>().map(ajson)
            
            if resultModel?.isSuccessed()==true{
                self.dataArr = Mapper<CategoryModel>().mapArray(resultModel?.result)!
                self.collectionView.reloadData()
            }
        }
    }
}
