//
//  NSObject+Swizzled.h
//  MLDNetwork
//
//  Created by MLD on 2018/7/18.
//  Copyright © 2018年 MLD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzled)

+ (void)swizzlingMethodWithSystemClassName:(NSString *)systemClassName systemMethod:(SEL)systemSelector targetClassName:(NSString *)targetClassName safeMethod:(SEL)safeSelector;

@end
