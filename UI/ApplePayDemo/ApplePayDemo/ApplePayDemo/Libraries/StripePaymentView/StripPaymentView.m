//
//  StripPaymentView.m
//  LazadaPrototype
//
//  Created by LucChelsea on 11/23/15.
//  Copyright © 2015 Luc Chelsea. All rights reserved.
//

#import "StripPaymentView.h"
#import "VC_CollectCard.h"

#import "LazadaPrototype-Swift.h"

@interface StripPaymentView()
{
    PKPaymentSummaryItem*       _item;
    BOOL                        _isFromCart;
    
    VC_NavPaymentController*    _navgationController;
    VC_CollectCard*             _collectionCard;
}
@end
@implementation StripPaymentView

-(instancetype)initWithPaymentItem:(PKPaymentSummaryItem *)item fromCart:(BOOL)isFromCart
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.3]];
        _item = item;
        _isFromCart = isFromCart;
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame), WIDTH, 100)];
        [_contentView setBackgroundColor:[UIColor redColor]];
        
        _collectionCard = [[VC_CollectCard alloc] initWithPaymentItem:item fromCart:isFromCart];
        [_collectionCard setSupperView:self];
        
        _navgationController = [[VC_NavPaymentController alloc] initWithRootViewController:_collectionCard];
        [_navgationController setViewDelegate:self];
        [_contentView addSubview:_navgationController.view];
        
        [self addSubview:_contentView];
    }
    return self;
}
-(void)setHeight:(CGFloat)height
{
    __block CGRect frame = _contentView.frame;
    frame.size.height = height;
    frame.origin.y = self.frame.size.height - height;
    [UIView animateWithDuration:0.6 animations:^{
        [_contentView setFrame:frame];
    }];
}

#pragma mark - UIView Animation
-(void)contentViewSlideUp
{
    
}
-(void)hiddenContentView
{
    __block CGRect frame = _contentView.frame;
    frame.origin.y = CGRectGetHeight(self.frame);
    [UIView animateWithDuration:0.6 animations:^{
        [_contentView setFrame:frame];
    }
    completion:^(BOOL finish)
     {
         [self removeFromSuperview];
     }];
}
@end
