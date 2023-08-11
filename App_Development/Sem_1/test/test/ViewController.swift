import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate{
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        var url = "https://oauth.vk.com/authorize?client_id= 51726616&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token"
        guard let url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        else {return}
        guard let url = URL(string: url) else {return}
        self.webView.load(URLRequest(url: url))
    }
}
