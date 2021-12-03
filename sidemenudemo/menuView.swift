//
//  menuView.swift
//  sidemenudemo
//
//  Created by vignesh kumar c on 03/12/21.
//

import Foundation
import UIKit

protocol MenuListControllerDelegate {
    func didSelectItems(named: SideMenuItem)
}

enum SideMenuItem:String, CaseIterable {
    case home = "Home"
    case info = "Info"
    case settings = "Settings"
    case bin = "Recyclebin"
}

class MenuListController: UITableViewController {
    
    var delegate: MenuListControllerDelegate?
    
    let menuItems: [SideMenuItem]
    
    init(with menuItems: [SideMenuItem]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let darkColor = UIColor.purple
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
    
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selecteditem = menuItems[indexPath.row]
        delegate?.didSelectItems(named: selecteditem)

    }
}
