//
//  ShippingManager.h
//  LazadaPrototype
//
//  Created by LucChelsea on 11/16/15.
//  Copyright © 2015 Luc Chelsea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface ShippingManager : NSObject

- (NSArray *)defaultShippingMethods;
- (void)fetchShippingCostsForAddress:(ABRecordRef)address completion:(void (^)(NSArray *shippingMethods, NSError *error))completion;

@end