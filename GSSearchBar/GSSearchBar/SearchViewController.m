//
//  SearchViewController.m
//  GSSearchBar
//
//  Created by GentryShen on 2018/10/6.
//  Copyright © 2018 GentryShen. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

// 界面
@property (weak, nonatomic) IBOutlet GSSearchBar *searchBar; // 搜索栏


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareInterface];
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - 界面

// 准备界面
- (void)prepareInterface {
    
    weak(self)
    [self.searchBar setBack:^{
        strong(self)
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.searchBar setSearch:^(NSString * _Nonnull keywords) {
        NSLog(@"Keywords: %@", keywords);
        // Code: 根据关键词进行搜索
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
