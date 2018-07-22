//
//  NSObject+Swizzled.m
//  MLDNetwork
//
//  Created by MLD on 2018/7/18.
//  Copyright © 2018年 MLD. All rights reserved.
//

#import "NSObject+Swizzled.h"
#import <objc/runtime.h>
@implementation NSObject (Swizzled)

+ (void)swizzlingMethodWithSystemClassName:(NSString *)systemClassName systemMethod:(SEL)systemSelector targetClassName:(NSString *)targetClassName safeMethod:(SEL)safeSelector {
    
    Class sClass = NSClassFromString(systemClassName);
    Class tClass = NSClassFromString(targetClassName);
    Method sMethod = class_getInstanceMethod(sClass, systemSelector);
    Method tMethod = class_getInstanceMethod(tClass, safeSelector);
    
    method_exchangeImplementations(sMethod, tMethod);
    
}
@end
