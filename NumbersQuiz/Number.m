//
//  Number.m
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import "Number.h"
#import "NumbersDatabase.h"

@implementation Number

- (id)initWithNumeral:(NSString *)numeral translation:(NSString *)translation
{
    self = [super init];
    if (self) {
        self.numeral = numeral;
        self.translation = translation;
    }
    return self;
}

@end
