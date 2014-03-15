//
//  InvestmentAccount.m
//  bankApplication
//
//  Created by Rozzles on 30/01/2014.
//  Copyright (c) 2014 toroCam. All rights reserved.
//

#import "InvestmentAccount.h"

@implementation InvestmentAccount

//Adds the account type to the name of the superclass’s Description and returns an NSString 
-(NSString *)description
{
    return [NSString stringWithFormat:@"Invest: %@", [super description]];
}

//Withdraw method which applies the individual account behaviours to the withdrawal process.  – Checks for the minimum balance and performs applicable transaction fees then removes the balance from the superclass double ‘AccountBalance’
-(void)withdraw:(double)ammount
{
    int tempBalance = super.AccountBalance - (ammount*1.05) - 10 ;
    if (tempBalance > 0)
    {
        super.AccountBalance = tempBalance;
    }
}


//Simulates the interest of a year depending on the account type then adds this to the superclass double ‘AccountBalance’
-(void)simulateInterestYear
{
    super.AccountBalance = super.AccountBalance*1.08;
}

@end
