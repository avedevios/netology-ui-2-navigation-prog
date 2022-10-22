//
//  PostViewController.swift
//  netology-ui-2-navigation
//
//  Created by ake11a on 2022-10-21.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemTeal
        
        let infoBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info"), style: .done, target: self, action: #selector(infoBarButtonItemAction))
        
        navigationItem.setRightBarButton(infoBarButtonItem, animated: true)

    }
    
    @objc private func infoBarButtonItemAction() {
        let infoViewController = InfoViewController()
        
        present(infoViewController, animated: true)
        //navigationController?.pushViewController(infoViewController, animated: true)
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
