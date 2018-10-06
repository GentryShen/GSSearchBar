//
//  SearchBar.swift
//  GSSearchBar
//
//  Created by GentryShen on 2018/10/6.
//  Copyright © 2018 GentryShen. All rights reserved.
//

import UIKit

typealias SearchBarBack   = () -> Void
typealias SearchBarSearch = (String) -> Void

class SearchBar: UIView, UITextFieldDelegate {

    // 界面
    @IBOutlet weak var search_v: UIView!
    @IBOutlet weak var search_left_lycst:  NSLayoutConstraint!
    @IBOutlet weak var search_right_lycst: NSLayoutConstraint!
    @IBOutlet weak var search_txf: UITextField!
    
    let duration: Double = 0.2
    
    let left_N:  CGFloat = 45
    let left_S:  CGFloat = 15
    let right_N: CGFloat = 10
    let right_S: CGFloat = 55
    
    var back:   SearchBarBack?   // 返回回调
    var search: SearchBarSearch? // 搜索回调
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.width = Width
        self.search_txf.becomeFirstResponder()
    }
    
    // 代理
    // UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.moveLeftSearchView()
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        self.moveRightSearchView()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let content = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        self.search(content)
        return true
    }
    // 搜索
    func search(_ keywords: String) {
        if self.search != nil {
            self.search!(keywords)
        }
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.search("")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.search_txf.resignFirstResponder()
        return true
    }
    
    // 左移搜索视图
    func moveLeftSearchView() {
        
        UIView.animate(withDuration: self.duration, animations: {
            self.search_v.left  = self.left_S
            self.search_v.width = self.width - self.left_S - self.right_S
        })
        self.search_left_lycst.constant  = self.left_S
        self.search_right_lycst.constant = self.right_S
    }
    // 右移搜索视图
    func moveRightSearchView() {
        
        UIView.animate(withDuration: self.duration, animations: {
            self.search_v.left  = self.left_N
            self.search_v.width = self.width - self.left_N - self.right_N
        })
        self.search_left_lycst.constant  = self.left_N
        self.search_right_lycst.constant = self.right_N
    }
    
    // 返回
    @IBAction func back(_ sender: UIButton) {
        self.back_()
    }
    func back_() {
        if self.back != nil {
            self.back!()
        }
    }
    // 取消
    @IBAction func cancel(_ sender: UIButton) {
        
        if self.search_txf.text!.isEmpty {
            self.back_()
        } else {
            self.search_txf.resignFirstResponder()
        }
    }

}
