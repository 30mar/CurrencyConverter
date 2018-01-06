//
//  ViewController.m
//  Currency Conversion App CurrencyConversionApp
//
//  Created by Macbook on 11/21/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

#import "ViewController.h"
#import "CRCurrencyRequest.h"
#import "CRCurrencyResults.h"
@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
// THE OUTLET FOR THE LABELS
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *euroRate;
@property (weak, nonatomic) IBOutlet UILabel *yenRate;
@property (weak, nonatomic) IBOutlet UILabel *poundRate;

@end

@implementation ViewController
// THE BUTTON METHOD
- (IBAction)ButtonTapped:(id)sender {
    self.convertButton.enabled = false;
    self.req = [[CRCurrencyRequest alloc]init];
    self.req.delegate = self;
    [self.req start];
    
    
    
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = true;
    double inputValue = [self.inputField.text floatValue];
    double euroValue = inputValue * currencies.EUR;
    double yenValue = inputValue * currencies.JPY;
    double englishPoundValue = inputValue * currencies.GBP;
    
    NSString *euro = [NSString stringWithFormat:@"%.2f",euroValue];
    NSString *yen = [NSString stringWithFormat:@"%.2f",yenValue];
    NSString *pound = [NSString stringWithFormat:@"%.2f",englishPoundValue];

    
    self.euroRate.text = euro;
    self.yenRate.text = yen;
    self.poundRate.text = pound;
}



@end
