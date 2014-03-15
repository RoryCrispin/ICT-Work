//
//  ViewController.h
//  PaintSim2000
//
//  Created by Rory Crispin on 21/01/2014.
//  Copyright (c) 2014 Rory Crispin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *HeightText;
@property (weak, nonatomic) IBOutlet UITextField *LengthIn;
@property (weak, nonatomic) IBOutlet UILabel *OutputLabel;
@property (weak, nonatomic) IBOutlet UITextField *WidthIn;
- (IBAction)CalculateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *PaintSpinner;
@property (nonatomic, strong) NSArray *paintType;
-(NSString *)calculateRoomWithWidth:(int)width Height:(int)height Length:(int)length;
- (IBAction)UndercoatToggle:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *Receipt;

@end
