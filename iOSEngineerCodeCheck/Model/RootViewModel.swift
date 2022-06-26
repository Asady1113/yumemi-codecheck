//
//  RootViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import UIKit
import KRProgressHUD


class RootViewModel: NSObject,UITableViewDataSource {
   
    
    var repositoryArray = [Repository]()
    
    var searchTask: URLSessionTask?
    var searchWord: String?
    var searchUrl: String?
    var selectedIndex: Int?
    
    
    func setPlaceholder(rootView: RootView) {
        
        //初期のテキストを表示
        rootView.searchBar.placeholder = "GitHubのリポジトリを検索できるよー"
    }
    
    
    func cancelSearch() {
        
        //テキストが変更されたときはサーチをキャンセルする
        searchTask?.cancel()
    }
    
    func searchRepository(word: String,tableView: UITableView) {
        
        searchWord = word
        
        //検索中は画面を固定する（ボタン連打によるエラーを回避）
        KRProgressHUD.show()
        
        searchUrl = "https://api.github.com/search/repositories?q=\(searchWord!)"
        
        searchTask = URLSession.shared.dataTask(with: URL(string: searchUrl!)!) { [self] (data, result, error) in

            if let object = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] {
                
                makeRepositoryArray(object: object, tableView: tableView)
            
            }
        }
        //リクエストを開始するために必要
        searchTask?.resume()
        
    }
    
    
    //repositoryArrayを作成
    func makeRepositoryArray(object: [String: Any],tableView: UITableView) {
        //配列を初期化。二重のappendを防ぐ
        self.repositoryArray = [Repository]()

        if let items = object["items"] as? [[String: Any]] {
            
            //itemを一つずつ配列にappendする
            for item in items {
                let repository = Repository(json: item)
                
                repositoryArray.append(repository)
            }
                            
            DispatchQueue.main.async {

                tableView.reloadData()
                //ロードが完成したらHUDを閉じる
                KRProgressHUD.dismiss()

            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repositoryArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let repo = repositoryArray[indexPath.row]
        cell.textLabel?.text = repo.fullName
        cell.detailTextLabel?.text = repo.language
        cell.tag = indexPath.row
        
        return cell
        
    }
    
    
    func didTapTableViewCell(indexPath: IndexPath) {
        // タップされたcellの番号を代入
        selectedIndex = indexPath.row
        
        
    }
    
    
}


