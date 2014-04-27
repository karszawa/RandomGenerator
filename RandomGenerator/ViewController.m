//
//  ViewController.m
//  RandomGenerator
//
//  Created by Cubic on 2013/04/13.
//  Copyright (c) 2013年 Cubic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *min_current_value, *max_current_value;
    int RANDOM_NUMBER_MAX_LENGTH;
}

- (void)update_past_record;
- (void)clear_past_record;

- (BOOL)correct_value;


@end

@implementation ViewController

@synthesize min_value, max_value, result_field, past_record, error_message;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    RANDOM_NUMBER_MAX_LENGTH = 7;
    
    srand(time(NULL));
    
    past_record.layer.borderWidth = 0.1f;
    past_record.layer.cornerRadius = 8;
    past_record.layer.borderColor = [[UIColor blackColor] CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generate_button:(UIButton *)sender
{
    if(![self correct_value]) return;
    
    [self update_past_record];
    
    int min = min_value.text.intValue;
    int max = max_value.text.intValue;
    
    int res = min + random() % (max - min + 1);
    
    result_field.text = [NSString stringWithFormat:@"%d", res];
}

- (IBAction)editing_did_end:(id)sender
{
    if(![self correct_value]) return;
    
    if(![min_value.text isEqual:min_current_value] || ![max_value.text isEqual:max_current_value])
    {
        [self clear_past_record];
    }
    
    min_current_value = min_value.text;
    max_current_value = max_value.text;
}

- (void)update_past_record
{
    NSRange range = {0, NSIntegerMax};

    past_record.text = [NSString stringWithFormat:@"%@\n%@", past_record.text, result_field.text];
    [past_record setSelectedRange:range];
}

- (void)clear_past_record
{
    past_record.text = @"";
}

- (BOOL)correct_value
{
    if(min_value.text.intValue > max_value.text.intValue)
    {
        error_message.text = @"The Max has to be larger than the Min!!";
        return false;
    }
    
    if(max_value.text.length > RANDOM_NUMBER_MAX_LENGTH)
    {
        error_message.text = @"The number is too large!!";
        return false;
    }
    
    error_message.text = @"";
    return true;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

@end
