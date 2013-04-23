//
//  ODEllipseBorderOut.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 25/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//
//Header
#import "ODRectangleGradientView.h"
#ifdef DEBUG
#define ODRecGradientView(fmt, ...) NSLog((@"ODRecGradientView:l%d: " fmt),__LINE__, ##__VA_ARGS__);
#else
#define ODRecGradientView(fmt, ...)
#endif

//Protocol
#import "ODQuartzView.h"
#import "ODQuartzDebug.h"
//Component
#import "ODGradientColor.h"
//Rectangle
#import "ODRectangle.h"

@interface ODRectangleGradientView() <ODQuartzView,ODQuartzDebug>
//View
-(void)awakeFromNib;
-(void)drawRect:(CGRect)rect;
@end

@implementation ODRectangleGradientView
{
   ODGradientColor *gradientColor_;
}
#pragma mark Theme management

-(ODGradientColor*)defaultTheme
{
   ODGradientColor * newGradientColor = [[[ODGradientColor alloc]init]autorelease];
   
   [newGradientColor addLocationGradientWithNSNumber:[NSNumber numberWithFloat:0]];
   [newGradientColor addLocationGradientWithNSNumber:[NSNumber numberWithFloat:1]];
   
   [newGradientColor addColorGradientWithRed:0.20f andGreen:0.400f andBlue:0.10f withAlpha:0.70f];
   [newGradientColor addColorGradientWithRed:0.5333f andGreen:0.0294f andBlue:0.7294f withAlpha:0.70f];

   return newGradientColor;
}

-(ODGradientColor*)selectTheme
{
   if (!gradientColor_) {
      gradientColor_ = [[self defaultTheme]retain];
   }
   
   return gradientColor_;
}

#pragma mark View cycle

- (void) awakeFromNib
{
   [super awakeFromNib];
   [self setAlpha:1];
}

- (void)drawRect:(CGRect)rect
{
   
   CGRect newRect = self.bounds;
   
   CGContextRef c = UIGraphicsGetCurrentContext();
   
   if (c != nil)  {
      
    [ODRectangle addRectangle:newRect withContext:c withCornerRadius:[NSNumber numberWithFloat:6] withGradient:[self selectTheme]];
      
   }else{
      if (DEBUGMODE==kDebugOn) {
         ODRecGradientView(@"can't instanciate context");
      }
   }
   
}

#pragma mark Memory management

- (void)dealloc
{
   [gradientColor_ release],gradientColor_ = nil;
   [super dealloc];
}

@end