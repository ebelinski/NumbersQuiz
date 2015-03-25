//
//  NumbersDatabase.m
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import "NumbersDatabase.h"
#import "Number.h"
#import "AppDelegate.h"

@implementation NumbersDatabase

static NumbersDatabase *_database;

+ (NumbersDatabase *)database
{
    if (_database == nil) {
        _database = [[NumbersDatabase alloc] init];
    }
    return _database;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *sqLiteDB = [[NSBundle mainBundle] pathForResource:@"db" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDB UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database");
        }
    }
    return self;
}

- (void)dealloc {
    //[super dealloc];
    sqlite3_close(_database);
}

- (Number *)makeNumber
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *query = nil;
    
    query = [NSString stringWithFormat:@"SELECT language, numeral, translation FROM numbers WHERE language = '%@' AND numeral BETWEEN '%@' AND '%@' ORDER BY RANDOM() LIMIT 1", [defaults objectForKey:Language], [defaults objectForKey:RangeFrom], [defaults objectForKey:RangeTo]];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_step(statement);
        
        char *numberChar = (char *)sqlite3_column_text(statement, 1);
        char *translationChar = (char *)sqlite3_column_text(statement, 2);
        
        NSString *number = [[NSString alloc] initWithUTF8String:numberChar];
        NSString *translation = [[NSString alloc] initWithUTF8String:translationChar];
        
        Number *newNumber = [[Number alloc] initWithNumeral:number translation:translation];
        
        sqlite3_finalize(statement);
        return newNumber;
    } else {
        NSLog(@"The prepare command did NOT work");
        NSLog(@"Error while creating update statement. '%s'", sqlite3_errmsg(_database));
        return nil;
    }
}

@end
