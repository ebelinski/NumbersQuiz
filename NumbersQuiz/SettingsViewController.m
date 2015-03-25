//
//  SettingsViewController.m
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *languageSelection;
@property (weak, nonatomic) IBOutlet UITextField *fromNumberField;
@property (weak, nonatomic) IBOutlet UITextField *toNumberField;

@end

@implementation SettingsViewController

- (id)init {
    self = [super init];
    
    if (self) {
        self.title = @"Settings";
        self.tabBarItem.title = @"Settings";
        UIImage *tabBarImage = [UIImage imageNamed:@"settings.png"];
        self.tabBarItem.image = tabBarImage;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.fromNumberField.text = [defaults objectForKey:RangeFrom];
    self.toNumberField.text = [defaults objectForKey:RangeTo];
    
    if ([[defaults objectForKey:Language] isEqualToString:@"Spanish"]) {
        self.languageSelection.selectedSegmentIndex = 0;
    } else if ([[defaults objectForKey:Language] isEqualToString:@"French"]) {
        self.languageSelection.selectedSegmentIndex = 1;
    } else if ([[defaults objectForKey:Language] isEqualToString:@"German"]) {
        self.languageSelection.selectedSegmentIndex = 2;
    }
}

- (IBAction)rangeEdited:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.fromNumberField.text forKey:RangeFrom];
    [defaults setObject:self.toNumberField.text forKey:RangeTo];
    
    NSLog(@"Saved range edit to %@-%@", self.fromNumberField.text, self.toNumberField.text);
    
    [self.fromNumberField resignFirstResponder];
    [self.toNumberField resignFirstResponder];
}

- (IBAction)languageChanged:(id)sender {
    [self.fromNumberField resignFirstResponder];
    [self.toNumberField resignFirstResponder];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (self.languageSelection.selectedSegmentIndex == 0) {
        [defaults setObject:@"Spanish" forKey:Language];
    } else if (self.languageSelection.selectedSegmentIndex == 1) {
        [defaults setObject:@"French" forKey:Language];
    } else if (self.languageSelection.selectedSegmentIndex == 2) {
        [defaults setObject:@"German" forKey:Language];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.fromNumberField resignFirstResponder];
    [self.toNumberField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
