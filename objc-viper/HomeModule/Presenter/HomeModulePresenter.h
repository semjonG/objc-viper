//
//  HomeModulePresenter.h
//  objc-viper
//
//  Created by SemjonG on 22/08/2022.
//  Copyright © 2022 AmoCRM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModuleViewOutput.h"
#import "HomeModuleInteractorOutput.h"
#import "HomeModuleModuleInput.h"

@protocol HomeModuleViewInput;
@protocol HomeModuleInteractorInput;
@protocol HomeModuleRouterInput;
@protocol HomeModuleModuleOutput;

@interface HomeModulePresenter : NSObject <HomeModuleModuleInput, HomeModuleInteractorOutput, HomeModuleViewOutput>

@property (nonatomic, weak) id<HomeModuleViewInput> view;
@property (nonatomic, strong) id<HomeModuleInteractorInput> interactor;
@property (nonatomic, strong) id<HomeModuleRouterInput> router;
@property (nonatomic, weak) id<HomeModuleModuleOutput> moduleOutput;

@end
