//
//  DrawableViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 13/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit

class DrawableViewController: UIViewController {

    
    var navBarImage : UIImage?
    var navBarTitle: String!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = false
    }
    let colour = UIColor(red: 247, green: 247, blue: 247, alpha: 255)
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setActivityIndicator()
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture2)
        setupNav()
        
        setBackBtn()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    func setupNav(){
        let v = navigationController?.visibleViewController
        
        navigationController?.navigationBar.backgroundColor = colour
               navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = colour
     navigationController?.navigationBar.shadowImage = UIImage() //remove pesky 1 pixel
        navigationController?.navigationBar.isTranslucent = false
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
//    func setActivityIndicator(){
//        SKActivityIndicator.spinnerColor(UIColor.darkGray)
//
//
//        // default is black
//        SKActivityIndicator.statusTextColor(UIColor.black)
//
//
//        // default is System Font
//        let myFont = UIFont(name: "AvenirNext-DemiBold", size: 18)
//        SKActivityIndicator.statusLabelFont(myFont!)
//
//
//        // ActivityIndicator Styles: choose and set one of four.
//        SKActivityIndicator.spinnerStyle(.defaultSpinner)
//    }
    
    ///Set Title OR Image at Center
    func setNavigationBarCenterTitle(titleFlag: Bool, showImage imageFlag: Bool) {
        
        
        if imageFlag {
            
            
            let imgView = UIImageView(frame: CGRect(x: 0 , y: 0, width: 30, height: 30))
            imgView.contentMode = .scaleAspectFit
            
            
            //            let image = navBarImage?.withRenderingMode(.alwaysTemplate)
            imgView.image = navBarImage!
            
            // self.navigationController?.navigationBar.addSubview(imgView)
            
            self.navigationItem.titleView = imgView
            navigationController?.navigationBar.shadowImage = UIImage(named: "")
        }
        
        if titleFlag {
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            label.font = UIFont(name: "Roboto-Bold", size: 18)
            label.text = navBarTitle
            label.sizeToFit()
            label.textColor = UIColor.black
            self.navigationItem.titleView = label
            
        }
        
    }
    
    //   Mark:- Setters
    func setNavbarTitle(_ title: String) {
        navBarTitle = title
    }
    
    func setTitleImage(_ image: UIImage) {
        navBarImage = image
        
    }
    func setBackBtn(){
        
        let pushedVCCount = Int((navigationController?.viewControllers.count)!)
        if pushedVCCount > 1{
            let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
            //let image = UIImage(named: "back_arrow@2x-2")
            //button.frame = CGRect(x: 0, y: 0, width: (image?.size.width)!,height: (image?.size.height)! )
            // button.setImage(Helper().image(UIImage(named: "back_arrow")!, scaledTo: CGSize(width: 10, height: 20)), for: .normal)
            
            button.setImage(UIImage(named: "arrow_back")!, for: .normal)
            button.sizeToFit()
            
            
            button.addTarget(self, action: #selector(self.backButtonAction), for: .touchUpInside)
            //button.imageView?.contentMode = .scaleAspectFit
            // button.setImage(image, for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
            let barItem = UIBarButtonItem(customView: button)
            //var spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
            //spacing.width = 0
            navigationItem.leftBarButtonItem = barItem//[spacing, barItem]
        }
    }
    @objc func backButtonAction(){
        
        navigationController?.popViewController(animated: true)
        
    }
    
//    func alertMessage(message: String, title: String){
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil)
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
    
//    }

}
