//
//  ODQuartzDebug.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG

   #define DEBUGMODE 1

#else

   #define DEBUGMODE 0

#endif

#define kDebugOn 1
#define kDebugOff 0

@protocol ODQuartzDebug <NSObject>

@end
