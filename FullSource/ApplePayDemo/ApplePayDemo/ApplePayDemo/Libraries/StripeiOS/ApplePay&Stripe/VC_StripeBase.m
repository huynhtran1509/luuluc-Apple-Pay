//
//  VC_StripeBase.m
//  LazadaPrototype
//
//  Created by LucChelsea on 11/25/15.
//  Copyright © 2015 Luc Chelsea. All rights reserved.
//

#import "VC_StripeBase.h"

@interface VC_StripeBase ()

@end

@implementation VC_StripeBase

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
    _keyboardAvailable = NO;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Keyboard Notification

-(void)keyboardHide:(NSNotification*) notification
{
    
}

-(void)keyBoardShow:(NSNotification*) notification
{
    
}

-(void)keyboardDidShow
{
    
}

-(void)rightButtonTapped
{
//    [_supperView hiddenContentView];
}

-(void)setRightButtonTitile
{
    
}
@end
