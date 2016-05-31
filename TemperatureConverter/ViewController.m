//
//  ViewController.m
//  TemperatureConverter
//
//  Created by Brandon Manson on 5/31/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UILabel *finalTempLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)convertToFarenheit:(float)tempToConvert {
    _finalTemp = (tempToConvert * 9/5) + 32;
}

- (void)convertToCelcius:(float)tempToConvert {
    _finalTemp = (tempToConvert - 32) * 5/9;
}

- (void)checkForFormatAndUpdateUIWithInput:(NSString *)userInput andPerform:(NSString *)typeOfConversion {
    NSError *error;
    
    NSRegularExpression *regexForFloats = [NSRegularExpression regularExpressionWithPattern:@"^\\d+[.]\\d+$" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSRegularExpression *regexForInts = [NSRegularExpression regularExpressionWithPattern:@"^\\d+$" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSUInteger numberOfMatchesForFloats = [regexForFloats numberOfMatchesInString:userInput
                                                                         options:0
                                                                           range:NSMakeRange(0, [userInput length])];
    
    NSUInteger numberOfMatchesForInts = [regexForInts numberOfMatchesInString:userInput
                                                                          options:0
                                                                            range:NSMakeRange(0, [userInput length])];
    
    if (numberOfMatchesForFloats > 0 || (numberOfMatchesForInts > 0 && [typeOfConversion isEqualToString:@"celciusToFarenheit"])) {
        float tempToConvert = [_temperatureTextField.text floatValue];
        [self convertToFarenheit:tempToConvert];
        _finalTempLabel.text = [NSString stringWithFormat:@"%f", _finalTemp];
    } else if ((numberOfMatchesForFloats > 0) || ((numberOfMatchesForInts > 0) && [typeOfConversion isEqualToString:@"farenheitToCelcius"])) {
        float tempToConvert = [_temperatureTextField.text floatValue];
        [self convertToCelcius:tempToConvert];
        _finalTempLabel.text = [NSString stringWithFormat:@"%f", _finalTemp];
        
    } else {
        _finalTempLabel.text = @"Please enter a valid temperature";
    }
}

- (IBAction)farenheitButtonPressed:(UIButton *)sender {
    [self checkForFormatAndUpdateUIWithInput:_temperatureTextField.text andPerform:@"celciusToFarenheit"];
}

- (IBAction)celciusButtonPressed:(UIButton *)sender {
    [self checkForFormatAndUpdateUIWithInput:_temperatureTextField.text andPerform:@"farenheitToCelcius"];
}

@end
