//
//  TC_CartCell.h
//  ApplePayDemo
//
//  Created by admin on 5/27/16.
//  Copyright © 2016 Lucas Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SecondViewController;
@interface TC_CartCell : UITableViewCell

@property (weak, nonatomic) SecondViewController* delegate;
@property (strong,nonatomic)NSMutableDictionary*    dataSource;

@end
