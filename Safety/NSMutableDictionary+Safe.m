//
//  NSMutableDictionary+Safe.m
//  MLDNetwork
//
//  Created by MLD on 2018/7/19.
//  Copyright © 2018年 MLD. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"
#import "NSObject+Swizzled.h"
@implementation NSMutableDictionary (Safe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzlingMethodWithSystemClassName:@"__NSDictionaryM" systemMethod:@selector(setObject:forKey:) targetClassName:@"NSMutableDictionary" safeMethod:@selector(mld_setObject:forKey:)];
        
        [self swizzlingMethodWithSystemClassName:@"__NSDictionaryM" systemMethod:@selector(objectForKey:) targetClassName:@"NSMutableDictionary" safeMethod:@selector(mld_objectForKey:)];
        
        [self swizzlingMethodWithSystemClassName:@"__NSDictionaryM" systemMethod:@selector(removeObjectForKey:) targetClassName:@"NSMutableDictionary" safeMethod:@selector(mld_removeObjectForKey:)];
        
    });
}

- (void)mld_setObject:(id)anObj forKey:(id<NSCopying>)key {
    
    if (!anObj) {
        NSLog(@"anObj is nil");
        return;
    }
    if (!key) {
        NSLog(@"key is nil");
        return;
    }
    [self mld_setObject:anObj forKey:key];
}

- (instancetype)mld_objectForKey:(id<NSCopying>)key {
    if (!key) {
        NSLog(@"key is nil");
        return nil;
    }
    return [self mld_objectForKey:key];
}

- (void)mld_removeObjectForKey:(id<NSCopying>)key {
    if (!key) {
        NSLog(@"key is nil");
        return ;
    }
    [self mld_removeObjectForKey:key];
}

@end
