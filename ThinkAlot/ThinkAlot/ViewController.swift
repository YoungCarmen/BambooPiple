//
//  ViewController.swift
//  ThinkAlot
//
//  Created by xiang zhuo on 2018/4/16.
//  Copyright © 2018年 xiang zhuo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, ModalViewControllerDelegate, UIViewControllerTransitioningDelegate{

    var presentAnimation: BouncePresentAnimation!
    var dataSource = TableViewDataSource(todos: [])
    var cellFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        presentAnimation = BouncePresentAnimation(start: CGRect.zero, end: UIScreen.main.bounds, isPositive: false)
        
        dataSource.todos = IdosStore.shared.idos
        self.tableView.dataSource = dataSource
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellFrame = tableView.convert(tableView.rectForRow(at: indexPath), to: tableView.superview)
        self.cellFrame = cellFrame
        let vc = storyboard?.instantiateViewController(withIdentifier: "NxtViewController") as! NxtViewController
        vc.delegate = self
        vc.transitioningDelegate = self
        presentAnimation.isPositive = false
        presentAnimation.startFrame = cellFrame
        presentAnimation.finalFrame = UIScreen.main.bounds
        vc.ido = dataSource.todos[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController{
    func modalViewControllerDidClickedDismissButton(vc: NxtViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewController{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return presentAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        presentAnimation.finalFrame = cellFrame
        presentAnimation.startFrame = UIScreen.main.bounds
        presentAnimation.isPositive = true
        return presentAnimation
    }
}
