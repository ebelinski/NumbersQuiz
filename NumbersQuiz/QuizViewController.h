//
//  QuizViewController.h
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Number;

@interface QuizViewController : UIViewController <UINavigationControllerDelegate>

@property (nonatomic, strong) Number * number;

- (void)setNumber;

@end
