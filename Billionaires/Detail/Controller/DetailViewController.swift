//
//  DetailViewController.swift
//  Billionaires
//
//  Created by Umair Hanif on 22/08/2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    
    //MARK: - @IBOutlet
    @IBOutlet var mainView: DetailView!
    
    
    //MARK: - Custom Variables
    var data: HomeViewModel?
    
    
    //MARK: - @LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.assetsCollectionView.delegate = self
        mainView.assetsCollectionView.dataSource = self
        mainView.assetsCollectionView.register(UINib(nibName: "AssetsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AssetsCollectionViewCell")
        self.assignData()
        
        
    }
    
    
    //MARK: - Custom Functions
    private func assignData() {
        
        mainView.avatar.sd_setImage(with: URL(string: data?.avatar ?? ""), placeholderImage: UIImage(systemName: "person.circle"))
        mainView.name.text = data?.fullName ?? ""
        mainView.industries.text = data?.industries ?? ""
        mainView.cityAndState.text = "\(data?.city ?? ""), \(data?.state ?? "")"
        mainView.bio.text = data?.bio ?? ""
        mainView.about.text = data?.about ?? ""
        
    }
    
    
    //MARK: - Listeners
    @IBAction func backBtnListener(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}



//MARK: - CollectionView Methods
extension DetailViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.finencialAssets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssetsCollectionViewCell", for: indexPath) as? AssetsCollectionViewCell {
            
            cell.data = self.data?.finencialAssets?[indexPath.row]
            cell.assignData()
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 50, height: collectionView.frame.size.height)
    }
    
    
}
