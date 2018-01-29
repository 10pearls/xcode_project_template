//___FILEHEADER___

#import "Label.h"
#import "Constant.h"

@implementation Label

-(void)awakeFromNib{
    [super awakeFromNib];
    
    NSString *font = FONT_MATRIX[self.isBold][self.isCondensed];
    
    self.font = [UIFont fontWithName:font size:self.font.pointSize];
}

@end
