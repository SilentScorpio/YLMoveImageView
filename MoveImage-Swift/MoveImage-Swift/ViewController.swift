//
//  ViewController.swift
//  MoveImage-Swift
//
//  Created by WolfCub on 2018/9/6.
//  Copyright © 2018年 WolfCub. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var m_scrollView: UIScrollView!
    
    var m_moveImage:YLMoveImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupView() {
        
        self.m_moveImage = YLMoveImageView.init(frame: CGRect.init(x: 0, y: self.view.frame.maxY*0.7, width: self.view.frame.width, height: 150))
        
        self.m_moveImage!.imageDefault = UIImage.init(named: "dog.jpeg")
        self.m_moveImage!.image_url = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536213492635&di=e4024ce8aa1b0ae90ca5c4e649d57fca&imgtype=0&src=http%3A%2F%2Fimg17.3lian.com%2Fd%2Ffile%2F201702%2F08%2F4972db13f75df2df2446259945029d0d.jpg"
        self.m_moveImage?.setupView()
        self.m_scrollView.addSubview(self.m_moveImage!)
        self.m_scrollView.contentSize = CGSize.init(width: self.view.frame.width, height: self.view.frame.height*1.5)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.m_moveImage!.image_offset = scrollView.contentOffset.y
    }
}

