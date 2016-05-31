//
//  ViewController.h
//  TemperatureConverter
//
//  Created by Brandon Manson on 5/31/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic)float finalTemp;


-(void)convertToFarenheit:(float)tempToConvert;
-(void)convertToCelcius:(float)tempToConvert;
-(void)checkForFormatAndUpdateUIWithInput:(NSString *)userInput andPerform:(NSString *)typeOfConversion;

@end

