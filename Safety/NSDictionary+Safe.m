//
//  NSDictionary+Safe.m
//  MLDNetwork
//
//  Created by MLD on 2018/7/19.
//  Copyright © 2018年 MLD. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import "NSObject+Swizzled.h"
@implementation NSDictionary (Safe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //
        [self swizzlingMethodWithSystemClassName:@"__NSPlaceholderDictionary" systemMethod:@selector(initWithObjects:forKeys:count:) targetClassName:@"NSDictionary" safeMethod:@selector(mld_initWithObjects:forKeys:count:)];
        
    });
}


- (instancetype)mld_initWithObjects:(id *)objs forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    
    NSUInteger c = 0;
    
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objs[i])) {
            break ;
        }
        else
        {
            c ++;
        }
    }
    return [self mld_initWithObjects:objs forKeys:keys count:c];
}

@end


























