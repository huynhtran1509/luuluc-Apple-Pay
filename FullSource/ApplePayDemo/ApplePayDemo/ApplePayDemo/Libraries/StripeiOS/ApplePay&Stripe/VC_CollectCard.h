//
//  VC_CollectCard.h
//  LazadaPrototype
//
//  Created by LucChelsea on 11/18/15.
//  Copyright © 2015 Luc Chelsea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VC_StripeBase.h"

@interface VC_CollectCard : VC_StripeBase<STPPaymentCardTextFieldDelegate>

-(instancetype)initWithPaymentItem:(PKPaymentSummaryItem*)item fromCart:(BOOL) isFromCart;
@end
