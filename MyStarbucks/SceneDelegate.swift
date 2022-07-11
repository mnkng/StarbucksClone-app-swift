//
//  SceneDelegate.swift
//  MyStarbucks
//
//  Created by 이민경 on 2022/07/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var imageView: UIImageView?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
        let tabBarController = UITabBarController()

        // Tab 1 - Home
        let homeVC = ViewController()
        let homeTabNav = UINavigationController(rootViewController: homeVC)
//        let item1 = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let item1 = UITabBarItem(title: "Home",image: UIImage(named: "home"), tag: 0)
        homeTabNav.tabBarItem = item1
        let tabBar: UITabBar = tabBarController.tabBar
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .white
//                    ///선택되었을 때 타이틀 컬러
        tabBar.tintColor =  UIColor(named: "green")
                    ///선택안된거 타이틀 컬러
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.isHidden = false
        let payVC = PayViewController()
        let payTabNav = UINavigationController(rootViewController: payVC)
        let item2 = UITabBarItem(title: "Pay",image: UIImage(named: "pay"), tag: 1)
        payTabNav.tabBarItem = item2
        let orderVC = OrderViewController()
        let orderTabNav = UINavigationController(rootViewController: orderVC)
        let item3 = UITabBarItem(title: "Order",image: UIImage(named: "order"), tag: 2)
        orderTabNav.tabBarItem = item3
        let giftVC = GiftViewController()
        let giftTabNav = UINavigationController(rootViewController: giftVC)
        let item4 = UITabBarItem(title: "Gift",image: UIImage(named: "gift"), tag: 3)
        giftTabNav.tabBarItem = item4
        let otherVC = OtherViewController()
        let otherTabNav = UINavigationController(rootViewController: otherVC)
        let item5 = UITabBarItem(title: "Other",image: UIImage(named: "other"), tag: 4)
        otherTabNav.tabBarItem = item5

        tabBarController.viewControllers = [homeTabNav, payTabNav, orderTabNav, giftTabNav, otherTabNav]
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
      }

    func sceneDidDisconnect(_ scene: UIScene) {
    // 시스템에 의해서 scene이 해제되면 호출이된다. Scene이 background에 들어간 직후나 session이 삭제되었을 때 호출된다. 다음 번에 해당 scene에 연결되는 경우에 새로 생성되는 자료들과 관련된 모든 자료들을 해제해준다.Session이 반드시 삭제되는 것은 아니므로 scene은 나중에 다시 연결될 수도 있다.
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
//     Scene이 활성화 되었고 현재 사용자 이벤트에 응답하고 있음을 알린다.인터페이스를 로드 한 후 인터페이스가 화면에 표시되기 전에 호출된다
        if let imageView = imageView {
                    imageView.removeFromSuperview()
        }
        
    }
    func sceneWillResignActive(_ scene: UIScene) {
    // Scene이 활성상태를 해제하고 사용자 이벤트에 대한 응답을 중지하려고 함을 알린다.시스템 경고를 표시 할 때와 같은 일시적인 중단을 위해 이 메서드를 호출한다이 메서드가 반환 될 때까지 앱은 백그라운드 또는 포그라운드로 다시 전환되기를 기다리는 동안 최소한의 작업을 수행해야 한다.
        guard let window = window else { return }
                imageView = UIImageView(frame: window.frame)
                imageView?.image = UIImage(named: "image")
                window.addSubview(imageView!)
            if #available(iOS 10.0, *) {  // UserNotification 프레임워크를 이용한 로컬 알림 (iOS 10 이상)
                // 알림 동의 여부를 확인
                UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == .authorized {
                        // 알림 콘텐츠 객체
                        let nContent = UNMutableNotificationContent()
                        nContent.badge = 1
                        nContent.title = "로컬 알림 메시지"
                        nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요!!"
                        nContent.body = "앗! 왜 나갔어요??? 어서 들어오세요!!"
                        nContent.sound = .default
                        nContent.userInfo = ["name": "홍길동"]
                            
                        // 알림 발생 조건 객체
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                            
                        // 알림 요청 객체
                        let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                            
                        // 노티피케이션 센터에 추가
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    } else {
                        print("사용자가 알림을 동의하지 않음!!!")
                    }
                }
            }
        }
    func sceneWillEnterForeground(_ scene: UIScene) {
    // scene이 foreground에서 실행되고, 사용자에게 표시 될 것임을 delegate에게 알립니다.이 전환은 새로 생성되고 연결된 scene뿐만아니라 background에서 실행 중이고, 시스템 또는 사용자 작업에 의해 background로 가져온 scene 모두에 대해 발생합니다.scene이 화면에 표시되기 위해 foreground에 들어가므로 이 메서드는 항상 sceneDidBecomeActive (_ :) 메서드를 호출합니다.
        
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
    // Scene이 background에서 실행되고 더 이상 화면에 표시되지 않음을 Delegate에게 알립니다.이 방법을 사용하여, scene의 메모리 사용량을 줄이고, 공유 리소스를 확보하며, scene의 사용자 인터페이스를 정리합니다.이 메서드가 반환 된 직후 UIKit은 앱 전환기에 표시하기 위해 Scene의 인터페이스의 스냅 샷을 찍습니다.
    }

}



