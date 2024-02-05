//
//  OnBoardingViewController.swift
//  Redi
//
//  Created by Berezhnova <3 on 01.02.2024.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var slides: [OnBoardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1 {
                nextBtn.isHidden = true
                skipBtn.isHidden = true
                signBtn.isHidden = false
                stackView.isHidden = false
            } else {
                nextBtn.isHidden = false
                skipBtn.isHidden = false
                signBtn.isHidden = true
                stackView.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        skipBtn.layer.borderColor = UIColor(hex: 0x0560FA).cgColor
        skipBtn.layer.borderWidth = 1.0
        
        slides = [ OnBoardingSlide(title: "Quick Delivery At Your Doorstep", description: "Enjoy quick pick-up and delivery to your destination", image: #imageLiteral(resourceName: "In no time-pana 1")),
                   OnBoardingSlide(title: "Flexible Payment", description: "Different modes of payment either before and after delivery without stress", image: #imageLiteral(resourceName: "rafiki")),
                   OnBoardingSlide(title: "Real-time Tracking", description: "Track your packages/items from the comfort of your home till final destination", image: #imageLiteral(resourceName: "rafiki 1"))]
    }

    
    @IBAction func skipBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
        } else {
            currentPage += 2
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}

