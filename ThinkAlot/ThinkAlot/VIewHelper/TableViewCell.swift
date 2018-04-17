//
//  TableViewCell.swift
//  ThinkAlot
//
//  Created by xiang zhuo on 2018/4/16.
//  Copyright © 2018年 xiang zhuo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var descLb: UILabel!
    @IBOutlet weak var bgImageV: UIImageView!
    
    var idos: Idos?{
        didSet{
            guard let idos = idos else { return}
            titleLb.text = idos.name
            descLb.text = idos.shortDescription
            bgImageV.image = idos.image
        }
    }
}
