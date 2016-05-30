//
//  SecondViewController.m
//  ApplePayDemo
//
//  Created by Lucas Luu on 5/26/16.
//  Copyright © 2016 Lucas Luu. All rights reserved.
//

#import "SecondViewController.h"
#import "TC_CartCell.h"
@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView*    _tableView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Cart"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _tableView = [[UITableView alloc]init];
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [_tableView registerClass:[TC_CartCell class] forCellReuseIdentifier:@"cartCells"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor clearColor];
    [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_tableView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mar - UICode
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(TC_CartCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TC_CartCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cartCells"];
    if (!cell) {
        cell = [[TC_CartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cartCells"];
    }
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *addCart = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"add to Cart" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)  {
        
    }];
    
    addCart.backgroundColor = [UIColor greenColor];
    
    UITableViewRowAction *buy = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Buy Now"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                 {
                                     
                                 }];
    buy.backgroundColor = [UIColor redColor];
    return @[buy,addCart];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark - Apple Pay
@end
