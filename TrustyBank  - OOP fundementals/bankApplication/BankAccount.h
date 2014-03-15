//
//  BankAccount.h
//  bankApplication
//
//  Created by Rozzles on 30/01/2014.
//  Copyright (c) 2014 toroCam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject
@property (strong, nonatomic) NSString *CustomerName;
@property (nonatomic) int AccountBalance;
-(id)initWithCustomerName:(NSString *) CustName Balance:(double)AcctBalance;
-(void)withdraw:(double)ammount;
-(void)deposit:(double)ammount;
-(void)simulateInterestYear;
-(NSUInteger)length;
@end
