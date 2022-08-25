//
//  AssetsCollectionViewCell.swift
//  Billionaires
//
//  Created by Umair Hanif on 25/08/2022.
//

import UIKit

class AssetsCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - @IBOutlet
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var sharePrice: UILabel!
    @IBOutlet weak var totalShares: UILabel!
    
    
    //MARK: - Custom Variables
    var data: FinancialAsset?
    
    
    //MARK: - @LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.mainView.layer.borderColor = UIColor.systemGreen.cgColor
        self.mainView.layer.borderWidth = 1
        self.mainView.layer.cornerRadius = 10
        
    }
    
    
    //MARK: - Custom Functions
    internal func assignData() {
        self.company.text = data?.companyName ?? ""
        self.sharePrice.text = "$ \(data?.sharePrice ?? 0.0)"
        self.totalShares.text = "\(data?.numberOfShares ?? 0.0)"
    }
    
    
    
    
    
}
