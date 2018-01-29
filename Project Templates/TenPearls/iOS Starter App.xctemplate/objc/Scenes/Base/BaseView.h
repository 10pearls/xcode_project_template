//___FILEHEADER___

#import <UIKit/UIKit.h>

@class BaseController;

@interface BaseView : UIView

@property(nonatomic,weak) BaseController *controller;

-(void) viewDidLoad;
-(void) viewWillAppear;
-(void) viewDidAppear;
-(void) viewWillDisappear;
-(void) viewDidLayoutSubviews ;

@end
