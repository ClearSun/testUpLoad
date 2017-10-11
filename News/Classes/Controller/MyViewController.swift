//
//  MyViewController.swift
//  News
//
//  Created by 瑞宁科技02 on 2017/8/23.
//  Copyright © 2017年 reining. All rights reserved.
//

import UIKit
import SnapKit
class MyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
//    var label1 = UILabel()
//    
//    var  num = 0
    
    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setupUI()
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.delegate = self;
        tableView?.dataSource = self;
        tableView?.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        view.addSubview(tableView!)
        tableView?.estimatedRowHeight = 44.0
        tableView?.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        //        cell.textLabel?.text = "xxxx\(indexPath.row)"
        cell.titleLab?.text = "我是假数据"
        if indexPath.row%2==0 {
            cell.contentLabel?.text = "我是假数据我是假数据我是假数据"
        }
        else
        {
            if indexPath.row%3 == 0{
                cell.contentLabel?.text = "我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据"
            }
            else{
                cell.contentLabel?.text = "我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("第\(indexPath.row)行被点击了")
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//        num += 1
//        
//        print("\(num)")
//        
//        
//        self.label1.text! += self.label1.text!
//        self.label1.numberOfLines = 0
//        
////        if num%2 == 0  {
////            label1.snp.updateConstraints { (make) in
////                make.top.equalTo(self.view).offset(300)
////                make.centerX.equalTo(self.view);
////                make.width.equalTo(200);
////                make.height.equalTo(100);
////            }
////
////        }else{
////            label1.snp.updateConstraints { (make) in
////                make.top.equalTo(self.view).offset(200)
////                make.centerX.equalTo(self.view);
////                make.width.equalTo(200);
////                make.height.equalTo(100);
////            }
////
////        }
//    }
//
}

//extension MyViewController {
//    
//
//    fileprivate func setupUI(){
//        
//        self.view.backgroundColor = .white
//        
//        
//        self.view.addSubview(self.label1)
//        label1.backgroundColor = .red
//        label1.text = "这是一个很长的字符串只需要约束宽度即可,这里约束的最大宽度为屏幕宽度-50,事实上如果没有其他需求的话针对于一个label来说只需要确定一个位置,不需要大小就可以认定这是一个完整的"
//        label1.snp.makeConstraints { (make) in
//            make.top.equalTo(self.view).offset(100)
//            make.centerX.equalTo(self.view)
////            make.width.equalTo(200)
////            make.height.equalTo(100)
//            make.width.lessThanOrEqualTo(self.view).offset(-50)//只需要约束宽度即可,这里约束的最大宽度为屏幕宽度-50,事实上如果没有其他需求的话针对于一个label来说只需要确定一个位置,不需要大小就可以认定这是一个完整的约束.(此技能目前我只知道针对于UILabel,UIImageView,UIButton有效)
//            
//
//        }
//        
//
//    }
//}

