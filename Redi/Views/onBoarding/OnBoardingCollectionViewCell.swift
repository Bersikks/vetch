//
//  OnBoardingCollectionViewCell.swift
//  Redi
//
//  Created by Berezhnova <3 on 01.02.2024.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionView: UILabel!
    @IBOutlet weak var slideTitleView: UILabel!
    
    func setup(_ slide: OnBoardingSlide) {
        slideImageView.image = slide.image
        slideTitleView.text = slide.title
        slideDescriptionView.text = slide.description
    }
}
