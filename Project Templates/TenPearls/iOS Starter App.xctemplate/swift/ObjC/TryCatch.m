//  Created on 29/03/2019.

#import "TryCatch.h"

@implementation TryCatch

+(void)Try:(TryCatchBlock)_try Catch:(TryCatchBlock)_catch Finally:(TryCatchBlock)_finally {
    @try {
        _try();
    } @catch (NSException *exception) {
        _catch();
    } @finally {
        _finally();
    }
}

@end
