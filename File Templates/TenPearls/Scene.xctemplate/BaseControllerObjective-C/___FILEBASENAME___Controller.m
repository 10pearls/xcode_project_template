//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_productName:identifier___View.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property(nonatomic, weak)___VARIABLE_productName:identifier___View *view;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

@dynamic view;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
