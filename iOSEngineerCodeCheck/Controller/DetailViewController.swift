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
    
    //ModelはDetailModelファイルで作成
    var detailModel = DetailModel()
    
    var rootVC: RootViewModel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.likeButton.addTarget(self, action: #selector(didTapLikeButton(_:)), for: .touchUpInside)
       
        detailModel.judgeLikeRepository(button: detailView.likeButton)
        detailModel.showDetail(view: detailView, rootVC: rootVC)
        detailModel.getOwner(view: detailView)
    }
    
    @objc func didTapLikeButton(_ sender: UIButton) {
        
        
    }
    
    
}

