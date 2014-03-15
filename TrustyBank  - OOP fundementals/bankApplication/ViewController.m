//
//  ViewController.m
//  bankApplication
//
//  Created by Rozzles on 30/01/2014.
//  Copyright (c) 2014 toroCam. All rights reserved.
//

#import "ViewController.h"
#import "MBFaker.h"
#import "InvestmentAccount.h"
#import "CreditAccount.h"
#import "DebitAccount.h"

@interface ViewController ()

@end

@implementation ViewController

//Initialise local variables used by this class
 
@synthesize AccountPicker;
NSMutableArray *AccountsPickerArray;
int DepositValue;
int WithdrawValue;
int pickerPosition;

/*
 *viewDidLoad delegate method that sets up the pickerView's dataSource
 *and initialised the AccountsPickerArray
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    pickerPosition = 0;
    AccountPicker.delegate = self;
    AccountPicker.dataSource = self;
    AccountsPickerArray = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Creates a new object of InvestmentAccount with peramaters  and reloads the PickerView. This is called when the button 'Investment Account' is clicked
- (IBAction)addInvestmentButton:(id)sender {
    [AccountsPickerArray addObject:[[InvestmentAccount alloc] initWithCustomerName:[MBFakerName name] Balance:arc4random_uniform(2000)]];
    
    [AccountPicker reloadAllComponents];
}

//As before with CreditAccount
- (IBAction)addCreditButton:(id)sender {
    [AccountsPickerArray addObject:[[CreditAccount alloc] initWithCustomerName:[MBFakerName name] Balance:arc4random_uniform(2000)]];
    
    [AccountPicker reloadAllComponents];
}

//As before with DebitAccount
- (IBAction)addDebitButton:(id)sender {
    [AccountsPickerArray addObject:[[DebitAccount alloc] initWithCustomerName:[MBFakerName name] Balance:arc4random_uniform(2000)]];
    
    [AccountPicker reloadAllComponents];
}

//Called when the 'Simulate Interest Year' button is clicked. Runs through all the objects in PickerViewArray and sends them [simulateInterest] then reloads the pickerview after running this for all the classes.
- (IBAction)simulateYearOfInterest:(id)sender {
    for (int i=0; i<[AccountsPickerArray count]; i++) {
        [[AccountsPickerArray objectAtIndex:i] simulateInterestYear];
    }
    [AccountPicker reloadAllComponents];
}
//Delegate method to initialise the PickerView's titles to the description of the selected object. - See [BankAccount description].
- (NSString *)pickerView:(UIPickerView *)AccountPicker titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[AccountsPickerArray objectAtIndex:row]description];
}
//Delegate method called when the pickerview changes it's selection. Sets the pickePosition int to the selected value.
- (void)pickerView:(UIPickerView *)AccountPicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    pickerPosition  = row;
}
//Delegate method to initialise the PickerView's X size
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)AccoutPicker
{
    return 1;
}
//Delegate method to initialise the PickerView's Y size
- (NSInteger)pickerView:(UIPickerView *)AccountPicker numberOfRowsInComponent:(NSInteger)component
{
    return [AccountsPickerArray count];
}
//Called when the 'Deposit' button is clicked. Sends the selected account 'deposit' with the parameters of the dposit slider's value.
- (IBAction)DepositAction:(id)sender {
    [[AccountsPickerArray objectAtIndex:pickerPosition] deposit:DepositValue];
    [AccountPicker reloadAllComponents];
}

//As above with withdrawals.
- (IBAction)WithdrawAction:(id)sender {
    [[AccountsPickerArray objectAtIndex:pickerPosition] withdraw:WithdrawValue];
    [AccountPicker reloadAllComponents];
}
//Delegate method called when the Withdraw slider us changed. Keeps the values of the slider small as it has a high D.P precision.
- (IBAction)WithdrawValueChanged:(UISlider *)sender {
    
    WithdrawValue = roundl([sender value]); // Rounds float to an integer
    [sender setValue:(float)WithdrawValue];
    [_WithdrawSliderDisplay setText:[NSString stringWithFormat:@"£%d", WithdrawValue]];
}
//As above with deposits.
- (IBAction)DepositValueChanged:(UISlider *)sender {
    
    DepositValue = roundl([sender value]); // Rounds float to an integer
    [sender setValue:(float)DepositValue];
    
     [_DepositSliderDisplay setText:[NSString stringWithFormat:@"£%d", DepositValue]];
}


@end
