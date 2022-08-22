//
//  HomeModuleAssembly.h
//  objc-viper
//
//  Created by SemjonG on 22/08/2022.
//  Copyright © 2022 AmoCRM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModuleModuleInput.h"
#import "HomeModuleRouterInput.h"

@protocol HomeModuleModuleOutput;

@interface HomeModuleAssembly : NSObject

+ (void)assembleModuleWithOutput:(id <HomeModuleModuleOutput>)moduleOutput transitionBlock:(void(^)(BaseRouter<HomeModuleRouterInput> *router))transitionBlock completion:(void(^)(id<HomeModuleModuleInput> input))completion;

@end
