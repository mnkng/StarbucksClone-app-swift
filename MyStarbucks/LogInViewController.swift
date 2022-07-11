//
//  LogInViewController.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/10.
//

import UIKit

class LogInViewController: UIViewController {
    var id : String?
    var pwd : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        super.viewDidLoad()
        initView()
        initConstraint()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
//        let alert = UIAlertController(title: "화면에서 나가시겠습니까?", message: "작성된 내용은 저장되지 않습니다", preferredStyle: UIAlertController.Style.alert)
//        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
//                    self.navigationController?.popViewController(animated: true)
//                        }
//        alert.addAction(okAction)
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action) in
//
//        }
//        alert.addAction(cancelAction)
//        self.present(alert, animated: false, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    private let borderView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let borderView1 : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let idTextField : UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "아이디"
        textfield.becomeFirstResponder()
        return textfield
    }()
    private let passwordTextField : UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "비밀번호"
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let NavigationBar: UINavigationBar = {
        let navigationbar = UINavigationBar()
        navigationbar.setBackgroundImage(UIImage(), for: .default)
        navigationbar.shadowImage = .none // 경계선 나와라!
        let navItem = UINavigationItem(title: "로그인")
        navItem.backButtonTitle = ""
        navigationbar.tintColor = .lightGray
        let leftItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain , target: self, action: #selector(backButtonPressed(_:)))
        navItem.leftBarButtonItem = leftItem
        navigationbar.setItems([navItem], animated: false)
        return navigationbar
    }()

    private let greetingImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "greetingImg")
        return imageview
    }()
    private let event1ImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.image = UIImage(named: "event1")
        imageview.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageview.layer.shadowOpacity = 0.2
        imageview.layer.shadowRadius = 5
        return imageview
    }()
    private let event2ImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.image = UIImage(named: "event2")
        imageview.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageview.layer.shadowOpacity = 0.2
        imageview.layer.shadowRadius = 5
        return imageview
    }()
    private let event3ImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "event3")
        imageview.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageview.layer.shadowOpacity = 0.2
        imageview.layer.shadowRadius = 5
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    private let event4ImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "event4")
        imageview.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageview.layer.shadowOpacity = 0.2
        imageview.layer.shadowRadius = 5
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    private let event5ImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "event5")
        imageview.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageview.layer.shadowOpacity = 0.2
        imageview.layer.shadowRadius = 5
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    @objc func backButtonPressed(_: UIButton){
        let alert = UIAlertController(title: "이 페이지에서 나가시겠습니까?", message: "변경사항이 저장되지 않을 수 있습니다", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
                }
        alert.addAction(okAction)
        self.present(alert, animated: false, completion: nil)
    }
    
    
    private func initView(){
        view.addSubview(NavigationBar)
        view.addSubview(idTextField)
        view.addSubview(borderView)
        view.addSubview(passwordTextField)
        view.addSubview(borderView1)
        
        
    }
    private func initConstraint(){
    
        NavigationBar.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        idTextField.snp.makeConstraints{
            $0.centerY.equalToSuperview().offset(-40)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        borderView.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(idTextField)
            $0.top.equalTo(idTextField.snp.bottom).offset(5)
        }
        passwordTextField.snp.makeConstraints{
            $0.centerY.equalToSuperview().offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        borderView1.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(passwordTextField)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(5)
        }
    }
}

