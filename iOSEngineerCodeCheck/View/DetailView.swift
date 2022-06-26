//
//  DetailView.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailView: UIView {

    @IBOutlet weak var ownerImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var watcherCountLabel: UILabel!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var issueCountLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)

        
            let nibName = "DetailView"

            // Bundleから読み込む場合はこちら
             let view = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView

            if let view = view {
                view.frame = self.bounds
                self.addSubview(view)
                
                //文字数に合わせてフォントサイズを調整
                titleLabel.adjustsFontSizeToFitWidth = true
                languageLabel.adjustsFontSizeToFitWidth = true
                
            
        }
    
    }
}
