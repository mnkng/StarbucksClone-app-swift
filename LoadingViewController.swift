//
//  LoadingViewController.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/07.
//

import SnapKit
import UIKit

class LoadingViewController: UIViewController {
    var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "img_logo")
        return logo
    }()

   override func viewDidLoad() {
       self.view.backgroundColor = UIColor(named: "green")
       super.viewDidLoad()
       view.addSubview(logoImageView)
       
       logoImageView.snp.makeConstraints {
           $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
           $0.height.equalTo(logoImageView.snp.width).multipliedBy(1.0)
           $0.center.equalTo(view.safeAreaLayoutGuide)
       }
        
    }

}
