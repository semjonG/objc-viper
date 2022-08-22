//
//  HomeModuleViewController.m
//  objc-viper
//
//  Created by SemjonG on 22/08/2022.
//  Copyright © 2022 AmoCRM. All rights reserved.
//

#import "HomeModuleViewController.h"
#import "HomeModuleViewController.h"
#import "HomeModuleViewOutput.h"

@interface HomeModuleViewController ()

@property (copy, nonatomic) void (^viewReadyBlock)(void);

@end

@implementation HomeModuleViewController

- (void)setupViewReadyBlock:(void(^)(void))block {
  _viewReadyBlock = block;
}

#pragma mark - Lifecycle
- (void)viewDidLoad {
  [super viewDidLoad];
  UIView *view = self.view;
  if (view && _viewReadyBlock) {
    _viewReadyBlock();
    _viewReadyBlock = nil;
  }

  [self.output didTriggerViewReadyEvent];
}
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.output didTriggerViewWillAppearEvent];
}

#pragma mark - HomeModuleViewInput

#pragma mark - Private

@end
