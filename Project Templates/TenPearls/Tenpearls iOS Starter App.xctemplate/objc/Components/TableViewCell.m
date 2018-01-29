//___FILEHEADER___

#import "TableViewCell.h"

@implementation TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        NSString *fileName = [self.class description];
        if(![fileName isEqualToString:NSStringFromClass([UITableView class])]){
            NSArray *views = [[NSBundle mainBundle] loadNibNamed:fileName owner:self options:nil];
            if(views != nil)
                self = [views lastObject];
        }
    }
    return self;
}



@end
