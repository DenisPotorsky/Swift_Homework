//
//  ViewController.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import UIKit
import WebKit
   // .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
class ViewController: UIViewController{
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    } ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=51726616&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token") else {
        return
        }
        let urlRequest = URLRequest(url: url)
        self.webView.load(urlRequest)
        
    }
    private func setupViews() {
        view.addSubview(webView)
    }
    private func tap(){
        let friendsTabController = UINavigationController(rootViewController: FriendsViewController())
                let photosTabController = UINavigationController(rootViewController: PhotoViewController(collectionViewLayout: UICollectionViewFlowLayout()))
                let groupsTabController = UINavigationController(rootViewController: GroupsViewController())
                friendsTabController.tabBarItem.title = "Friends"
                groupsTabController.tabBarItem.title = "Groups"
                photosTabController.tabBarItem.title = "Photos"
                let controllers = [friendsTabController, groupsTabController, photosTabController]
                let newTabController = UITabBarController()
                newTabController.viewControllers = controllers
                //self.navigationController?.pushViewController(newTabController, animated: true)
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else { return }
        firstWindow.rootViewController = newTabController
        
    }
}
extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map{ $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        print(params["access_token"]!)
        print(params["user_id"]!)
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }
}
