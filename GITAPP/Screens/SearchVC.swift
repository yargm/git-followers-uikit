//
//  SearchVC.swift
//  GITAPP
//
//  Created by Yareni Grajales Mérida on 04/10/24.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButon = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureButton()
        configureDismissKeyboardGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    func configureDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
   @objc func pushFollowersListVC(){
       guard isUsernameEntered else { 
           presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a valid username. We need to know who to look for 🫣", buttonTitle: "Ok")
           return }
       let followerListVC = FollowerListVC()
       followerListVC.username = usernameTextField.text
       followerListVC.title = usernameTextField.text
       navigationController?.pushViewController(followerListVC, animated: true)
        
    }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        callToActionButon.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField(){
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configureButton(){
        view.addSubview(callToActionButon)
        
        NSLayoutConstraint.activate([
            callToActionButon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButon.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
    
}
