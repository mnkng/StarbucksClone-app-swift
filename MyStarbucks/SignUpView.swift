//
//  SignUpView.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/07.
//

import UIKit
import SnapKit
import Foundation

class SignUpView: UIView {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "pencil")
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
