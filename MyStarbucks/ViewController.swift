//
//  ViewController.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/07.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        scrollView.delegate = self
        super.viewDidLoad()
        initView()
        initConstraint()
    }
    private let headerview : UIView = {
        let view = UIView()
        return view
    }()
    private let eFrequencyButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "eFrequencyImg"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(modalPresent(_:)), for: .touchUpInside)
        return btn
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
    private let scrollView : UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.alwaysBounceVertical = true
        scrollview.showsVerticalScrollIndicator = true
//        scrollview.backgroundColor = .yellow
        return scrollview
    }()
    private let stackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical //vertical stackview
        stackview.alignment = .fill//
        stackview.distribution = .equalSpacing//
        stackview.spacing = 10
        stackview.isLayoutMarginsRelativeArrangement = true//이 값이 true로 지정되어 있어야 StackView의 arranged view들이 지정된 margin의 값을 따른다고 함
        stackview.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)//
//        stackview.backgroundColor = .purple
        return stackview
    }()

    private let HomeNavigationBar: UINavigationBar = {
        let navigationbar = UINavigationBar()
        navigationbar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = .none // 경계선 나와라!
        navigationbar.shadowImage = UIImage() // 경계선 없애기
        let navItem = UINavigationItem()
        let nextVC = eFrequencyModalViewController()
//        self.navigationController?.pushViewController(nextVC, animated: true)
//        navigationbar.pushViewController(nextVC, animated: true)
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
//                self.navigationController?.pushViewController(nextVC, animated: true)
        let leftItem = UIBarButtonItem(image: UIImage(named: "what'snew"), style: .plain , target: self, action: #selector(leftButtonPressed(_:)))
//        btn.addTarget(self, action: #selector(modalPresent(_:)), for: .touchUpInside)
        let rightItem = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain , target: nil, action: nil)
        navigationbar.tintColor = .lightGray
        navItem.leftBarButtonItem = leftItem
        navItem.rightBarButtonItem = rightItem
        navigationbar.setItems([navItem], animated: false)
        return navigationbar
    }()
    
    private let greetingImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "greetingImg")
        return imageview
    }()
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text="안녕하세요.\n스타벅스입니다."
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.setLineSpacing(spacing: 7.0)
        return label
    }()
    
    private let greetingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
                /// shadow의 투명도 (0 ~ 1)
        view.layer.shadowOpacity = 0.2
                /// shadow의 corner radius
        view.layer.shadowRadius = 4
        return view
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text="스타벅스 리워드\n회원 신규가입 첫 구매 시,\n무료음료 혜택을 드려요!"
        label.setLineSpacing(spacing: 5.0)
        label.font = UIFont.systemFont(ofSize:16)
        label.numberOfLines = 0
        return label
    }()
    
    private let signUpButton: CornerButton = {
        let btn = CornerButton()
        btn.backgroundColor = UIColor(named: "green")
        btn.titleEdgeInsets = UIEdgeInsets(top:2 ,left: 20, bottom:2,right: 20)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("회원 가입", for: .normal)
        return btn
    }()
    
    private let logInButton: CornerButton = {
        let btn = CornerButton()
        btn.addTarget(self, action: #selector(logInButtonPressed(_:)), for: .touchUpInside)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(named: "green"), for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top:2 ,left: 20, bottom:2,right: 20)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //테두리 굵기
        btn.layer.borderWidth = 1
        //테두리 색상
        btn.layer.borderColor = UIColor(named: "green")?.cgColor
        btn.setTitle("로그인", for: .normal)
        return btn
    }()
    private let whatsnewLabel : UILabel = {
        let label = UILabel()
        label.text="What's New"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    private let seeallButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(named: "green"), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //테두리 굵기
        btn.setTitle("See all", for: .normal)
        return btn
    }()
    private let whatsnewView : UIView = {
        let view = UIView()
        return view
    }()
    private let horizontalScrollView : UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.alwaysBounceHorizontal = true
        scrollview.showsHorizontalScrollIndicator = false
//        scrollview.backgroundColor = .yellow
        return scrollview
    }()
    private let horizontalStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal //vertical stackview
        stackview.alignment = .fill//
        stackview.distribution = .equalSpacing//
        stackview.spacing = 20
        stackview.isLayoutMarginsRelativeArrangement = true//이 값이 true로 지정되어 있어야 StackView의 arranged view들이 지정된 margin의 값을 따른다고 함
        stackview.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)//
//        stackview.backgroundColor = .purple
        return stackview
    }()
    
    private let whatsnewImageView1: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "whatsnew1")
        return imageview
    }()
    private let whatsnewImageView2: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "whatsnew2")
        return imageview
    }()
    
    @objc func modalPresent(_ sender: UIButton) {
        //present 방식
        let vc = eFrequencyModalViewController() //modalTransitionStyle은 원하는 거 선택 <- 검색해서 찾아보세요~
        //modalPresentationStyle의 다양한 방식이 있으니 검색 ㄱㄱ
//        svc.modalPresentationStyle = .fullScreen
//            let newVC = self.storyboard?.instantiateViewController(identifier: "modalView")
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    @objc func leftButtonPressed (_ : UIButton) {
        let nextVC = WhatsNewViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func logInButtonPressed (_ : UIButton) {
        let nextVC = LogInViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    
    private func initView(){
        view.addSubview(headerview)
        headerview.addSubview(greetingView)
        headerview.addSubview(greetingLabel)
        greetingView.addSubview(greetingImageView)
        greetingView.addSubview(logInButton)
        greetingView.addSubview(signUpLabel)
        greetingView.addSubview(signUpButton)
        view.addSubview(HomeNavigationBar)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        [eFrequencyButton, event1ImageView, event2ImageView, event3ImageView, event4ImageView].map {
            stackView.addArrangedSubview($0)
        }
        stackView.addArrangedSubview(whatsnewView)
        whatsnewView.addSubview(whatsnewLabel)
        whatsnewView.addSubview(seeallButton)
        stackView.addArrangedSubview(horizontalScrollView)
        horizontalScrollView.addSubview(horizontalStackView)
        [whatsnewImageView1,whatsnewImageView2].map {
            horizontalStackView.addArrangedSubview($0)
        }
        stackView.addArrangedSubview(event5ImageView)
    }
    private func initConstraint(){
        whatsnewLabel.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview().inset(20)
        }
        seeallButton.snp.makeConstraints{
            $0.centerY.equalTo(whatsnewLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        horizontalStackView.snp.makeConstraints{
            $0.edges.height.equalTo(horizontalScrollView)
        }
        headerview.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(HomeNavigationBar.snp.top).offset(-5)
        }
        stackView.snp.makeConstraints{
            $0.edges.width.equalTo(scrollView)
        }
        scrollView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(HomeNavigationBar.snp.bottom).offset(5)
        }
        HomeNavigationBar.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
        }
        greetingImageView.snp.makeConstraints{
            $0.width.equalToSuperview().multipliedBy(0.3)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(greetingImageView.snp.width).multipliedBy(1.0)
            $0.centerY.equalToSuperview()
        }
        greetingLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview().inset(30)
        }
        greetingView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.topMargin.equalTo(greetingLabel.snp.bottom).offset(30)
            $0.bottom.equalToSuperview()
            
        }
        signUpLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.top.trailing.equalToSuperview().inset(30)
        }
        signUpButton.snp.makeConstraints{
            $0.top.equalTo(signUpLabel.snp.bottom).offset(20)
            $0.leading.equalTo(signUpLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(35)
        }
        logInButton.snp.makeConstraints{
            $0.top.equalTo(signUpLabel.snp.bottom).offset(20)
            $0.leading.equalTo(signUpButton.snp.trailing).offset(10)
            $0.bottom.equalTo(signUpButton.snp.bottom)
        }
    }

}
extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

extension UILabel {
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length))
        attributedText = attributeString
    }
}
