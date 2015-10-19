//
//  ViewController.swift
//  socialTest
//
//  Created by Masaki Horimoto on 2015/10/19.
//  Copyright © 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    var capturedImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        capturedImage = GetImage() as UIImage     // キャプチャ画像を取得.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    スクリーンキャプチャ用関数
    
    :returns: UIImage
    */
    func GetImage() -> UIImage {
        
        // キャプチャする範囲を取得.
        let rect = self.view.bounds
        
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        
        // 対象のview内の描画をcontextに複写する.
        self.view.layer.renderInContext(context)
        
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }

    @IBAction func pressTwitter(sender: AnyObject) {
        
        //Tweet用のViewを作成する
        let twitterPostView:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        
        let tweetDescription1:String = "hogehoge"
        let tweetDescription2:String = "Masaki Horimotoの開発したアプリを宜しくお願いします！！"
        let tweetURL:NSURL = NSURL(string: "https://itunes.apple.com/jp/developer/masaki-horimoto/id1018825942")!

        //Tweetする文章を設定する
        twitterPostView.setInitialText("\(tweetDescription1)\n\(tweetDescription2)")

        //Tweetに添付するURLを設定する
        twitterPostView.addURL(tweetURL)
        
        //起動時にキャプチャしたスクリーンショットを添付する
        twitterPostView.addImage(capturedImage)

        //上述の内容を反映したTweet画面を表示する
        self.presentViewController(twitterPostView, animated: true, completion: nil)
    }

    @IBAction func pressFacebook(sender: AnyObject) {

        //Facebookシェア用のViewを作成する
        let facebookPostView:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        
        let facebookDescription1:String = "hogehoge"
        let facebookDescription2:String = "Masaki Horimotoの開発したアプリを宜しくお願いします！！"
        let facebookURL:NSURL = NSURL(string: "https://itunes.apple.com/us/app/shootspeed-get-high-score!/id1029309778?l=ja&ls=1&mt=8")!
        
        //シェアする文章を設定する
        facebookPostView.setInitialText("\(facebookDescription1)\n\(facebookDescription2)")

        //シェアに添付するURLを設定する
        facebookPostView.addURL(facebookURL)
        
        //起動時にキャプチャしたスクリーンショットを添付する
        facebookPostView.addImage(capturedImage)

        //上述の内容を反映したfacebookシェア画面を表示する
        self.presentViewController(facebookPostView, animated: true, completion: nil)
        
    }

}

