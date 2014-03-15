//
//  CreditAccount.m
//  bankApplication
//
//  Created by Rozzles on 30/01/2014.
//  Copyright (c) 2014 toroCam. All rights reserved.
//

#import "CreditAccount.h"

@implementation CreditAccount

//Adds the account type to the name of the superclass’s Description and returns an NSString
-(NSString *)description
{
    return [NSString stringWithFormat:@"Credit: %@", [super description]];
}

//Withdraw method which applies the individual account behaviours to the withdrawal process.  – Checks for the minimum balance and performs applicable transaction fees then removes the balance from the superclass double ‘AccountBalance’
-(void)withdraw:(double)ammount
{
    int tempBalance = super.AccountBalance - (ammount*1.01) ;
    if (tempBalance > -5000)
    {
        super.AccountBalance = tempBalance;
    }
}

//Simulates the interest of a year depending on the account type then adds this to the superclass double ‘AccountBalance’
-(void)simulateInterestYear
{
    if (super.AccountBalance > 0)
    {
        super.AccountBalance = super.AccountBalance*1.001;
    }
    else
    {
        super.AccountBalance = -super.AccountBalance*1.2;
    }
}
@end
