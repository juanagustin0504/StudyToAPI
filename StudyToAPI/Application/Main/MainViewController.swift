//
//  MainViewController.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/14.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    //MARK: - outlet -
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var usrID: UILabel!
    @IBOutlet weak var acctNo: UILabel!
    @IBOutlet weak var acctTp: UILabel!
    @IBOutlet weak var acctBal: UILabel!
    @IBOutlet weak var wdrwPossAmt: UILabel!
    @IBOutlet weak var acctNewDt: UILabel!
    
    //MARK: - view model -
    let loginViewModel: LoginViewModel = LoginViewModel()
    let accountInquiryViewModel: AccountInquiryViewModel = AccountInquiryViewModel()
    
    
    //MARK: - life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        idText.delegate = self
        pwText.delegate = self
    }
    
    
    //MARK: - action -
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
        guard let userId = idText.text, let userPw = pwText.text else {
            return
        }
        
        loginViewModel.requestLogin(usrID: userId, usrPW: userPw) { (error) in
            if error != nil {
                self.showAlert(message: "error: \(String(describing: error))")
                return
            }
            
            switch self.loginViewModel.loginModel?.RESULT_TP {
            case "0":
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                    let imgPickerSb = UIStoryboard(name: "ImagePicker", bundle: nil)
                    let imgPickerVc = imgPickerSb.instantiateViewController(withIdentifier: "ImagePickerViewController") as! ImagePickerViewController
                    self.navigationController?.pushViewController(imgPickerVc, animated: true)
                }
                DispatchQueue.main.async {
                    self.showAlert(message: "로그인 성공", action: action)
                    
                    self.loginBtn.setTitle(self.loginViewModel.loginModel?.USR_NM, for: .normal)
                    self.idText.isEnabled = false
                    self.pwText.isEnabled = false
                    self.loginBtn.isEnabled = false
                    
                }
            case "1":
                DispatchQueue.main.async {
                    self.idText.shake()
                }
            case "2":
                DispatchQueue.main.async {
                    self.pwText.shake()
                }
            default:
                self.showAlert(message: "그 밖의 오류")
            }
            
        }
        
    }
    
    @IBAction func accountInquiryBtnTapped(_ sender: UIButton) {
        
        accountInquiryViewModel.requsetAccountInquiry(ACCT_NO: "052-123-4253123-251") { (error) in
            if error != nil {
                print("Account Inquiry Error : \(String(describing: error))")
                DispatchQueue.main.async {
                    self.showAlert(message: "로그인 후 계좌조회가 가능합니다.")
                }
                return
            }
            
            guard let responseObj = self.accountInquiryViewModel.responseObj else {
                return
            }
            
            DispatchQueue.main.async {
                self.usrID.text         = responseObj.USR_ID
                self.acctNo.text        = responseObj.ACCT_NO
                self.acctTp.text        = responseObj.ACCT_TP
                self.acctBal.text       = responseObj.ACCT_BAL
                self.wdrwPossAmt.text   = responseObj.WDRW_POSS_AMT
                self.acctNewDt.text     = responseObj.ACCT_NEW_DT
            }
            
            
        }
        
    }
    
    //MARK: - custom method -
    func showAlert(_ title: String = "알림", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
        
    }
    
    func showAlert(title: String = "알림", message: String, action: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
}

//MARK: - extension -
extension MainViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 4
        }
        
        return true
    }
}

extension UITextField {
    func shake() {
        self.border(color: UIColor.red)
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
    
    func border(color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5
    }
}
