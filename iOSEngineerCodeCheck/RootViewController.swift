//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import KRProgressHUD


//protocol TransitionProtocol {
//    func performSegue(withIdentifier identifier: String, sender: Any?)
//}


//class RootViewController: UITableViewController, UISearchBarDelegate,TransitionProtocol {
//
//    @IBOutlet weak var searchBar: UISearchBar!
//
//    lazy var transitioner: TransitionProtocol = self
//
//    var repositoryArray = [Repository]()
//
//    var searchTask: URLSessionTask?
//    var searchWord: String?
//    var searchUrl: String?
//    var selectedIndex: Int?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        //初期のテキストを表示
//        searchBar.placeholder = "GitHubのリポジトリを検索できるよー"
//
//        searchBar.delegate = self
//    }
//
//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        // ↓初期のテキストを削除するコード
//        searchBar.text = ""
//
//        return true
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        //テキストが変更されたときはサーチをキャンセルする
//        searchTask?.cancel()
//    }
//
//    //検索ボタンが押されたら
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        searchWord = searchBar.text!
//
//        //検索ワードが入っているなら
//        if searchWord?.count != 0 {
//            //検索中は画面を固定する（ボタン連打によるエラーを回避）
//            KRProgressHUD.show()
//
//            searchUrl = "https://api.github.com/search/repositories?q=\(searchWord!)"
//
//            searchRepository(url: searchUrl!)
//
//        }
//
//    }
//
//
//    //レポジトリを検索
//    func searchRepository(url: String) {
//
//        searchTask = URLSession.shared.dataTask(with: URL(string: url)!) { [self] (data, result, error) in
//
//            if let object = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] {
//
//                makeRepositoryArray(object: object)
//
//            }
//        }
//        //リクエストを開始するために必要
//        searchTask?.resume()
//
//    }
//
//
//    //repositoryArrayを作成
//    func makeRepositoryArray(object: [String: Any]) {
//        //配列を初期化。二重のappendを防ぐ
//        self.repositoryArray = [Repository]()
//
//        if let items = object["items"] as? [[String: Any]] {
//
//            //itemを一つずつ配列にappendする
//            for item in items {
//                let repository = Repository(json: item)
//
//                repositoryArray.append(repository)
//            }
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//
//                //ロードが完成したらHUDを閉じる
//                KRProgressHUD.dismiss()
//
//            }
//        }
//    }
//
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        //DetailViewControllerへの値わたし
//        if segue.identifier == "Detail"{
//            let detailVC = segue.destination as! DetailViewController
//            detailVC.rootVC = self
//        }
//
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return repositoryArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = UITableViewCell()
//        let repo = repositoryArray[indexPath.row]
//        cell.textLabel?.text = repo.fullName
//        cell.detailTextLabel?.text = repo.language
//        cell.tag = indexPath.row
//
//        return cell
//
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // タップされたcellの番号を代入
//        selectedIndex = indexPath.row
//        //画面遷移
//        transitioner.performSegue(withIdentifier: "Detail", sender: self)
//
//    }
//
//}


