//
//  SecondViewController.h
//  ApplePayDemo
//
//  Created by Lucas Luu on 5/26/16.
//  Copyright © 2016 Lucas Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (strong, nonatomic) NSMutableArray* dataSource;

-(void)addNewProduct:(NSDictionary*)productInfo count:(NSInteger)count;

@end

