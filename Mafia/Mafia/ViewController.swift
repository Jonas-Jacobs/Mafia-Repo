//
//  ViewController.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/6/22.
//

import UIKit
import SwiftUI

//Loading Screen View Controller
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let controller = UIHostingController(rootView: MafiaMainScreen())
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(controller)
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        NSLayoutConstraint.activate([
                        controller.view.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                           controller.view.heightAnchor.constraint(equalTo: self.view.heightAnchor),
                           controller.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                           controller.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                           ])
    }
    
    
    


}

