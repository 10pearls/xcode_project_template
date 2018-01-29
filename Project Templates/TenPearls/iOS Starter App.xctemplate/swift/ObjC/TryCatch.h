//___FILEHEADER___

#import <Foundation/Foundation.h>

typedef void (^TryCatchBlock)(void);

@interface TryCatch : NSObject

+(void)Try:(TryCatchBlock)_try Catch:(TryCatchBlock)_catch Finally:(TryCatchBlock)_finally;

@end