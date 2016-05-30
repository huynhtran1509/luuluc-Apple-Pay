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
//#import "UIColor_EXT.h"

@interface FirstViewController ()<UITableViewDataSource, UITableViewDelegate, PKPaymentAuthorizationViewControllerDelegate>
{
    UITableView*    _tableView;
    
    PKPaymentSummaryItem*           _totalItems;
    PKPaymentSummaryItem*           _selectedShippingMethod;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"List Products"];
    [self.view setBackgroundColor:[UIColor LVL_colorWithHexString:@"ffffff" andAlpha:1.0]];
    
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

-(void)cartCheckOut
{
    SecondViewController* secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

#pragma mar - UITableView DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *addCart = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"add to Cart" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)  {
    
                                        }];
                                     
    addCart.backgroundColor = [UIColor greenColor];
    
    UITableViewRowAction *buy = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Buy Now"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                          {
                                              [self buyNowTapped:indexPath.row];
                                          }];
    buy.backgroundColor = [UIColor redColor];
    return @[buy,addCart];
}

#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Apple Pay

-(void)buyNowTapped:(long)price
{
    price = 100.99;
    PKPaymentRequest *paymentRequest = [Stripe paymentRequestWithMerchantIdentifier:AppleMerchantId];
    paymentRequest.currencyCode = @"USD";
    paymentRequest.countryCode = @"US";
    paymentRequest.supportedNetworks = @[PKPaymentNetworkAmex,PKPaymentNetworkMasterCard,PKPaymentNetworkVisa];
    paymentRequest.merchantCapabilities = PKMerchantCapability3DS | PKMerchantCapabilityCredit | PKMerchantCapabilityDebit; //LucChelsea note: change it in nearly future.
    paymentRequest.requiredShippingAddressFields = PKAddressFieldPostalAddress;
    
    NSDecimalNumber *freeAmount = [NSDecimalNumber decimalNumberWithMantissa:0000
                                                                    exponent:-2 isNegative:NO];;
    PKShippingMethod *freeShipping = [PKShippingMethod summaryItemWithLabel:@"Free Shipping" amount:freeAmount];
    freeShipping.detail = [NSString stringWithFormat:@"Arrives by %@",[self getTimeFormat:7]];
    freeShipping.identifier = @"free";
    
    NSDecimalNumber *standardAmount = [NSDecimalNumber decimalNumberWithMantissa:325
                                                                        exponent:-2 isNegative:NO];
    PKShippingMethod *standardShipping = [PKShippingMethod summaryItemWithLabel:@"Standard Shipping" amount:standardAmount];
    standardShipping.detail =[NSString stringWithFormat:@"Arrives by %@",[self getTimeFormat:5]];
    standardShipping.identifier = @"standard";
    
    NSDecimalNumber *expressAmount = [NSDecimalNumber decimalNumberWithMantissa:1275
                                                                       exponent:-2 isNegative:NO];
    PKShippingMethod *expressShipping = [PKShippingMethod summaryItemWithLabel:@"Express Shipping" amount:expressAmount];
    expressShipping.detail = [NSString stringWithFormat:@"Arrives by %@",[self getTimeFormat:2]];
    expressShipping.identifier = @"express";
    
    paymentRequest.shippingMethods = @[freeShipping, standardShipping, expressShipping];
    
    NSString *label = @"JBeautyBrands";
    NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%ld",price]];
    paymentRequest.paymentSummaryItems = @[[PKPaymentSummaryItem summaryItemWithLabel:label
                                                                               amount:amount]
                                           ];
    _totalItems = [PKPaymentSummaryItem summaryItemWithLabel:label amount:amount];
    
    if ([Stripe canSubmitPaymentRequest:paymentRequest])
    {
        PKPaymentAuthorizationViewController* paymentController = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:paymentRequest];
        paymentController.delegate = self;
//        paymentController = paymentController;
        
        [self presentViewController:paymentController animated:YES completion:nil];
    } else {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Card Notification"
                                                                        message:@"You not have exiting credit card in Apple Wallet.\nDo you want to enter one?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
//                                       [_NavigationController setTotalItems:_totalItems];
//                                       [_NavigationController openStripePaymentViewFromCart:NO];
                                       
                                   }];
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"No, Thanks"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }];
        [alert addAction:okButton];
        [alert addAction:noButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(NSString*)getTimeFormat:(int)days
{
    NSDate* date = [NSDate dateWithTimeInterval:days*86400 sinceDate:[NSDate date]];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MMM dd yyyy";
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Apple Pay
-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didSelectShippingMethod:(PKShippingMethod *)shippingMethod completion:(void (^)(PKPaymentAuthorizationStatus, NSArray<PKPaymentSummaryItem *> * _Nonnull))completion
{
    _selectedShippingMethod = shippingMethod;
    [self updateShippingCost];
    completion(PKPaymentAuthorizationStatusSuccess, [NSArray arrayWithObjects:_totalItems, nil]);
}
-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion
{
    [[STPAPIClient sharedClient] createTokenWithPayment:payment
                                             completion:^(STPToken *token, NSError *error) {
//                                                 [_NavigationController setTotalItems:_totalItems];
//                                                 [_NavigationController createBackendChargeWithToken:token
//                                                                                          completion:^(STPBackendChargeResult status, NSError *error) {
//                                                                                              if (status == STPBackendChargeResultSuccess) {
//                                                                                                  completion(PKPaymentAuthorizationStatusSuccess);
//                                                                                              } else {
//                                                                                                  NSLog(@"%@",error);
//                                                                                                  completion(PKPaymentAuthorizationStatusFailure);
//                                                                                              }
//                                                                                          }];
                                             }];
}
-(void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)updateShippingCost
{
    NSDecimalNumber* totalAmount = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%.02f",12.43]];
    
    totalAmount = [totalAmount decimalNumberByAdding:[_selectedShippingMethod amount]];
    [_totalItems setAmount:totalAmount];
}

@end
