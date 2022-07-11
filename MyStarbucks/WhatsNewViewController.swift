//
//  What'sNewViewController.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/10.
//

import UIKit

class WhatsNewViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        initView()
        initConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "ERROR", message: "아직 새로운 이벤트가 없습니다!", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    
                }
        alert.addAction(okAction)
        self.present(alert, animated: false, completion: nil)
               
        
    }
    private let NavigationBar: UINavigationBar = {
        let navigationbar = UINavigationBar()
        navigationbar.setBackgroundImage(UIImage(), for: .default)
        navigationbar.prefersLargeTitles = true
        navigationbar.shadowImage = .none // 경계선 나와라!
        let navItem = UINavigationItem(title: "What's New")
        navItem.backButtonTitle = ""
        navigationbar.tintColor = .lightGray
        let leftItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain , target: self, action: #selector(backButtonPressed(_:)))
        navItem.leftBarButtonItem = leftItem
        navigationbar.setItems([navItem], animated: false)
        return navigationbar
    }()
    @objc func backButtonPressed(_: UIButton){
        navigationController?.popViewController(animated: true)
    }
    private func initView(){
        view.addSubview(NavigationBar)
    }
    private func initConstraint(){
        NavigationBar.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
