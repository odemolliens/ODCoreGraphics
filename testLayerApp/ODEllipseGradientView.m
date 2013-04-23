//
//  ODEllipseView.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 25/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//



//Header
#import "ODEllipseGradientView.h"

#ifdef DEBUG

#define ODEllMiddleView(fmt, ...) NSLog((@"ODEllipseView:l%d: " fmt),__LINE__, ##__VA_ARGS__);

#else

#define ODEllMiddleView(fmt, ...)

#endif

//Protocol
#import "ODQuartzView.h"
#import "ODQuartzDebug.h"

//Component
#import "ODGradientColor.h"

//Form
#import "ODEllipse.h"


@interface ODEllipseGradientView() <ODQuartzView,ODQuartzDebug>

//Theme
-(ODGradientColor*)defaultTheme;
-(ODGradientColor*)selectTheme;

//View
-(void)awakeFromNib;
-(void)drawRect:(CGRect)rect;

@end

@implementation ODEllipseGradientView
{
   ODGradientColor *ellipseColor_;
}

#pragma mark Public Accessor

-(void)setEllipseColor:(ODGradientColor*)newEllipseColor
{
   if (ellipseColor_) {
      [ellipseColor_ release],ellipseColor_ = nil;
   }
   
   if (newEllipseColor) {
      ellipseColor_ = [newEllipseColor retain];
   }else{
      ellipseColor_ = [[self defaultTheme]retain];
   }
   
}

#pragma mark Theme management

-(ODGradientColor*)defaultTheme
{
   ODGradientColor * newEllipseColor = [[[ODGradientColor alloc]init]autorelease];
   
   [newEllipseColor addLocationGradientWithNSNumber:[NSNumber numberWithFloat:0]];
   [newEllipseColor addLocationGradientWithNSNumber:[NSNumber numberWithFloat:1]];
   
   [newEllipseColor addColorGradientWithRed:1.00f andGreen:0.60f andBlue:1.00f withAlpha:0.70f];
   [newEllipseColor addColorGradientWithRed:0.7333f andGreen:0.2294f andBlue:0.2294f withAlpha:0.70f];
   
   return newEllipseColor;
}

-(ODGradientColor*)selectTheme
{
   if (!ellipseColor_) {
      ellipseColor_ = [[self defaultTheme]retain];
   }
   
   return ellipseColor_;
}

#pragma mark View cycle

-(void)awakeFromNib
{
   [super awakeFromNib];
   [self setAlpha:1];
}

-(void)drawRect:(CGRect)rect
{
   
   CGRect newRect = self.bounds;
   
   CGContextRef context = UIGraphicsGetCurrentContext();
   
   if (context != nil)  {
      
      [ODEllipse addEllipseInRect:newRect withContext:context withGradient:[self selectTheme]];
      
   }else{
      if (DEBUGMODE==kDebugOn) {
         ODEllMiddleView(@"can't instanciate context");
      }
   }
   
}

#pragma mark Memory management

- (void)dealloc
{
   [ellipseColor_ release],ellipseColor_ = nil;
   [super dealloc];
}

@end
