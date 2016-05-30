//
//  TC_CartCell.m
//  ApplePayDemo
//
//  Created by admin on 5/27/16.
//  Copyright © 2016 Lucas Luu. All rights reserved.
//

#import "TC_CartCell.h"

@implementation TC_CartCell
{
    UIImageView*    _background;
    UIImageView*    _image;
    UILabel*        _product;
    UILabel*        _price;
    UILabel*        _quantity;
    

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setBackgroundColor:[UIColor darkGrayColor]];
        _background = [[UIImageView alloc]init];
        [_background setImage:[UIImage imageNamed:@"blueBG"]];
        [_background setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_background];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_background
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_background
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_background
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_background
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        

    }
    return self;
}

@end

