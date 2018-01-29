//___FILEHEADER___

#import <UIKit/UIKit.h>
#import "Service.h"

@interface BaseController : UIViewController{
    Service *service;
}

-(void)loadServices:(NSArray*)services;
-(void)showLoader;
-(void)showLoader:(NSString*)message;
-(void)hideLoader;
-(void)onServiceResponseFailure:(NSError*)error;
-(void)popToViewController:(NSString *)viewController;
-(void)pushViewController:(UIViewController *)controller;
-(void)popViewController;
@end
