//
//  LikeView.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/27.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

class LikeView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)

        
            let nibName = "LikeView"

            // Bundleから読み込む場合はこちら
             let view = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView

            if let view = view {
                view.frame = self.bounds
                self.addSubview(view)
        }
    }
    

}
