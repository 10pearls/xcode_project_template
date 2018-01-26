//  Created on ___DATE___.


#import <Foundation/Foundation.h>

typedef void (^successCallback)(id response);
typedef void (^failureCallback)(NSError *error);

@interface BaseService : NSObject{
    //HttpRequestManager *http;
}

@end
