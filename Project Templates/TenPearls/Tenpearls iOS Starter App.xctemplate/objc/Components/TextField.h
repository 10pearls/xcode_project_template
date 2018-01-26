//  Created on ___DATE___.

#import <UIKit/UIKit.h>


@interface TextField : UITextField<UITextFieldDelegate>

@property(nonatomic) IBInspectable BOOL isBold;
@property(nonatomic) IBInspectable BOOL isCondensed;
@property(nonatomic) IBInspectable int maxLength;
@property(nonatomic) IBInspectable BOOL isRequired;

-(void) setBorderColorRed;
-(void) setBorderColorGray;
-(BOOL) isValid;
@end
