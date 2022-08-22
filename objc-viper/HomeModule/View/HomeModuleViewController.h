//
//  HomeModuleViewController.h
//  objc-viper
//
//  Created by SemjonG on 22/08/2022.
//  Copyright © 2022 AmoCRM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModuleViewInput.h"

@protocol HomeModuleViewOutput;

@interface HomeModuleViewController : UIViewController <HomeModuleViewInput>

@property (nonatomic, strong) id<HomeModuleViewOutput> output;

- (void)setupViewReadyBlock:(void(^)(void))block;

@end
