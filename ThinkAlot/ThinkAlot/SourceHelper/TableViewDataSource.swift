//
//  TableViewDataSource.swift
//  ThinkAlot
//
//  Created by xiang zhuo on 2018/4/16.
//  Copyright © 2018年 xiang zhuo. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {

    var todos: [Idos]
    
    init(todos: [Idos]) {
        self.todos = todos
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.idos = todos[indexPath.row]
        return cell
    }
}
