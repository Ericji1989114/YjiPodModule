//
//  ViewController.swift
//  TestProject
//
//  Created by Eric JI on 2019/08/19.
//  Copyright © 2019 Eric JI. All rights reserved.
//

import UIKit
import YjiPodModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        "Eric".hash(by: .md5)
        
        let bundle = Bundle(for: YjiTestViewController.self)
        let path = bundle.path(forResource: "YjiPodModule", ofType: "bundle")
        let resource = Bundle(path: path!)
        
        let image = UIImage(named: "test", in: resource, compatibleWith: nil)
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        imageView.image = image
        self.view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        button.setTitle("Test", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(self.test), for: .touchUpInside)
        button.center = self.view.center
        self.view.addSubview(button)
    }
    
    @objc func test() {
        let bundle = Bundle(for: YjiTestViewController.self)
        let path = bundle.path(forResource: "YjiPodModule", ofType: "bundle")
        let resource = Bundle(path: path!)
        let storyboard = UIStoryboard(name: "MyStoryboard", bundle: resource)
        let vc = storyboard.instantiateInitialViewController()
        self.present(vc!, animated: true)
    }


}

