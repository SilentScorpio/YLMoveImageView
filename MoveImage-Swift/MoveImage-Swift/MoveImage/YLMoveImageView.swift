//
//  YLMoveImageView.swift
//  MoveImage-Swift
//
//  Created by WolfCub on 2018/9/6.
//  Copyright © 2018年 WolfCub. All rights reserved.
//

import UIKit
import SDWebImage

class YLMoveImageView: UIView {

    public
    var imageDefault:UIImage? = nil
    var _image_url:String?
    var _image_offset:CGFloat?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image_url:String? {
        
        get {
            
            return _image_url
        }
        
        set(image_url) {
            
            _image_url = image_url
            
            if !((_image_url?.isEmpty)!) {
                
                self.m_imageView.sd_setImage(with: NSURL.init(string: _image_url!)! as URL, placeholderImage: self.imageDefault, options: SDWebImageOptions.delayPlaceholder, completed: nil)
            }

        }
    }
    
    var image_offset:CGFloat? {
        
        get {
            
            return _image_offset
        }
        
        set(image_offset) {
            
            _image_offset = image_offset
            
            var new_y = -(_image_offset!/2.0);
            
            if new_y > 0 {
                
                new_y = 0
                
            }  else if new_y  < self.frame.height - self.m_imageView.frame.height {
                
                new_y = self.frame.height - self.m_imageView.frame.height
            }
            
            self.m_imageView.frame = CGRect.init(x: 0, y: new_y, width: self.m_imageView.frame.size.width, height: self.m_imageView.frame.size.height)
        }
    }
    
    private
    func setupView() {
        
        self.clipsToBounds = true
        self.contentMode = UIViewContentMode.scaleAspectFill
        
        self.addSubview(self.m_imageView)
    }
    
    override func layoutSubviews() {
        
        if (self.imageDefault != nil) {
            
            self.m_imageView.image = self.imageDefault
            
            self.m_imageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height:(self.imageDefault?.size.height)!*(self.frame.size.width/(self.imageDefault?.size.width)!) )
            
        } else {
            
            self.m_imageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height:self.frame.size.height*1.5)
        }
    }
    
    lazy var m_imageView = { () -> UIImageView in
        
       let imageview = UIImageView.init()
        imageview.contentMode = UIViewContentMode.scaleAspectFill
        return imageview
    }()
    
}
