//
//  NewsViewCell.swift
//  News
//
//  Created by 瑞宁科技02 on 2017/8/4.
//  Copyright © 2017年 reining. All rights reserved.
//

import UIKit
import Kingfisher
class NewsViewCell: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView!

//控件属性
    
    @IBOutlet weak var replyCount: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    // 模型
    var newModel : NewsModel?{
        didSet{
            titleLabel.text = newModel?.title
            sourceLabel.text = newModel?.source
            let iconUrl = URL(string: newModel?.imgsrc ?? "")
            
            iconImage.kf.setImage(with: iconUrl)
            replyCount.text = "\(newModel?.replyCount ?? 0)跟帖"
        }
    }
    
}
