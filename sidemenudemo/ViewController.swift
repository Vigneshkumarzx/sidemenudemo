//
//  ViewController.swift
//  sidemenudemo
//
//  Created by vignesh kumar c on 02/12/21.
//

import SideMenu

import UIKit

class ViewController: UIViewController, MenuListControllerDelegate, UINavigationControllerDelegate {
    
    var menu: SideMenuNavigationController?
    
    private let settingsController = SettingsViewController()
    private let infoController = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = MenuListController(with: SideMenuItem.allCases)
        list.delegate = self
        menu = SideMenuNavigationController(rootViewController: list)
        menu?.leftSide = true
        list.delegate = self
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        addChildController()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
       present(menu!, animated: true)
      
    }
    
    private func addChildController() {
        addChild(settingsController)
        addChild(infoController)
        view.addSubview(settingsController.view)
        view.addSubview(infoController.view)
        settingsController.view.frame = view.bounds
        infoController.view.frame = view.bounds
        settingsController.didMove(toParent: self)
        infoController.didMove(toParent: self)
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
    }
    
    func didSelectItems(named: SideMenuItem) {
        menu?.dismiss(animated: true, completion: nil)
        
            self.title = named.rawValue
            
            switch named {
            case .home:
                settingsController.view.isHidden = true
               infoController.view.isHidden = true
            case .info:
                settingsController.view.isHidden = true
               infoController.view.isHidden = false
            case .settings:
               settingsController.view.isHidden = false
               infoController.view.isHidden = true
            case .bin:
                self.view.backgroundColor = .brown
            }

            }
        }
    

