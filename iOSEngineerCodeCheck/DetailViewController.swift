//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //UIはDetailViewファイルで作成
    @IBOutlet weak var detailView: DetailView!
    var detailModel = DetailModel()
    
    var rootVC: RootViewController!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailModel.showDetail(view: detailView, rootVC: rootVC)
        detailModel.getOwner(view: detailView)
    }
    
    
    
}

