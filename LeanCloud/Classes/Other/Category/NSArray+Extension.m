//
//  NSArray+Extension.m
//  Category
//
//  Created by Mac on 15/11/24.
//  Copyright © 2015年 Mac mini. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}

@end
