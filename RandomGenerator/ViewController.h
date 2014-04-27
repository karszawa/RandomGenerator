//
//  ViewController.h
//  RandomGenerator
//
//  Created by Cubic on 2013/04/13.
//  Copyright (c) 2013年 Cubic. All rights reserved.
//

/*
 - 重複取り除き機能
 - 重複取り除き課金
 - 広告
 * 値の不正チェック
 * デザイン
 * アイコン
 * 横回転対応
 */

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

- (IBAction)generate_button:(UIButton *)sender;
- (IBAction)editing_did_end:(id)sender;
- (BOOL)shouldAutorotate;

@property (weak, nonatomic) IBOutlet UITextField *min_value;
@property (weak, nonatomic) IBOutlet UITextField *max_value;
@property (weak, nonatomic) IBOutlet UILabel *result_field;
@property (weak, nonatomic) IBOutlet UITextView *past_record;
@property (weak, nonatomic) IBOutlet UILabel *error_message;

@end
