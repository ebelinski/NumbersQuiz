//
//  QuizViewController.m
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import "QuizViewController.h"
#import "NumbersDatabase.h"
#import "Number.h"

@interface QuizViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numeralLabel;
@property (weak, nonatomic) IBOutlet UITextView *translationTextView;

@end

@implementation QuizViewController

- (id)init {
    self = [super init];
    
    if (self) {
        self.title = @"Quiz";
        self.tabBarItem.title = @"Quiz";
        UIImage *tabBarImage = [UIImage imageNamed:@"cottage.png"];
        self.tabBarItem.image = tabBarImage;    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNumber];
}

- (void)setNumber {
    NumbersDatabase *database = [NumbersDatabase database];
    Number *randomNumber = [database makeNumber];
    
    self.number = randomNumber;
    
    self.numeralLabel.text = self.number.numeral;
    self.translationTextView.text = @"";
}

- (IBAction)showButtonPushed:(id)sender {
    self.translationTextView.text = self.number.translation;
}

- (IBAction)nextButtonPushed:(id)sender {
    [self setNumber];
}

@end
