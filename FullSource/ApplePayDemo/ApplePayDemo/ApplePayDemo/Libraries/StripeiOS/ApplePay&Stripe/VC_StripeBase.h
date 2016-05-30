//
//  VC_StripeBase.h
//  LazadaPrototype
//
//  Created by LucChelsea on 11/25/15.
//  Copyright © 2015 Luc Chelsea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StripPaymentView;
@interface VC_StripeBase : UIViewController//<VC_NavPaymentControllerDelegate>

@property (weak, nonatomic) StripPaymentView* supperView;
@property (assign, nonatomic) BOOL  keyboardAvailable;
@end
