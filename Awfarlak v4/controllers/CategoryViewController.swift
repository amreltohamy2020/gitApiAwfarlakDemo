//
//  CategoryViewController.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var subCataegory = [Categories]()
    var url:String = ""
    @IBOutlet weak var collectionView: UICollectionView!
    
//    init(with stringUrl :String) {
//        self.url = stringUrl
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate and dataSource
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.backgroundView = UIView.init(frame: CGRect.zero)
        
        
        // the string url here should be passed from the previeous view controller
        //url
        guard let SafeUrl = URL(string: "https://webdesign.be4em.info/awfarlkapi_ar/Category/getMainCategorySubCategories/549834453/25598/45") else{return}
        
        //get array of catageories
        APIManager.shared.getApiData(for: SafeUrl) { (results) in
            switch results {
            case .success(let subCategories):
                self.subCataegory = subCategories
                print(self.subCataegory)
           
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("error getting data")
                print(error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
       // collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       

      }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CategoryViewController:UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCataegory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "singlrCataegoryCell", for: indexPath) as! CatagoryCollectionViewCell
        cell.setCataegoriesCell(subCataegory[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        // goto the products view controller
        print("go to productus view")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AllProductsViewController") as! AllProductsViewController
        vc.title = subCataegory[indexPath.row].name
        vc.destinationUrl = ""//pass url to the view controller
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
