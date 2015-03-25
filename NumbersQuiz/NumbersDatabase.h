//
//  NumbersDatabase.h
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class Number;

@interface NumbersDatabase : NSObject {
    sqlite3 *_database;
}

+ (NumbersDatabase *)database;
- (Number *)makeNumber;
//- (NSMutableArray *)getGenres;

@end
