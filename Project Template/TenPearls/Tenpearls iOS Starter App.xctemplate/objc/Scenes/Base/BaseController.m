//  Created on ___DATE___.

#import "BaseController.h"
#import "BaseView.h"
#import "Service.h"
#import "MBProgressHUD.h"
//#import "Alert.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadView:[self getViewName]];
    [(BaseView *)self.view  viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [(BaseView *)self.view viewWillAppear];
}

-(void) viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    [(BaseView *)self.view viewDidAppear];
}

-(void) viewWillDisappear:(BOOL)animated{

    [(BaseView *)self.view viewWillDisappear];
    [super viewWillDisappear:animated];
    
}

-(void) viewDidLayoutSubviews {

    [super viewDidLayoutSubviews];
    [(BaseView *)self.view viewDidLayoutSubviews];
}

-(void)throwExceptioin:(NSString*)message{
    NSLog(@"\n%@\n",message);
    @throw message;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadServices:(NSArray*)services{
    if(service == nil)
        service = [Service get:self];
    
    [service load:services];
}

-(void)onServiceResponseFailure:(NSError*)error{
    [self hideLoader];
    //[Alert show:@"" andMessage:error.localizedDescription];
}


-(void)showLoader{
    // [MBProgressHUD showHUDAddedTo:[AppDelegate getInstance].window animated:YES];
}

-(void)showLoader:(NSString*)message{
    // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[AppDelegate getInstance].window animated:YES];
    // hud.labelText = message;
}

-(void)hideLoader{
    // [MBProgressHUD hideHUDForView:[AppDelegate getInstance].window animated:YES];
}

-(void)popToViewController:(NSString *)viewController {
    BaseController *controller = (BaseController *) NSClassFromString(viewController);

    for (UIViewController *viewController in [[self navigationController] viewControllers]) {
        if ([viewController isKindOfClass:[controller class]] ) {
            [self.navigationController popToViewController:viewController animated:YES];
        }
    }
}

-(void) popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) pushViewController:(UIViewController *)controller {

    if(![self.navigationController.topViewController isEqual:controller]){

        [self.navigationController pushViewController:controller animated:YES];
    }
}


#pragma mark -- load view

-(NSString*)getViewName{
    NSString *file = [self.class description];
    if(![file hasSuffix:@"Controller"])
        [self throwExceptioin:@"Invalid class name. Name should end with string 'controller' (e.g. SampleController)"];
    
    return [file stringByReplacingOccurrencesOfString:@"Controller" withString:@"View"];
}

-(void)loadView:(NSString*)nib{
    if([[NSBundle mainBundle] pathForResource:nib ofType:@"nib"] == nil){
        [self throwExceptioin:[NSString stringWithFormat:@"%@ nib/class not found in project.",nib]];
    }
    
    UINib *nibs    = [UINib nibWithNibName:nib bundle:nil];
    NSArray *array = [nibs instantiateWithOwner:nil options:nil];
    if(array.count == 0){
        [self throwExceptioin:[NSString stringWithFormat:@"%@ nib doesn't have any view (IB error)",nib]];
    }
    
    if(![[array objectAtIndex:0] isKindOfClass:[BaseView class]]){
        [self throwExceptioin:[NSString stringWithFormat:@"%@ nib should be subclass of %@ -> BaseView (IB error).",nib,nib]];
    }
    
    BaseView *view  = (BaseView*)[array objectAtIndex:0];
    view.controller = self;
    self.view       = view;
}

-(void) dealloc {

#if SHOW_DEALLOC_LOG == 1
    NSLog(@"Dealloc called from- %@", NSStringFromClass([self class]));
#endif
}


@end
