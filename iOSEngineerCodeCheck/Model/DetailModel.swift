//
//  DetailModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import UIKit
import KRProgressHUD

class DetailModel {
    
    var searchTask: URLSessionTask?
    
    var repository: Repository!
    
    
    func showDetail(view: DetailView,rootVC: RootViewModel) {
        //RootViewControllerで選択されたrepositoryを代入
        repository = rootVC.repositoryArray[rootVC.selectedIndex!]
        

        view.languageLabel.text = "Written in \(repository.language)"
        view.starsCountLabel.text = "\(repository.stargazersCount) stars"
        view.watcherCountLabel.text = "\(repository.watchersCount) watchers"
        view.forkCountLabel.text = "\(repository.forksCount) forks"
        view.issueCountLabel.text = "\(repository.issuesCount) open issues"
    }
    
    
    
    //オーナーを取得
    func getOwner(view: DetailView) {
        
        view.titleLabel.text = repository.fullName
        
        let owner = repository.owner
        
        let imgURL = owner.avatorUrl
            
        searchTask = URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, result, error) in
            
            //エラー検出時
            if error != nil {
                KRProgressHUD.showError(withMessage: "画像の取得に失敗しました")
            }
            
            let img = UIImage(data: data!)!
            
            DispatchQueue.main.async {
                view.ownerImageView.image = img
            }
            
        }
        searchTask?.resume()
        
    }
    
    
    
    
}
