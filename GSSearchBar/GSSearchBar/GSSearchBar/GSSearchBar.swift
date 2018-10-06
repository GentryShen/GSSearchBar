//
//  GSSearchBar.swift
//  yikanyigou
//
//  Created by GentryShen on 2018/4/10.
//  Copyright © 2018年 GentryShen. All rights reserved.
//

import UIKit

typealias Back   = () -> Void
typealias Search = (String) -> Void

class GSSearchBar: UIView {
    
    @objc var back:   Back?   // 返回回调
    @objc var search: Search? // 搜索回调
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        let searchBar: SearchBar = SearchBar.xib(nil)
        searchBar.back = {[weak self] in
            if self?.back != nil {
                self?.back!()
            }
        }
        searchBar.search = {[weak self] keywords in
            if self?.search != nil {
                self?.search!(keywords)
            }
        }
        self.addSubview(searchBar)
    }
    
}
