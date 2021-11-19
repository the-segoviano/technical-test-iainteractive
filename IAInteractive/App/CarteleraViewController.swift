//
//  CarteleraViewController.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

class CarteleraViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.IdForCell.genericCell)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .white
        
    }
    
    
    func fetchCartelera() {
        RequestManager.fetchCartelera(reference: self) { [weak self] result in
            switch result {
            case .success(let carteleraResponse):
                DispatchQueue.main.async {
                    
                    print(" TERMINA carteleraResponse ", carteleraResponse, "\n")
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(" Error Found: ", error.localizedDescription)
                }
            }
            
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchCartelera()
        
    }
    
    
    //
    // initialized with a non-nil layout parameter
    //
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // Delegates & Datasource
    //
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wtCell: CGFloat = (view.frame.width/2) - 10
        return CGSize.init(width: wtCell, height: wtCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IdForCell.genericCell, for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
        
        // return UICollectionViewCell()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailViewController: MovieDetailViewController = MovieDetailViewController()
        //movieDetailViewController.modalPresentationStyle = .overCurrentContext
        self.present(movieDetailViewController, animated: true, completion: nil)
    }
    
    
}
