////  ODEllipseBorderOut.m//  testLayerApp////  Created by Olivier Demolliens on 25/10/12.//  Copyright (c) 2012 ostalgo. All rights reserved.////Header#import "ODRectangleFillView.h"#ifdef DEBUG#define ODRectFillView(fmt, ...) NSLog((@"ODEllipseBorderOut:l%d: " fmt),__LINE__, ##__VA_ARGS__);#else#define ODRectFillView(fmt, ...)#endif//Protocol#import "ODQuartzView.h"#import "ODQuartzDebug.h"//Component#import "ODFillColor.h"//Rectangle#import "ODRectangle.h"@interface ODRectangleFillView() <ODQuartzView,ODQuartzDebug>//Theme-(ODFillColor*)defaultTheme;-(ODFillColor*)selectTheme;//View-(void)awakeFromNib;-(void)drawRect:(CGRect)rect;@end@implementation ODRectangleFillView{   ODFillColor *fillColor_;}#pragma mark Theme management-(ODFillColor*)defaultTheme{   ODFillColor * newFillColor = [[[ODFillColor alloc]initWithRed:0.9333 andGreen:0.4784 andBlue:0.2000 withAlpha:1.000]autorelease];      return newFillColor;}-(ODFillColor*)selectTheme{   if (!fillColor_) {      fillColor_ = [[self defaultTheme]retain];   }      return fillColor_;}#pragma mark View cycle- (void) awakeFromNib{   [super awakeFromNib];   [self setAlpha:1];}- (void)drawRect:(CGRect)rect{      CGRect newRect = self.bounds;      CGContextRef c = UIGraphicsGetCurrentContext();      if (c != nil)  {            [ODRectangle addRectangle:newRect withContext:c withCornerRadius:[NSNumber numberWithFloat:6] withColor:[self selectTheme]];         }else{      if (DEBUGMODE==kDebugOn) {         ODRectFillView(@"can't instanciate context");      }   }      }#pragma mark Memory management- (void)dealloc{   [fillColor_ release],fillColor_ = nil;   [super dealloc];}@end