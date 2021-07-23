//
//  ViewController.swift
//  swfitCode
//
//  Created by 杜长金 on 2021/7/22.
//

import UIKit
import AVKit

var playView:UIView!
var player:AVPlayer!
var playerLabyer:AVPlayerLayer!
var playItem:AVPlayerItem!
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //播放视频
        playView = UIView.init(frame:UIScreen.main.bounds)
        view.addSubview(playView)
        playAV()
        // Do any additional setup after loading the view.
    }
    
    //视频初始化
    func playAV(){
        guard let moivePath = Bundle.main.path(forResource: "1242px×2688", ofType: "mp4")
        else { return }
        let url = NSURL(fileURLWithPath:moivePath)
        playItem = AVPlayerItem(url: url as URL)
        //监听播放完成
        NotificationCenter.default.addObserver(self, selector: #selector(playDidFinish), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: playItem)
        player = AVPlayer(playerItem: playItem)
        playerLabyer = AVPlayerLayer(player: player)
        playerLabyer.frame = UIScreen.main.bounds
        playerLabyer.videoGravity = AVLayerVideoGravity.resizeAspect
        playView.layer.addSublayer(playerLabyer)
        player.play()
    }
    
    //视频播放完毕
    @objc func playDidFinish() {
        player.seek(to: CMTime(value: 0, timescale: 1))
        player.play()
        print("1234567890")
    }
}

