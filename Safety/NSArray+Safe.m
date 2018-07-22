//
//  NSArray+Safe.m
//  MLDNetwork
//
//  Created by MLD on 2018/7/18.
//  Copyright © 2018年 MLD. All rights reserved.
//

#import "NSArray+Safe.h"
#import "NSObject+Swizzled.h"
@implementation NSArray (Safe)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //
        [self swizzlingMethodWithSystemClassName:@"__NSPlaceholderArray" systemMethod:@selector(initWithObjects:count:) targetClassName:@"NSArray" safeMethod:@selector(mld_initWithObjects:count:)];
        //
        [self swizzlingMethodWithSystemClassName:@"__NSArrayI" systemMethod:@selector(objectAtIndex:) targetClassName:@"NSArray" safeMethod:@selector(mld_objectAtIndex:)];
    });
}

- (instancetype)mld_initWithObjects:(id *)objs count:(NSUInteger)count {
    
    NSUInteger c = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objs[i]) {
            break;
        }
        c ++;
    }
    return [self mld_initWithObjects:objs count:c];
}

- (instancetype)mld_objectAtIndex:(NSUInteger)index {
    
    if (index >= [self count]) {
        NSLog(@"array beyond index");
        return nil;
    }
    return [self mld_objectAtIndex:index];
}



@end
