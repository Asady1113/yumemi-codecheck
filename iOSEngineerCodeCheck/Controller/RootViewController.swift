//
//  RootViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

//protocol TransitionProtocol {
//    func performSegue(withIdentifier identifier: String, sender: Any?)
//}


class RootViewController: UIViewController,UISearchBarDelegate {
    
    
    @IBOutlet weak var rootView: RootView!
    var rootViewModel = RootViewModel()
    
    var tableView: UITableView!
    
   // lazy var transitioner: TransitionProtocol
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        rootViewModel.setPlaceholder(rootView: rootView)
        rootView.searchBar.delegate = self
        
        settingTabelView()
        
        
        //スクロール時にキーボードを閉じる
        rootView.tableView.keyboardDismissMode = .onDrag
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //テキストが変更されたときはサーチをキャンセルする
        rootViewModel.cancelSearch()
    }

    //検索ボタンが押されたら
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let word: String? = searchBar.text
        
        //検索ワードが入っているなら
        if word?.count != 0 {
            rootViewModel.searchRepository(word: word!, tableView: rootView.tableView)
        
        }
        
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //DetailViewControllerへの値わたし
        if segue.identifier == "Detail"{
            let detailVC = segue.destination as! DetailViewController
            detailVC.rootVC = rootViewModel
        }
        
    }
    
    
    private func settingTabelView() {
        rootView.tableView.dataSource = self.rootViewModel
        rootView.tableView.delegate = self
    }
    
    
    @objc func didTapTableViewCell(indexPath: IndexPath) {
        
        rootViewModel.didTapTableViewCell(indexPath: indexPath)
        rootView.tableView.deselectRow(at: indexPath, animated: true)
        //画面遷移
        performSegue(withIdentifier: "Detail", sender: self)
    }

}


extension RootViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        didTapTableViewCell(indexPath: indexPath)
    }
    
}


