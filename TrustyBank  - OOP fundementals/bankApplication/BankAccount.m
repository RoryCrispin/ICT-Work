//
//  BankAccount.m
//  bankApplication
//
//  Created by Rozzles on 30/01/2014.
//  Copyright (c) 2014 toroCam. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount
@synthesize CustomerName;
@synthesize AccountBalance;
//Creates a readable description for the PickerView which contains the CustomerName and account balance
-(NSString *)description {
    return [NSString stringWithFormat:@"%@ £%d",CustomerName , AccountBalance];
}
-(NSUInteger)length
   {
       return [[self description] length];
   }

//The initialisation method for the Bank accounts which takes in the name and balance from the VC  and then calls the superclass [NSObject  init] – returns the ID to the VC for the pickerView
-(id)initWithCustomerName:(NSString *)CustName Balance:(double)AcctBalance
{
    self = [super init];
    CustomerName = CustName;
    AccountBalance = AcctBalance;
    return self;
}

//All accounts share the same deposit method – so it’s in the superclass. Called with a double parameter to add to the ‘AccountBalance’
-(void)deposit:(double)ammount
{
    AccountBalance = AccountBalance + ammount;
    NSLog(@"Deposited");
}
@end
