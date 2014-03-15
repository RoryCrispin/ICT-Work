//
//  ViewController.h
//  bankApplication
//
//  Created by Rozzles on 30/01/2014.
//  Copyright (c) 2014 toroCam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPickerView *AccountPicker;
- (IBAction)addInvestmentButton:(id)sender;
- (IBAction)addCreditButton:(id)sender;
- (IBAction)addDebitButton:(id)sender;
- (IBAction)simulateYearOfInterest:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *DepositSliderDisplay;
@property (weak, nonatomic) IBOutlet UILabel *WithdrawSliderDisplay;
- (IBAction)DepositAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *WithdrawAction;
- (IBAction)WithdrawValueChanged:(UISlider *)sender;
- (IBAction)DepositValueChanged:(UISlider *)sender;
- (IBAction)WithdrawAction:(id)sender;

@end
