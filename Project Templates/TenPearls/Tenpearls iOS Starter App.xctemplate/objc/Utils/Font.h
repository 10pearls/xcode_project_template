//  Created on ___DATE___.

#import <Foundation/Foundation.h>

@interface Font : NSObject

+(UIFont*)heading;

+(UIFont*)medium;

+(UIFont*)normal;

+(UIFont*)smallFont;

+(UIFont*)button;

+ (CGFloat)getHeight:(NSString*)text andFont:(UIFont *)font andWidth:(int)width;

@end
