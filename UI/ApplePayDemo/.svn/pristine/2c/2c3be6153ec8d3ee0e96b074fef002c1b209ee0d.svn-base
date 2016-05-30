//
//  TC_ProductCell.m
//  ApplePayDemo
//
//  Created by admin on 5/27/16.
//  Copyright © 2016 Lucas Luu. All rights reserved.
//

#import "TC_ProductCell.h"

@implementation TC_ProductCell
{
    UIImageView*    _background;
    UIImageView*    _image;
    UILabel*        _gameLbl;
    UILabel*        _price;
    UIButton*       _addCart;
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
        
        _image = [[UIImageView alloc]init];
        [_image setImage:[UIImage imageNamed:@"assassin-s-creed-unity300.jpg"]];
        [_image setTranslatesAutoresizingMaskIntoConstraints:NO];
        _image.layer.cornerRadius = 4;
        _image.layer.masksToBounds = YES;
        [self addSubview:_image];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_image
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterY
                                                       multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_image
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_image
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_image
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:80.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_image
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_image
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:120.0]];
        _gameLbl = [[UILabel alloc]init];
        [_gameLbl setText:@"Assassin S Creed Unity"];
        [_gameLbl setFont:[UIFont boldSystemFontOfSize:15]];
        [_gameLbl setTextColor:[UIColor whiteColor]];
        _gameLbl.numberOfLines = 0;
        [_gameLbl setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_gameLbl];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_gameLbl
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_gameLbl
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_image
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_gameLbl
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_gameLbl
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:50.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_gameLbl
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.7
                                                          constant:0.0]];
        _price = [[UILabel alloc]init];
        [_price setText:@" 980K "];
        [_price setFont:[UIFont boldSystemFontOfSize:14]];
        [_price setTextColor:[UIColor orangeColor]];
        [_price setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_price];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_price
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_gameLbl
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_price
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_image
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_price
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_price
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:20.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_price
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_price
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:50.0]];
//        _addCart = [[UIButton alloc]init];
//        [_addCart setTitle:@"Add Cart" forState:UIControlStateNormal];
//        _addCart.layer.cornerRadius = 5;
//        _addCart.layer.masksToBounds = YES;
//        [_addCart setBackgroundColor:[UIColor clearColor]];
//        _addCart.layer.borderColor = [[UIColor greenColor] CGColor];
//        _addCart.layer.borderWidth = 1;
//        [_addCart setTranslatesAutoresizingMaskIntoConstraints:NO];
//        [self addSubview:_addCart];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addCart
//                                                         attribute:NSLayoutAttributeCenterY
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:self
//                                                         attribute:NSLayoutAttributeCenterY
//                                                        multiplier:1.0
//                                                          constant:0.0]];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addCart
//                                                         attribute:NSLayoutAttributeRight
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:self
//                                                         attribute:NSLayoutAttributeRight
//                                                        multiplier:1.0
//                                                          constant:-10.0]];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addCart
//                                                         attribute:NSLayoutAttributeBottom
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:_addCart
//                                                         attribute:NSLayoutAttributeTop
//                                                        multiplier:1.0
//                                                          constant:20.0]];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addCart
//                                                         attribute:NSLayoutAttributeRight
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:_addCart
//                                                         attribute:NSLayoutAttributeLeft
//                                                        multiplier:1.0
//                                                          constant:50.0]];
    }
    return self;
}

-(void)setData:(NSDictionary *)data
{
    _data = data;
    [_image setImage:[UIImage imageNamed:[data objectForKey:@"image"]]];
    [_gameLbl setText:[data objectForKey:@"name"]];
    [_price setText:[NSString stringWithFormat:@"%.02f",[[data objectForKey:@"price"] floatValue]]];
}

@end
