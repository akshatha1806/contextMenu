//
//  ViewController.swift
//  ContextMenu
//
//  Created by Akshatha on 27/06/23.
//

import UIKit
// MARK: Shadow Effect To The UIView
extension UIView {
  func addShadow() {
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOffset = CGSize(width: 1, height: 1)
    self.layer.shadowOpacity = 1
  }
}

class ViewController: UIViewController {
    @IBOutlet weak var languagesCollectionView: UICollectionView!
    let languages: [String] = ["Swift", "C", "Kotlin", "Java", "C#"]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    // MARK: Register The Cell
    func registerCell() {
        languagesCollectionView.dataSource = self
        languagesCollectionView.delegate = self
        languagesCollectionView.register(UINib(nibName: "languagesCollectionViewCell", bundle: nil),
                                         forCellWithReuseIdentifier: "languagesCollectionViewCell")
        configureCollectionView()
    }
    // MARK: Configure The CollectionView Height And Width
    func configureCollectionView() {
        let layout = CustomGridThreeCollectionViewLayout()
        languagesCollectionView.backgroundColor = .clear
        languagesCollectionView.isPagingEnabled = false
        languagesCollectionView.setCollectionViewLayout(layout, animated: true)
    }
}
// MARK: UICollectionview Datasource and Delegate Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = languagesCollectionView.dequeueReusableCell(
             withReuseIdentifier: "languagesCollectionViewCell",
            for: indexPath) as? languagesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.languageName.text = languages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
               let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { _ in
               // do whatever actions you want to perform...
               }
               let editAction = UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil")) { _ in
               // do whatever actions you want to perform...
               }
               let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
               // do whatever actions you want to perform...
               }
               return UIMenu(title: "", children: [shareAction, editAction, deleteAction])
        }
    }
}

