//====================================================================================================
// Author: Peter Chen
// Created: 6/10/14
// Copyright 2014 pchensoftware
//====================================================================================================

#import "UIViewController+PCSUtils.h"
#import <objc/runtime.h>

#define kPCSUtilsViewControllerHasAppeared "kPCSUtilsViewControllerHasAppeared"

@implementation UIViewController (PCSUtils)

- (BOOL)controllerHasAppeared {
   return [objc_getAssociatedObject(self, kPCSUtilsViewControllerHasAppeared) boolValue];
}

- (void)setControllerHasAppeared:(BOOL)controllerHasAppeared {
   objc_setAssociatedObject(self, kPCSUtilsViewControllerHasAppeared, @(controllerHasAppeared), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)dismissOrPopController {
   if ([self.navigationController.viewControllers count] == 1)
      [self dismissViewControllerAnimated:YES completion:nil];
   
   else
      [self.navigationController popViewControllerAnimated:YES];
}

@end
