//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ownerImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var watcherCountLabel: UILabel!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var issueCountLabel: UILabel!
    
    var rootVC: RootViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //タイトルの文字数に合わせてフォントサイズを調整
        titleLabel.adjustsFontSizeToFitWidth = true
        
        //RootViewControllerで選択されたrepositoryを代入
        let repo = rootVC.repositoryArray[rootVC.selectedIndex]
        
        languageLabel.text = "Written in \(repo["language"] as? String ?? "")"
        starsCountLabel.text = "\(repo["stargazers_count"] as? Int ?? 0) stars"
        watcherCountLabel.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
        forkCountLabel.text = "\(repo["forks_count"] as? Int ?? 0) forks"
        issueCountLabel.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
        
        
        getOwner()
        
    }
    
    //オーナーを取得
    func getOwner(){
        
        let repo = rootVC.repositoryArray[rootVC.selectedIndex]
        
        titleLabel.text = repo["full_name"] as? String
        
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
                    self.ownerImageView.image = img
                }
                
            }.resume()
        }
    }
    
}
