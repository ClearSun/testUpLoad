//
//  ViewController.swift
//  News
//
//  Created by 瑞宁科技02 on 2017/8/4.
//  Copyright © 2017年 reining. All rights reserved.
//

import UIKit
import Alamofire

// 定义全局常量
private let HomeCellID = "HomeCellID"
class ViewController: UIViewController {

    // 懒加载数组
    fileprivate lazy var newModels: [NewsModel] = [NewsModel]()
    fileprivate lazy var tabelview: UITableView = {[unowned self] in
       
        // 创建
        let tabaleview = UITableView()
        
        // 设置属性
        tabaleview.frame = self.view.bounds
        tabaleview.dataSource = self
        tabaleview.rowHeight = 90
        tabaleview.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: HomeCellID)
//        tabaleview.register(UITableViewCell.self, forCellReuseIdentifier: HomeCellID)
        return tabaleview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏
       setupNavigationbar()
        
        // 
        view.addSubview(tabelview)

        loadData()
    }



}

// 设置UI
extension ViewController{
    
    fileprivate func setupNavigationbar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(named:""), for: .default)
        navigationItem.title = "网易新闻"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "搜索", style: .plain, target: self, action: #selector(serachitemClick))
    }
}
// 事件监听函数
extension ViewController{
    
    @objc fileprivate func serachitemClick(){
        
    }
}

// 网络请求函数
extension ViewController{
    
     fileprivate func loadData(){
        NetworkTool.requestData(URLString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (result:Any) in
            // 将any类型转换字字典类型
            guard let resultDict = result as? [String : Any] else { return}
            
            guard let dataArray = resultDict["T1348649079062"] as? [[String : Any]] else{return}

            for dict in dataArray{
                self.newModels.append( NewsModel(dict: dict))
            }
            
            self.tabelview.reloadData()
            // 刷新表格
        }
    }
}

// 数据源
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelview.dequeueReusableCell(withIdentifier: HomeCellID, for: indexPath) as! NewsViewCell
        
//        cell.textLabel?.text = newModels[indexPath.row].title
        cell.newModel = newModels[indexPath.row]
        return cell
    }
}












