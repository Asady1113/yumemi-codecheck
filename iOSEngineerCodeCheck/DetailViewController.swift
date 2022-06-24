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
    @IBOutlet weak var detailView : DetailView!
    
    var searchTask: URLSessionTask?
    
    var rootVC: RootViewController!
    
    var repository : Repository!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //RootViewControllerで選択されたrepositoryを代入
        repository = rootVC.repositoryArray[rootVC.selectedIndex!]
        

        detailView.languageLabel.text = "Written in \(repository.language)"
        detailView.starsCountLabel.text = "\(repository.stargazersCount) stars"
        detailView.watcherCountLabel.text = "\(repository.watchersCount) watchers"
        detailView.forkCountLabel.text = "\(repository.forksCount) forks"
        detailView.issueCountLabel.text = "\(repository.issuesCount) open issues"
        
        
        getOwner()
        
    }
    
    //オーナーを取得
    func getOwner(){
        
        detailView.titleLabel.text = repository.fullName
        
        let owner = repository.owner
        getOwnerImage(owner: owner)
        
    }
    
    
    //オーナーの画像を取得
    func getOwnerImage(owner: Owner) {
        
        let imgURL = owner.avatorUrl
            
        searchTask = URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, result, error) in
            
            let img = UIImage(data: data!)!
            
            DispatchQueue.main.async {
                self.detailView.ownerImageView.image = img
            }
            
        }
        searchTask?.resume()
        
    }
    
}

