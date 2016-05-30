//
//  StripPaymentView.h
//  LazadaPrototype
//
//  Created by LucChelsea on 11/23/15.
//  Copyright © 2015 Luc Chelsea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VC_NavPaymentController.h"

@interface StripPaymentView : UIView

@property (strong, nonatomic) UIView* contentView;
@property (strong, nonatomic) VC_NavPaymentController* navgationController;

-(instancetype)initWithPaymentItem:(PKPaymentSummaryItem*)item fromCart:(BOOL) isFromCart;
-(void)setHeight:(CGFloat) height;

#pragma mark - UIView Animation
-(void)contentViewSlideUp;
-(void)hiddenContentView;
@end
