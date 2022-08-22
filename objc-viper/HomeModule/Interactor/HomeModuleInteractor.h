//
//  HomeModuleInteractor.h
//  objc-viper
//
//  Created by SemjonG on 22/08/2022.
//  Copyright © 2022 AmoCRM. All rights reserved.
//

#import "HomeModuleInteractorInput.h"

@protocol HomeModuleInteractorOutput;

@interface HomeModuleInteractor : NSObject <HomeModuleInteractorInput>

@property (nonatomic, weak) id<HomeModuleInteractorOutput> output;

@end
