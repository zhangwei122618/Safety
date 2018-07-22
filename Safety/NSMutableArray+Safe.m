//
//  NSMutableArray+Safe.m
//  MLDNetwork
//
//  Created by MLD on 2018/7/18.
//  Copyright © 2018年 MLD. All rights reserved.
//

#import "NSMutableArray+Safe.h"
#import "NSObject+Swizzled.h"
@implementation NSMutableArray (Safe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //
        [self swizzlingMethodWithSystemClassName:@"__MSArrayM" systemMethod:@selector(objectAtIndex:) targetClassName:@"NSMutableArray" safeMethod:@selector(mld_objectAtIndex:)];
        // add
        [self swizzlingMethodWithSystemClassName:@"__NSArrayM" systemMethod:@selector(addObject:) targetClassName:@"NSMutableArray" safeMethod:@selector(mld_addObject:)];
        // insert
        
        [self swizzlingMethodWithSystemClassName:@"__NSArrayM" systemMethod:@selector(insertObject:atIndex:) targetClassName:@"NSMutableArray" safeMethod:@selector(mld_insertObject:atIndex:)];
        // remove at index
        [self swizzlingMethodWithSystemClassName:@"__NSArrayM" systemMethod:@selector(removeObjectAtIndex:) targetClassName:@"NSMutableArray" safeMethod:@selector(mld_removeObjectAtIndex:)];
        // remove obj
        [self swizzlingMethodWithSystemClassName:@"__NSArrayM" systemMethod:@selector(removeObject:) targetClassName:@"NSMutableArray" safeMethod:@selector(mld_removeObject:)];
        
        // replace
        [self swizzlingMethodWithSystemClassName:@"__NSArrayM" systemMethod:@selector(replaceObjectAtIndex:withObject:) targetClassName:@"NSMutableArray" safeMethod:@selector(mld_replaceObjectAtIndex:withObject:)];
        
    });
}

//
- (instancetype)mld_objectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        NSLog(@"beyond index");
        return nil;
    }
    return [self mld_objectAtIndex:index];
}

// add
- (void)mld_addObject:(id)anObj {
    if (!anObj) {
        return ;
    }
    [self mld_addObject:anObj];
}

// insert
- (void)mld_insertObject:(id)anObjc atIndex:(NSUInteger)index {
    if (index > [self count]) {
        NSLog(@"insert obj beyond index");
        return ;
    }
    if (!anObjc) {
        return ;
    }
    
    [self mld_insertObject:anObjc atIndex:index];
}


// remove At index
- (void)mld_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        NSLog(@"remove beyond index");
        return;
    }
    [self mld_removeObjectAtIndex:index];
}

// remove obj

- (void)mld_removeObject:(id)anObj {
    if (!anObj) {
        NSLog(@"remove anObj is nil");
        return ;
    }
    [self mld_removeObject:anObj];
}
// replace
- (void)mld_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObj {
    
    if (index >= [self count]) {
        NSLog(@"replace beyond index");
        return ;
    }
    if (!anObj) {
        NSLog(@"replace obj is nil");
        return ;
    }
    [self mld_replaceObjectAtIndex:index withObject:anObj];
}


@end






































