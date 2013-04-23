//
//  ODEllipseView.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 25/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//



//Header
#import "ODEllipseGradientMiddleView.h"

#ifdef DEBUG

   #define ODEllipseVIEW(fmt, ...) NSLog((@"ODEllipseView:l%d: " fmt),__LINE__, ##__VA_ARGS__);

#else

   #define ODEllipseVIEW(fmt, ...)

#endif

//Protocol
#import "ODQuartzView.h"
#import "ODQuartzDebug.h"

//Component
#import "ODGradientColor.h"

//Form
#import "ODEllipse.h"


@interface ODEllipseGradientMiddleView() <ODQuartzView,ODQuartzDebug>

//Theme
-(ODGradientColor*)defaultTheme;
-(ODGradientColor*)selectTheme;

//View
-(void)awakeFromNib;
-(void)drawRect:(CGRect)rect;

@end

@implementation ODEllipseGradientMiddleView
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
   
   [newEllipseColor addColorGradientWithRed:1.00f andGreen:1.00f andBlue:1.00f withAlpha:0.70f];
   [newEllipseColor addColorGradientWithRed:0.7333f andGreen:0.7294f andBlue:0.7294f withAlpha:0.70f];
   
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
      
      CGRect customRect = newRect;
      customRect.origin.x = -(newRect.size.width/5);
      customRect.origin.y = -(newRect.size.height/2);
      
      //
      CGContextSaveGState(context);
      
      //Build path
      CGMutablePathRef pathEllipse = CGPathCreateMutable();
      
      //Draw Ellipse
      CGPathAddEllipseInRect(pathEllipse, NULL, CGRectMake(-(newRect.size.width/5),-(newRect.size.height/2),newRect.size.width*1.4,newRect.size.height*1.1f));
      
      //Gradient
      CGGradientRef linearGradient = [ODGradientColor gradientWithColor:[self selectTheme]];
      
      //Color Path
      CGPoint pStart, pEnd;
      
      pStart = CGPointMake(newRect.size.width/2,newRect.size.height/2);
      pEnd = CGPointMake(newRect.size.width/2,newRect.size.height/10);
      
      //Draw Path
      CGContextAddPath(context, pathEllipse);
      CGContextSaveGState(context);
      CGContextClip(context);
      
      //Transform
      CGAffineTransform matriceG = CGAffineTransformMake(1, 0, 0, -1, (newRect.size.width/44.3529f), (newRect.size.height/1.44438f));
      
      CGContextConcatCTM(context, matriceG);
      
      //Draw linear gradient
      CGContextDrawLinearGradient(context, linearGradient, pStart, pEnd, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
      
      CGGradientRelease(linearGradient), linearGradient = NULL;
      CGContextRestoreGState(context);
      
      CGPathRelease(pathEllipse);
      CGContextRestoreGState(context);
   }else{
      if (DEBUGMODE==kDebugOn) {
         ODEllipseVIEW(@"can't instanciate context");
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
