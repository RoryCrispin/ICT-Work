//
//  ViewController.m
//  PaintSim2000
//
//  Created by Rory Crispin on 21/01/2014.
//  Copyright (c) 2014 Rory Crispin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController
@synthesize paintType;
@synthesize PaintSpinner;

double paintTypeCost;
double paintCostTypeAndUndercoat;
BOOL doUndercoat;
double roomArea;
double cost;
- (void)viewDidLoad
{
    [super viewDidLoad];
    PaintSpinner.delegate = self;
    PaintSpinner.dataSource = self;
    paintType = [[NSArray alloc] initWithObjects:@"Luxury", @"Standard", @"Economy", nil];
    doUndercoat = true;
    paintTypeCost =  1.75; //Default paint type is Luxuary.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
 *Implementastion of the pickerview
 */
- (NSString *)pickerView:(UIPickerView *)PaintSpinner titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [paintType objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)PaintSpinner didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Chosen item: %@", [paintType objectAtIndex:row]);
    switch (row) {
        case 0:
            paintTypeCost = 1.75;
            break;
        case 1:
            paintTypeCost = 1.0;
            break;
        case 2:
            paintTypeCost = 0.5;
            break;
        default:
            break;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)PaintSpinner
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)PaintSpinner numberOfRowsInComponent:(NSInteger)component
{
    return [paintType count];
}

- (IBAction)UndercoatToggle:(id)sender {
    doUndercoat = !doUndercoat;
}
-(BOOL)checkPaintValuesAreWithinRange:(int)width Height:(int)height Length:(int)length {
    if((width >25) || (width < 2) || (length >25) || (length <2) || (height >6) || (height <2))
    {
        _Receipt.text = [NSString stringWithFormat:@"*** PaintSim2000 ***\nRoom dimensions is not withing range.\nLength and Width must be between 2m and 25m\n Height bust be between 2 and 6 \n Thank you for using PaintSim2000\n********************"];
        return YES;
    } else {
        return NO;
    }
}
-(NSString *)calculateRoomWithWidth:(int)width Height:(int)height Length:(int)length {
    
    if(doUndercoat)
    {
        paintCostTypeAndUndercoat = paintTypeCost+0.5;
    }
    
    else
    {
        paintCostTypeAndUndercoat = paintTypeCost;
    }
    roomArea = 2*length*height + 2*width*height;
    cost = roomArea*paintCostTypeAndUndercoat;
    
    return [NSString stringWithFormat:@"£%0.2f", cost];
}


- (IBAction)CalculateAction:(id)sender {
    if (![self checkPaintValuesAreWithinRange:[_WidthIn.text integerValue] Height:[_HeightText.text integerValue] Length:[_LengthIn.text integerValue]]) {
        NSString *totalCost = [self calculateRoomWithWidth:[_WidthIn.text integerValue] Height:[_HeightText.text integerValue] Length:[_LengthIn.text integerValue]];
        _Receipt.text = [NSString stringWithFormat:@"*** PaintSim2000 ***\nCost: %@\n Room Area:%0.2fm^2\n Paint cost per m^2:%0.2f  \n Thank you for using PaintSim2000\n********************", totalCost, roomArea,paintCostTypeAndUndercoat];
    }
    
}
@end
