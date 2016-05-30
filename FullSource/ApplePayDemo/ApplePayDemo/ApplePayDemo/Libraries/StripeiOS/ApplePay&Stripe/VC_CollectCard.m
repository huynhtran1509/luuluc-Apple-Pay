////
////  VC_CollectCard.m
////  LazadaPrototype
////
////  Created by LucChelsea on 11/18/15.
////  Copyright © 2015 Luc Chelsea. All rights reserved.
////
//
//#import "VC_CollectCard.h"
//#import "StripPaymentView.h"
//#import "VC_CollectShippingAddress.h"
//
//@interface VC_CollectCard ()
//{
//    BOOL                    _isFromCart;
//    
//    PKPaymentSummaryItem*   _totalItem;
//    UIButton*   _payBtn;
//    UIButton*   _payResult;
//    DGActivityIndicatorView* _loadingActivityIndicator;
//}
//@property (strong, nonatomic) STPPaymentCardTextField *paymentTextField;
//@end
//
//@implementation VC_CollectCard
//-(instancetype)initWithPaymentItem:(PKPaymentSummaryItem *)item fromCart:(BOOL)isFromCart
//{
//    self = [super init];
//    if (self) {
//        _totalItem = item;
//        _isFromCart = isFromCart;
//    }
//    return self;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor whiteColor]];
//    
//    float xPos = 5.0;
//    float yPos = 50.0;
//    
//    _paymentTextField = [[STPPaymentCardTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - xPos, 44)];
//    _paymentTextField.delegate = self;
//    [self.view addSubview:_paymentTextField];
//    
//    yPos += 50;
//    _payBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, yPos, WIDTH, 85)];
//    [_payBtn setTitle:@"Pay with this card" forState:UIControlStateNormal];
//    [_payBtn setTitle:@"This card is not valid" forState:UIControlStateDisabled];
//    [_payBtn setTitleColor:[UIColor LVL_colorWithHexString:@"007aff" andAlpha:1.0] forState:UIControlStateNormal];
//    [_payBtn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
//    [_payBtn setEnabled:NO];
//    [_payBtn addTarget:self action:@selector(payWithCard) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_payBtn];
//    
//    _payResult = [[UIButton alloc] initWithFrame:CGRectMake(0, yPos, WIDTH, 85)];
//    [_payResult setHidden:YES];
//    [_payResult addTarget:self action:@selector(payResultTapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_payResult];
//    
//    _loadingActivityIndicator = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeCookieTerminator
//                                                                    tintColor:[UIColor LVL_colorWithHexString:@"007aff" andAlpha:1.0]
//                                                                         size:100.0f];
//    [_loadingActivityIndicator setFrame:CGRectMake(0, yPos, WIDTH, 75)];
//    [_loadingActivityIndicator setCenter:_payBtn.center];
//    [_loadingActivityIndicator setHidden:YES];
//    [self.view addSubview:_loadingActivityIndicator];
//    
//    [self.supperView setHeight:180];
//}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [[self.supperView.navgationController logoView] setHidden:NO];
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//-(void)cancelBtnTapped
//{
//    [self.supperView hiddenContentView];
//}
//-(void)payResultTapped
//{
//    
//    VC_CollectShippingAddress* vcShipping = [[VC_CollectShippingAddress alloc] init];
//    [vcShipping setSupperView:self.supperView];
//    [self.supperView.navgationController pushViewController:vcShipping animated:YES];
//    
//}
//
//#pragma mark - VC_NavPaymentController Delegate
//-(void)setRightButtonTitile:(NSString *)title
//{
//    [[self.supperView.navgationController rightBtn] setTitle:@"Cancel" forState:UIControlStateNormal];
//}
//
//-(void)rightButtonTapped
//{
//    [self cancelBtnTapped];
//}
//#pragma mark - Payment Method
//-(void)paymentSuccess
//{
//    NSLog(@"Create token with card success");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_loadingActivityIndicator stopAnimating];
//        [_loadingActivityIndicator setHidden:YES];
//        [_payResult setHidden:NO];
//        [_payResult setTitle:@"Done" forState:UIControlStateNormal];
//        [_payResult setTitleColor:[UIColor LVL_colorWithHexString:@"007aff" andAlpha:1.0] forState:UIControlStateNormal];
//        
//        if (_isFromCart) {
//            [_CartViewController finishAllBuy];
//        }
//    });
//}
//-(void)paymentFail
//{
//    NSLog(@"Create token with card fail");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_loadingActivityIndicator setHidden:YES];
//        [_payResult setHidden:NO];
//        [_payResult setTitle:@"Pay for this card fail" forState:UIControlStateNormal];
//        [_payResult setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    });
//}
//-(void)payWithCard
//{
//    [_payBtn setHidden:YES];
//    [_loadingActivityIndicator setHidden:NO];
//    [_loadingActivityIndicator startAnimating];
//    
////    STPCardParams *card = [[STPCardParams alloc] init];
////    card.number = _paymentTextField.card.number;
////    card.expMonth = _paymentTextField.card.expMonth;
////    card.expYear = _paymentTextField.card.expYear;
////    card.cvc = _paymentTextField.card.cvc;
////    [[STPAPIClient sharedClient] createTokenWithCard:card
////                                          completion:^(STPToken *token, NSError *error) {
////                                              [_NavigationController createBackendChargeWithToken:token
////                                                                                       completion:^(STPBackendChargeResult status, NSError *error) {
////                                                                                           if (status == STPBackendChargeResultSuccess) {
////                                                                                               [self paymentSuccess];
////                                                                                           } else {
////                                                                                               NSLog(@"%@",error);
////                                                                                               [self paymentFail];
////                                                                                           }
////                                                                                       }];
////                                          }];
//    [self paymentSuccess];
//}
//
//#pragma mark - STPPaymentCardTextFieldDelegate
//- (void)paymentCardTextFieldDidChange:(STPPaymentCardTextField *)textField
//{
//    if (_payBtn.hidden == NO) {
//        _payBtn.enabled = textField.isValid;
//    }
//}
//
//-(void)keyBoardShow:(NSNotification*) notification
//{
//    if (self.keyboardAvailable || !(self.isViewLoaded && self.view.window)) {
//        return;
//    }
//    NSDictionary *info  = notification.userInfo;
//    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
//    CGRect rawFrame      = [value CGRectValue];
//    
//    [self.supperView setHeight:180 + rawFrame.size.height];
//    
//}
//-(void)keyboardDidShow
//{
//    self.keyboardAvailable = YES;
//}
//-(void)keyboardHide:(NSNotification*) notification
//{
//    if (self.keyboardAvailable == NO || !(self.isViewLoaded && self.view.window)) {
//        return;
//    }
//    self.keyboardAvailable = NO;
//    [self.supperView setHeight:180];
//}
//@end
