//
//  FirstViewController.m
//  ApplePayDemo
//
//  Created by Lucas Luu on 5/26/16.
//  Copyright © 2016 Lucas Luu. All rights reserved.
//
@import PassKit;
#import "FirstViewController.h"
#import "TC_ProductCell.h"
#import "SecondViewController.h"
#import <Stripe/Stripe.h>
//#import "UIColor_EXT.h"

@interface FirstViewController ()<UITableViewDataSource, UITableViewDelegate, PKPaymentAuthorizationViewControllerDelegate>
{
    UITableView*    _tableView;
    NSMutableArray* _data;
    NSMutableArray* _cartData;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"List Products"];
    [self.view setBackgroundColor:[UIColor LVL_colorWithHexString:@"000000" andAlpha:1.0]];
    
    [self hardCodeData];
    
    _tableView = [[UITableView alloc]init];
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [_tableView registerClass:[TC_ProductCell class] forCellReuseIdentifier:@"productCells"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor clearColor];
    [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_tableView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    UIBarButtonItem* cartItem = [[UIBarButtonItem alloc] initWithTitle:@"Cart" style:UIBarButtonItemStylePlain target:self action:@selector(cartCheckOut)];
    self.navigationItem.rightBarButtonItem = cartItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor LVL_colorWithHexString:@"06121F" andAlpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}
-(void)cartCheckOut
{
    SecondViewController* secondVC = [[SecondViewController alloc] init];
    [secondVC setDataSource:_cartData];
    [self.navigationController pushViewController:secondVC animated:YES];
}

-(void)hardCodeData
{
    _data = [NSMutableArray new];
    _cartData = [NSMutableArray new];
    
    NSMutableDictionary* object1 = [NSMutableDictionary new];
    [object1 setObject:@"Assasin Creed" forKey:@"name"];
    [object1 setObject:@"assassin-s-creed-unity300.jpg" forKey:@"image"];
    [object1 setObject:[NSNumber numberWithFloat:3.99] forKey:@"price"];
    [_data addObject:object1];
    
    NSMutableDictionary* object2 = [NSMutableDictionary new];
    [object2 setObject:@"Battlefield 4" forKey:@"name"];
    [object2 setObject:@"battlefield-4-premium-edition910.jpg" forKey:@"image"];
    [object2 setObject:[NSNumber numberWithFloat:9.99] forKey:@"price"];
    [_data addObject:object2];
    
    NSMutableDictionary* object3 = [NSMutableDictionary new];
    [object3 setObject:@"Hit-Man" forKey:@"name"];
    [object3 setObject:@"hitman-full-experience -950.jpg" forKey:@"image"];
    [object3 setObject:[NSNumber numberWithFloat:13.99] forKey:@"price"];
    [_data addObject:object3];
    
    NSMutableDictionary* object4 = [NSMutableDictionary new];
    [object4 setObject:@"Diablo 3 - Reaper of Souls" forKey:@"name"];
    [object4 setObject:@"diablo-3-reaper-of-souls450.jpg" forKey:@"image"];
    [object4 setObject:[NSNumber numberWithFloat:5.99] forKey:@"price"];
    [_data addObject:object4];
    
    NSMutableDictionary* object5 = [NSMutableDictionary new];
    [object5 setObject:@"Dark Soul III" forKey:@"name"];
    [object5 setObject:@"dark-souls-iii-pre-order850.jpg" forKey:@"image"];
    [object5 setObject:[NSNumber numberWithFloat:4.99] forKey:@"price"];
    [_data addObject:object5];
    
    NSMutableDictionary* object6 = [NSMutableDictionary new];
    [object6 setObject:@"Rise of the Tomb Raider" forKey:@"name"];
    [object6 setObject:@"rise-of-the-tomb-raider860.jpg" forKey:@"image"];
    [object6 setObject:[NSNumber numberWithFloat:10.50] forKey:@"price"];
    [_data addObject:object6];
    
    NSMutableDictionary* object7 = [NSMutableDictionary new];
    [object7 setObject:@"Counter-Strike:GO" forKey:@"name"];
    [object7 setObject:@"counter-strike-global-offensive160.jpg" forKey:@"image"];
    [object7 setObject:[NSNumber numberWithFloat:3.99] forKey:@"price"];
    [_data addObject:object7];
    
    NSMutableDictionary* object8 = [NSMutableDictionary new];
    [object8 setObject:@"Call of Duty - Black ops" forKey:@"name"];
    [object8 setObject:@"call-of-duty-black-ops-iii-750.jpg" forKey:@"image"];
    [object8 setObject:[NSNumber numberWithFloat:5.99] forKey:@"price"];
    [_data addObject:object8];
    
    NSMutableDictionary* object9 = [NSMutableDictionary new];
    [object9 setObject:@"Tom Clancy's Rainbow 6 Siege" forKey:@"name"];
    [object9 setObject:@"tom-clancy-s-rainbow-six-siege990.jpg" forKey:@"image"];
    [object9 setObject:[NSNumber numberWithFloat:12.99] forKey:@"price"];
    [_data addObject:object9];
}
-(void)paymentProductAtIndexPath:(NSIndexPath*)indexPath
{
    NSDictionary* product = (NSDictionary*)[_data objectAtIndex:indexPath.row];
    float price = [[product objectForKey:@"price"] floatValue];
    
    PKPaymentRequest* payment = [Stripe paymentRequestWithMerchantIdentifier:@"merchant.com.iOStektalk22"];
}
#pragma mar - UICode
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(TC_ProductCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TC_ProductCell*cell = [tableView dequeueReusableCellWithIdentifier:@"productCells"];
    if (!cell) {
        cell = [[TC_ProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"productCells"];
    }
    
    cell.data = [_data objectAtIndex:indexPath.row];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *addCart = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"add to Cart" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)  {
        [_cartData addObject:[_data objectAtIndex:indexPath.row]];
                                        }];
                                     
    addCart.backgroundColor = [UIColor LVL_colorWithHexString:@"1DCC48" andAlpha:1.0];
    
    UITableViewRowAction *buy = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Buy Now"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                          {
                                            
                                          }];
    buy.backgroundColor = [UIColor LVL_colorWithHexString:@"C91B0E" andAlpha:1.0];
    return @[buy,addCart];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Apple Pay

-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion
{
    
}

-(void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller
{
    
}

@end
