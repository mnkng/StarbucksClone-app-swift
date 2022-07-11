//
//  CornerButton.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/07.
//

import UIKit
import SnapKit

class CornerButton: UIButton {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width + contentEdgeInsets.left + contentEdgeInsets.right + titleEdgeInsets.left + titleEdgeInsets.right,
                      height: super.intrinsicContentSize.height + contentEdgeInsets.top + contentEdgeInsets.bottom + titleEdgeInsets.top
                        + titleEdgeInsets.bottom )
    }
    
}
