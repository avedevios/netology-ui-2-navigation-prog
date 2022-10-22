//
//  InfoViewController.swift
//  netology-ui-2-navigation
//
//  Created by ake11a on 2022-10-21.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        setupAlertButton()
    }
   
    private func setupAlertButton() {
        view.addSubview(alertButton)
        
        alertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var alertButton: UIButton = {
        let alertButton = UIButton()
        
        alertButton.backgroundColor = .blue
        alertButton.layer.cornerRadius = 12
        alertButton.setTitle("Alert", for: .normal)
        //alertButton.setTitleColor(.lightGray, for: .normal)
        alertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        alertButton.addTarget(self, action: #selector(alertButtonAction), for: .touchUpInside)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        
        return alertButton
    }()
    
    @objc private func alertButtonAction() {
        
        let alertController = UIAlertController(title: "Question", message: "How do you do?", preferredStyle: .alert)
        
        let actionOk = UIAlertAction(title: "Ok", style: .cancel) { action in
            
            print("It`s Ok!")
        }
        
        let actionGood = UIAlertAction(title: "Good!", style: .destructive) { action in
            
            print("It`s GOOD!")
        }
        
        alertController.addAction(actionOk)
        alertController.addAction(actionGood)
        
        present(alertController, animated: true, completion: nil)
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
