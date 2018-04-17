//
//  NxtViewController.swift
//  ThinkAlot
//
//  Created by xiang zhuo on 2018/4/16.
//  Copyright © 2018年 xiang zhuo. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate {
    func modalViewControllerDidClickedDismissButton(vc: NxtViewController)
}

class NxtViewController: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    var delegate: ModalViewControllerDelegate!
    var ido: Idos!
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var descLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageV.image = ido.image
        titleLb.text = ido.name
        descLb.text = ido.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClickes(_ sender: Any) {
        if let delegate = delegate{
            delegate.modalViewControllerDidClickedDismissButton(vc: self)
        }
    }
}
