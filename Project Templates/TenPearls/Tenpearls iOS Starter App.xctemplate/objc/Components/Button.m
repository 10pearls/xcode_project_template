//  Created on ___DATE___.

#import "Button.h"
#import "Constant.h"

@implementation Button

-(void)awakeFromNib{
    [super awakeFromNib];
    NSString *font = FONT_MATRIX[self.isBold][self.isCondensed];
    self.titleLabel.font = [UIFont fontWithName:font size:self.titleLabel.font.pointSize];
    
    if(self.cornerRadius > 0)
        self.layer.cornerRadius = self.cornerRadius;
    
}

@end
