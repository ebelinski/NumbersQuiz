//
//  Number.h
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Number : NSObject

@property (nonatomic, copy) NSString *numeral;
@property (nonatomic, copy) NSString *translation;

- (instancetype)initWithNumeral:(NSString *)numeral translation:(NSString *)translation;

@end
