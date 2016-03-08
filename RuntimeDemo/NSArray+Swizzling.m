//
//  NSArray+Swizzling.m
//  RuntimeDemo
//
//  Created by huangyibiao on 16/1/12.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSArray+Swizzling.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"

@implementation NSArray (Swizzling)

+ (void)load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [self swizzleSelector:@selector(lastObject)
     withSwizzledSelector:@selector(hdf_lastObject)];
  });
}                      



+(void)initialize
{
    NSLog(@"initialize");

}

- (id)hdf_lastObject {
  if (self.count == 0) {
    NSLog(@"%s 数组为空，直接返回nil", __FUNCTION__);
    
    return nil;
  }
  
  return [self hdf_lastObject];
}

- (id)delegate {

  return objc_getAssociatedObject(self, @"__delegate__key");
}

- (void)setDelegate:(id)delegate {
  objc_setAssociatedObject(self, @"__delegate__key", delegate, OBJC_ASSOCIATION_ASSIGN);
}

@end
