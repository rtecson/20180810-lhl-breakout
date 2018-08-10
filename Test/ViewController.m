//
//  ViewController.m
//  Test
//
//  Created by Roland on 2018-08-10.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *percentTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    MyView *myNewView = [[MyView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    myNewView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myNewView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.amountTextField.delegate = self;
    self.percentTextField.delegate = self;
    self.amountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    
    [self.amountTextField addTarget:self
                             action:@selector(textFieldDidChange)
                   forControlEvents:UIControlEventEditingChanged];
    [self.percentTextField addTarget:self
                              action:@selector(textFieldDidChange)
                    forControlEvents:UIControlEventEditingChanged];
}

- (void)dealloc {
    [self.amountTextField removeTarget:self
                                action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.percentTextField removeTarget:self
                                 action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidChange {
    // Should do error checking
    float amount = self.amountTextField.text.floatValue;
    float percent = [self.percentTextField.text floatValue];
    float total = amount + amount * (percent / 100);
    self.totalLabel.text = [NSString stringWithFormat:@"%0.2f", total];
    NSLog(@"amount = %0.2f, percent = %0.2f, total = %0.2f", amount, percent, total);
}

// MARK: - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // There's still lots of bugs here
    if ([string isEqualToString:@"."]) {
        return YES;
    }
    return [self isNumeric:string];
}

- (BOOL)isNumeric:(NSString*)checkText {
    return [[NSScanner scannerWithString:checkText] scanDouble:NULL];
}

@end
