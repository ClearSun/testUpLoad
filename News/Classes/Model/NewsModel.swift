//
//  NewsModel.swift
//  News
//
//  Created by 瑞宁科技02 on 2017/8/4.
//  Copyright © 2017年 reining. All rights reserved.
//

import UIKit

class NewsModel: NSObject {

    // 属性
    var replyCount: Int = 0
    var title  : String = ""
    var source : String = ""
    var imgsrc : String = ""
    
    // 定义一个字典转模型的构造函数
    init(dict: [String : Any]) {
        
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
