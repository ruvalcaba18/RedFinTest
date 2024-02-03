//
//  ViewController.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        let button = UIButton()
        button.setTitle("Enter to Food Truck app ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.addTarget(self, action: #selector(goToFramework), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.layer.cornerRadius = 10
    }

    @IBAction func goToFramework(){
        let vc = MainViewRouter.createMainView()
        self.navigationController?.modalPresentationStyle = .popover
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


