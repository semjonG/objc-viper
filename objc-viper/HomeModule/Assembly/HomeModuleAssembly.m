//
//  HomeModuleAssembly.m
//  objc-viper
//
//  Created by SemjonG on 22/08/2022.
//  Copyright © 2022 AmoCRM. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeModuleAssembly.h"
#import "HomeModuleViewController.h"
#import "HomeModulePresenter.h"
#import "HomeModuleRouter.h"
#import "HomeModuleInteractor.h"

static NSString *HomeModuleViewControllerIdentifier = @"HomeModuleViewController";
static NSString *HomeModuleViewControllerStoryboardName = <#(nonnull NSString *)#>;


@interface HomeModuleAssembly ()

@property (strong, nonatomic) HomeModuleViewController *view;
@property (strong, nonatomic) HomeModulePresenter *presenter;
@property (strong, nonatomic) HomeModuleRouter *router;
@property (strong, nonatomic) HomeModuleInteractor *interactor;

@end

@implementation HomeModuleAssembly

#pragma mark - Public
+ (void)assembleModuleWithOutput:(id <HomeModuleModuleOutput>)moduleOutput transitionBlock:(void(^)(BaseRouter<HomeModuleRouterInput> *router))transitionBlock completion:(void(^)(id<HomeModuleModuleInput> input))completion {
  [[HomeModuleAssembly new] assembleModuleWithOutput:moduleOutput transitionBlock:transitionBlock completion:completion];
}

#pragma mark private instance method analog
- (void)assembleModuleWithOutput:(id <HomeModuleModuleOutput>)moduleOutput transitionBlock:(void(^)(BaseRouter<HomeModuleRouterInput> *router))transitionBlock completion:(void(^)(id<HomeModuleModuleInput> input))completion {
  [self buildComponents];
  [self configureDependenciesWithModuleOutput:moduleOutput];

  [_view setupViewReadyBlock:^{
    [self addChildComponents];
      if (completion) {
        completion(_presenter);
      }
  }];

  if (transitionBlock) {
    transitionBlock(_router);
  }
}

#pragma mark - Child components
- (void)addChildComponents {
  // Present child submodules here
}

#pragma mark - Private
#pragma mark - Dependencies
- (void)buildComponents {
  _view = [self viewHomeModule];
  _presenter = [self presenterHomeModule];
  _router = [self routerHomeModule];
  _interactor = [self interactorHomeModule];
}
- (void)configureDependenciesWithModuleOutput:(id <HomeModuleModuleOutput>)moduleOutput {
  _presenter.view = _view;
  _view.output = _presenter;

  _presenter.router = _router;
  _router.view = _view;

  _presenter.interactor = _interactor;
  _interactor.output = _presenter;

  _presenter.moduleOutput = moduleOutput;
}

#pragma mark - Factory methods
- (HomeModuleViewController *)viewHomeModule {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:HomeModuleViewControllerStoryboardName
                                                         bundle:[NSBundle mainBundle]];
  HomeModuleViewController *vc = [storyboard instantiateViewControllerWithIdentifier:HomeModuleViewControllerIdentifier];
  return vc;
}
- (HomeModulePresenter *)presenterHomeModule {
  return [[HomeModulePresenter alloc] init];
}
- (HomeModuleRouter *)routerHomeModule {
  return [[HomeModuleRouter alloc] init];
}
- (HomeModuleInteractor *)interactorHomeModule {
  return [[HomeModuleInteractor alloc] init];
}

@end
