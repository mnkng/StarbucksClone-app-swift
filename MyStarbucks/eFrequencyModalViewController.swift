//
//  eFrequencyModalViewController.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/09.
//

import UIKit
import SnapKit

class eFrequencyModalViewController: UIViewController {

    override func viewDidLoad() {
//        self.view.backgroundColor = UIColor.black
//        self.view.alpha = 0.3
        super.viewDidLoad()
        initView()
        initConstraint()
        // Do any additional setup  after loading the view.
    }
    private let backgroundview : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        return view
    }()
    private let notiView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    private let logInButton: CornerButton = {
        let btn = CornerButton()
        btn.backgroundColor = UIColor(named: "green")
        btn.titleEdgeInsets = UIEdgeInsets(top:2 ,left: 20, bottom:2,right: 20)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("로그인", for: .normal)
        return btn
    }()
    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.text="[프리퀀시] 서비스는 로그인 후에 이용하실 수 있습니다"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.setLineSpacing(spacing: 5.0)
        return label
    }()
    private let dismissButton: CornerButton = {
        let btn = CornerButton()
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(named: "green"), for: .normal)
        btn.addTarget(self, action: #selector(touchUpDismissModalButton(_:)), for: .touchUpInside)
        btn.titleEdgeInsets = UIEdgeInsets(top:2 ,left: 20, bottom:2,right: 20)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //테두리 굵기
        btn.layer.borderWidth = 1
        //테두리 색상
        btn.layer.borderColor = UIColor(named: "green")?.cgColor
        btn.setTitle("닫기", for: .normal)
        return btn
    }()
    @objc
    func touchUpDismissModalButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func initView(){
        view.addSubview(backgroundview)
        view.addSubview(notiView)
        notiView.addSubview(notificationLabel)
        notiView.addSubview(logInButton)
        notiView.addSubview(dismissButton)
        }
    private func initConstraint(){
        backgroundview.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        notiView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(180)
        }
        notificationLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview().offset(-20)
        }
        logInButton.snp.makeConstraints{
            $0.centerY.equalToSuperview().offset(40)
            $0.trailing.equalTo(notificationLabel).inset(10)
        }
        dismissButton.snp.makeConstraints{
            $0.centerY.equalToSuperview().offset(40)
            $0.trailing.equalTo(logInButton.snp.leading).offset(-20)
        }
    }
}
