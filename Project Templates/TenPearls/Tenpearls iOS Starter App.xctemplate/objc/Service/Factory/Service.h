//  Created on ___DATE___.

#import <Foundation/Foundation.h>

typedef enum {
    ServiceTypeAuth        = 0,
    ServiceTypeUser        = 1,
    CheckInTypeService     = 2,
    XYZSERVICE             = 3
}ServiceType;


@interface Service : NSObject{
    NSDictionary *_servicesMap;
    id _delegate;
}

- (void)load:(NSArray*)services;

+ (Service*)get:(id)_delegate;

@end
