//  Created on ___DATE___.

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject

+(BOOL)isEmptyOrNull:(NSString*)value;

+(NSString*)validateForNull:(NSString*)value;

+(BOOL)validateEmail:(NSString*)candidate;

+(NSString *) getStringFromInt:(int) integer;

@end
