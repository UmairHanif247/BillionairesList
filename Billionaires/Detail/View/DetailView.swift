//
//  DetailView.swift
//  Billionaires
//
//  Created by Umair Hanif on 22/08/2022.
//

import UIKit

class DetailView: UIView {
    
    
    //MARK: - @IBOutlet
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var industries: UILabel!
    @IBOutlet weak var cityAndState: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var assetsCollectionView: UICollectionView!
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.avatar.layer.cornerRadius = 50
    }
    

}
