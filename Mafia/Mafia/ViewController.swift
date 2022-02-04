//
//  ViewController.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/6/22.
//

import UIKit
import SwiftUI

class MafiaHostingViewController <Content>: UIHostingController<AnyView> where Content : View {

  public init(shouldShowNavigationBar: Bool, rootView: Content) {
      super.init(rootView: AnyView(rootView.navigationBarHidden(!shouldShowNavigationBar)))
  }

  @objc required dynamic init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

//Loading Screen View Controller
class ViewController: UIViewController {
    
    let contentView = MafiaHostingViewController(shouldShowNavigationBar: false, rootView: MafiaMainScreen())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let controller = UIHostingController(rootView: MafiaMainScreen())
//        controller.view.translatesAutoresizingMaskIntoConstraints = false
//        self.addChild(controller)
//        self.view.addSubview(controller.view)
//        controller.didMove(toParent: self)
//        NSLayoutConstraint.activate([
//                        controller.view.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//                           controller.view.heightAnchor.constraint(equalTo: self.view.heightAnchor),
//                           controller.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//                           controller.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//                           ])
        
        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
    }
    
    
    fileprivate func setupConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.view.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        
        contentView.view.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        contentView.view.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        
        contentView.view.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
    }


}

