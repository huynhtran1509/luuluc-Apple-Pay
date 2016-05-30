//
//  VC_CollectShippingAddress.m
//  LazadaPrototype
//
//  Created by LucChelsea on 11/24/15.
//  Copyright © 2015 Luc Chelsea. All rights reserved.
//

#import "VC_CollectShippingAddress.h"
#import "LazadaPrototype-Swift.h"

//================================= Interface of HoshiTextField ===========================
@interface HoshiTextField (EXT)
-(BOOL)isValid;
@end
@implementation HoshiTextField (EXT)

-(BOOL)isValid
{
    if ([self.text length] > 0 || [self.text isEqual:@""] == FALSE)
    {
        return YES;
    }
    return NO;
}

@end
//==========================================================================================

@interface VC_CollectShippingAddress ()
{
    UIButton*               _chooseBtn1;
    UIButton*               _chooseBtn2;
    UserDataSource*         _user;
    
    HoshiTextField*         _name;
    HoshiTextField*         _adressline1;
    HoshiTextField*         _adressline2;
    HoshiTextField*         _city;
    HoshiTextField*         _state_provice_region;
    HoshiTextField*         _zipcode;
    HoshiTextField*         _phoneNumber;
    Address*                _currentAddress;

}
@property (strong, nonatomic) UIScrollView* pageScroll;
@end

@implementation VC_CollectShippingAddress

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Shipping Address";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.pageScroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.pageScroll setBackgroundColor:[UIColor whiteColor]];
    [self.pageScroll setShowsHorizontalScrollIndicator:NO];
    [self.pageScroll setShowsVerticalScrollIndicator:NO];
    
    //Config NavigationBar
    [self setRightButtonTitile:@"Done"];
    
    _user = [_AppSettings getcurrentUser];
    
    float xPos = 10.0;
    float yPos = 10.0;
    
    if (_user.currentlyReciverAddress) {
        _chooseBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(xPos, yPos +11, 20, 20)];
        [_chooseBtn1 setBackgroundImage:[UIImage imageNamed:@"un-check"] forState:UIControlStateNormal];
        [_chooseBtn1 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];
        [_chooseBtn1 addTarget:self action:@selector(chooseBtnTapped) forControlEvents:UIControlEventTouchUpInside];
        [self chooseBtnTapped];
        [self.pageScroll addSubview:_chooseBtn1];
        xPos += _chooseBtn1.frame.size.width + 20;
        
        UILabel* addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - xPos - 10, 44)];
        [addressLabel setText:[_user.currentlyReciverAddress getAdress]];
        [addressLabel setTextAlignment:NSTextAlignmentLeft];
        [addressLabel setFont:[UIFont systemFontOfSize:14]];
        [addressLabel setNumberOfLines:0];
        [self.pageScroll addSubview:addressLabel];
        yPos += 46;
        xPos = 10;
    }
    if (_user.recentlyReciverAddress) {
        _chooseBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(xPos, yPos +11, 20, 20)];
        [_chooseBtn2 setBackgroundImage:[UIImage imageNamed:@"un-check"] forState:UIControlStateNormal];
        [_chooseBtn2 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];
        [_chooseBtn2 addTarget:self action:@selector(chooseBtn2Tapped) forControlEvents:UIControlEventTouchUpInside];
        [self.pageScroll addSubview:_chooseBtn2];
        xPos += _chooseBtn2.frame.size.width + 20;
        
        UILabel* addressLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - xPos - 10, 44)];
        [addressLabel2 setText:[_user.recentlyReciverAddress getAdress]];
        [addressLabel2 setTextAlignment:NSTextAlignmentLeft];
        [addressLabel2 setFont:[UIFont systemFontOfSize:14]];
        [addressLabel2 setNumberOfLines:0];
        [self.pageScroll addSubview:addressLabel2];
        yPos += 46;
        xPos = 10;
    }
    UIButton* addnewAddress = [[UIButton alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.10667)];
    [addnewAddress setTitle:@"+  Add new address" forState:UIControlStateNormal];
    [addnewAddress setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [addnewAddress setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [addnewAddress setBackgroundColor:[UIColor whiteColor]];
    [addnewAddress.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [addnewAddress setTitleColor:[UIColor LVL_colorWithHexString:@"249dd2" andAlpha:1.0] forState:UIControlStateNormal];
    [addnewAddress addTarget:self action:@selector(addNewAddressButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.pageScroll addSubview:addnewAddress];
    yPos += addnewAddress.frame.size.height + 10;
    
    [self.view addSubview:self.pageScroll];
    [self.supperView setHeight:yPos + 44];
    [self.pageScroll setContentSize:CGSizeMake(WIDTH, yPos)];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self.supperView.navgationController logoView] setHidden:YES];
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Keyboard Notification

-(void)keyBoardShow:(NSNotification*) notification
{
    if (self.keyboardAvailable || !(self.isViewLoaded && self.view.window)) {
        return;
    }
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    CGRect rawFrame      = [value CGRectValue];
    
    __block CGSize contentSize = self.pageScroll.contentSize;
    contentSize.height += rawFrame.size.height;
    
    [UIView animateWithDuration:0.6 animations:^{
        [self.pageScroll setContentSize:contentSize];
    }];
}
-(void)keyboardDidShow
{
    self.keyboardAvailable = YES;
}

-(void)keyboardHide:(NSNotification*) notification
{
    if(self.keyboardAvailable == NO || !(self.isViewLoaded && self.view.window))
    {
        return;
    }
    self.keyboardAvailable = NO;
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    CGRect rawFrame      = [value CGRectValue];
    
    __block CGSize contentSize = self.pageScroll.contentSize;
    contentSize.height -= rawFrame.size.height;
    
    [UIView animateWithDuration:0.6 animations:^{
        [self.pageScroll setContentSize:contentSize];
    }];
}

#pragma mark - UIButton
-(void)addNewAddressButtonTapped:(UIButton*)sender
{
    [self.supperView setHeight:CGRectGetHeight([UIScreen mainScreen].bounds) - 140];
    //config
    [sender setEnabled:NO];
    [_chooseBtn1 setSelected:NO];
    [_chooseBtn2 setSelected:NO];
    _currentAddress = nil;
    
    float yPos = self.pageScroll.contentSize.height;
    float xPos = 10.0;
    //seprator
    UIView* seprator = [[UIView alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, 1)];
    [seprator setBackgroundColor:[UIColor lightGrayColor]];
    [seprator setAlpha:0.3];
    [self.pageScroll addSubview:seprator];
    yPos += 1;
    
    _name = [[HoshiTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.1667)];
    [_name setPlaceholder:@"  Name"];
    [_name setBorderActiveColor:[UIColor LVL_colorWithHexString:@"ffc16a" andAlpha:1.0]];
    [_name setBorderInactiveColor:[UIColor LVL_colorWithHexString:@"d0d0d0" andAlpha:1.0]];
    [self.pageScroll addSubview:_name];
    if (_user.fullName && ![_user.fullName isEqualToString:@""]) {
        [_name setText:_user.fullName];
    }
    yPos += WIDTH*0.1667 + 20;
    
    _adressline1 = [[HoshiTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.1667)];
    [_adressline1 setPlaceholder:@"  Address line 1"];
    [_adressline1 setBorderActiveColor:[UIColor LVL_colorWithHexString:@"ffc16a" andAlpha:1.0]];
    [_adressline1 setBorderInactiveColor:[UIColor LVL_colorWithHexString:@"d0d0d0" andAlpha:1.0]];
    [self.pageScroll addSubview:_adressline1];
    yPos += WIDTH*0.1667 + 20;
    
    _adressline2 = [[HoshiTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.1667)];
    [_adressline2 setPlaceholder:@"  Address line 2"];
    [_adressline2 setBorderActiveColor:[UIColor LVL_colorWithHexString:@"ffc16a" andAlpha:1.0]];
    [_adressline2 setBorderInactiveColor:[UIColor LVL_colorWithHexString:@"d0d0d0" andAlpha:1.0]];
    [self.pageScroll addSubview:_adressline2];
    yPos += WIDTH*0.1667 + 20;
    
    _city = [[HoshiTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.1667)];
    [_city setPlaceholder:@"  City"];
    [_city setBorderActiveColor:[UIColor LVL_colorWithHexString:@"ffc16a" andAlpha:1.0]];
    [_city setBorderInactiveColor:[UIColor LVL_colorWithHexString:@"d0d0d0" andAlpha:1.0]];
    [self.pageScroll addSubview:_city];
    yPos += WIDTH*0.1667 + 20;
    
    _state_provice_region = [[HoshiTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.1667)];
    [_state_provice_region setPlaceholder:@"  State/province/Region"];
    [_state_provice_region setBorderActiveColor:[UIColor LVL_colorWithHexString:@"ffc16a" andAlpha:1.0]];
    [_state_provice_region setBorderInactiveColor:[UIColor LVL_colorWithHexString:@"d0d0d0" andAlpha:1.0]];
    [self.pageScroll addSubview:_state_provice_region];
    yPos += WIDTH*0.1667 + 20;
    
    _zipcode = [[HoshiTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.1667)];
    [_zipcode setPlaceholder:@"  Postal Code"];
    [_zipcode setBorderActiveColor:[UIColor LVL_colorWithHexString:@"ffc16a" andAlpha:1.0]];
    [_zipcode setBorderInactiveColor:[UIColor LVL_colorWithHexString:@"d0d0d0" andAlpha:1.0]];
    [self.pageScroll addSubview:_zipcode];
    yPos += WIDTH*0.1667 + 20;
    
    _phoneNumber = [[HoshiTextField alloc] initWithFrame:CGRectMake(xPos, yPos, WIDTH - 2*xPos, WIDTH*0.1667)];
    [_phoneNumber setPlaceholder:@"  Phone Number"];
    [_phoneNumber setBorderActiveColor:[UIColor LVL_colorWithHexString:@"ffc16a" andAlpha:1.0]];
    [_phoneNumber setBorderInactiveColor:[UIColor LVL_colorWithHexString:@"d0d0d0" andAlpha:1.0]];
    [self.pageScroll addSubview:_phoneNumber];
    yPos += WIDTH*0.1667 + 20;
    
    [self.pageScroll setFrame:CGRectMake(0, 0, WIDTH, CGRectGetHeight(self.pageScroll.frame)-140)];
    [self.pageScroll setContentSize:CGSizeMake(WIDTH, yPos)];
    [self.view addSubview:self.pageScroll];
}
-(void)chooseBtnTapped
{
    _currentAddress = _user.currentlyReciverAddress;
    [_chooseBtn1 setSelected:YES];
    [_chooseBtn2 setSelected:NO];
}
-(void)chooseBtn2Tapped
{
    _currentAddress = _user.recentlyReciverAddress;
    [_chooseBtn1 setSelected:NO];
    [_chooseBtn2 setSelected:YES];
}

#pragma mark - VC_NavPaymentController Delegate
-(void)setRightButtonTitile:(NSString *)title
{
    [[self.supperView.navgationController rightBtn] setTitle:title forState:UIControlStateNormal];
}

-(void)rightButtonTapped
{
    if (_currentAddress) {
        [self.supperView hiddenContentView];
        return;
    }
    
    if ([_name isValid] && ([_adressline1 isValid] || [_adressline2 isValid]) && [_city isValid] && [_state_provice_region isValid] && [_zipcode isValid] && [_phoneNumber isValid]) {
        
        Address* address = [[Address alloc] initWithAddressLine1:_adressline1.text
                                                withAddressLine2:_adressline2.text
                                                        withCity:_city.text
                                                       withState:_state_provice_region.text
                                                     withZipCode:_zipcode.text];
        
        [_user addAddress:address];
        [_AppSettings setUserDataSource:_user];
        [self.supperView hiddenContentView];
    }
    else
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Shipping Notification"
                                      message:@"Some field do not correct.Do you want ignore this step"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel your yes please button action here
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       [self.supperView hiddenContentView];
                                       
                                   }];
        UIAlertAction* cancelButton = [UIAlertAction
                                   actionWithTitle:@"I want to continue"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel your yes please button action here
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }];
        
        [alert addAction:okButton];
        [alert addAction:cancelButton];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
}

@end
