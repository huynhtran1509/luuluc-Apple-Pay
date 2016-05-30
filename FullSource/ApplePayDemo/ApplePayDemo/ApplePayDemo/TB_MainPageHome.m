//
//  TB_MainPageHome.m
//  ApplePayDemo
//
//  Created by Lucas Luu on 5/27/16.
//  Copyright © 2016 Lucas Luu. All rights reserved.
//

#import "TB_MainPageHome.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation TB_MainPageHome

-(instancetype)init
{
    self = [super init];
    if (self) {
        UIViewController* firstVC = [[FirstViewController alloc] init];
        UIViewController* secondVC = [[SecondViewController alloc] init];
    }
    return self;
}
@end
