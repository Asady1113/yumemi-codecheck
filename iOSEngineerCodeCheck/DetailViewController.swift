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
    
    var rootVC: RootViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //RootViewControllerで選択されたrepositoryを代入
        let repo = rootVC.repositoryArray[rootVC.selectedIndex]
        
        detailView.languageLabel.text = "Written in \(repo["language"] as? String ?? "")"
        detailView.starsCountLabel.text = "\(repo["stargazers_count"] as? Int ?? 0) stars"
        detailView.watcherCountLabel.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
        detailView.forkCountLabel.text = "\(repo["forks_count"] as? Int ?? 0) forks"
        detailView.issueCountLabel.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
        
        
        getOwner()
        
    }
    
    //オーナーを取得
    func getOwner(){
        
        let repo = rootVC.repositoryArray[rootVC.selectedIndex]
        
        detailView.titleLabel.text = repo["full_name"] as? String
        
        if let owner = repo["owner"] as? [String: Any] {
            
            getOwnerImage(owner: owner)
            
        }
        
    }
    
    
    //オーナーの画像を取得
    func getOwnerImage(owner: [String: Any]) {
        
        if let imgURL = owner["avatar_url"] as? String {
            
            URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, result, error) in
                
                let img = UIImage(data: data!)!
                
                DispatchQueue.main.async {
                    self.detailView.ownerImageView.image = img
                }
                
            }.resume()
        }
    }
    
}
