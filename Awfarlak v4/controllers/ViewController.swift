//
//  ViewController.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     var allCatageories = [Categories]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.backgroundView = UIView.init(frame: CGRect.zero)
        self.collectionView.layer.cornerRadius = 5
        
        let urlString = "https://webdesign.be4em.info/awfarlkapi_ar/Category/getAllMainCategories/549834453/25598"
             let url = URL(string: urlString)
             APIManager.shared.getApiData(for: url!) { results in
                 switch results {
                 case .success(let AllCatageories):
                    print("sucess getting data")
                     print(AllCatageories[0].name)
                    print(AllCatageories.count)
                     self.allCatageories = AllCatageories
                 case .failure(let error):
                     print(error.localizedDescription)
                }
        
    }

        collectionView.reloadData()
}
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()

    }
}


extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("hello number of cataegories is :")
        print(allCatageories.count)
        return allCatageories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cataegoriesCell", for: indexPath) as! CataegoriesCollectionViewCell
        cell.layer.cornerRadius = 8
        cell.setCataegoriesCell(allCatageories[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("lets go to next view controller")
       // let vc = CategoryViewController(with: allCatageories[indexPath.row].adv)
      //  vc.title = allCatageories[indexPath.row].name
     //   navigationController?.pushViewController(vc, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "subCataegoryViewController") as! CategoryViewController
        vc.url = allCatageories[indexPath.row].adv
        vc.title = allCatageories[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
        
      
    }
    
}

