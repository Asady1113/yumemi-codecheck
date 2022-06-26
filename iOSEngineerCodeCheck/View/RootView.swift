//
//  RootView.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

class RootView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)

        
            let nibName = "RootView"

            // Bundleから読み込む場合はこちら
             let view = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView

            if let view = view {
                view.frame = self.bounds
                self.addSubview(view)
                
                //検索時の文頭を小文字に
                searchBar.autocapitalizationType = .none
                
        }
    
    }
    

}
