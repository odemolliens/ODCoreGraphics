//
//  ODEllipse.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 28/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import "ODEllipse.h"

#ifdef DEBUG
#define ODEll(fmt, ...) NSLog((@"ODRect:l%d: " fmt),__LINE__, ##__VA_ARGS__);
#else
#define ODEll(fmt, ...)
#endif

//Protocol
#import "ODQuartzDebug.h"

//SubComponent
#import "ODFillColor.h"
#import "ODStrokeColor.h"

@interface ODEllipse() <ODQuartzDebug>

@end

@implementation ODEllipse

#pragma mark Static

+(void)addEllipseInRect:(CGRect)newRect withContext:(CGContextRef)context
{
   CGContextAddEllipseInRect(context, newRect);
}

+(void)addEllipseInRect:(CGRect)newRect withContext:(CGContextRef)c withColor:(ODColorComponent*)colorComponent
{
   
   CGContextSaveGState(c);
   
   //Build path
   CGMutablePathRef pathEllipse = CGPathCreateMutable();
   
   //Draw Ellipse
   CGPathAddEllipseInRect(pathEllipse, NULL, newRect);
   
   //Draw Path
   CGContextAddPath(c, pathEllipse);
   
   
   if(colorComponent && [colorComponent isMemberOfClass:[ODStrokeColor class]]){
      
      //Line
      CGContextSetLineWidth(c, [[(ODStrokeColor*)colorComponent lineWidth]floatValue]);
      
      [ODStrokeColor addStrokeColorWithContext:c withRed:[[colorComponent redColor]floatValue] andGreen:[[colorComponent greenColor]floatValue] andBlue:[[colorComponent blueColor]floatValue] withAlpha:[[colorComponent alphaRatio]floatValue]];
      
      CGContextStrokePath(c);
      
   } else if(colorComponent && [colorComponent isMemberOfClass:[ODFillColor class]]){
      
      [ODFillColor addFillColorWithContext:c withRed:[[colorComponent redColor]floatValue] andGreen:[[colorComponent greenColor]floatValue] andBlue:[[colorComponent blueColor]floatValue] withAlpha:[[colorComponent alphaRatio]floatValue]];
      
      CGContextFillPath(c);
   }
   
   CGPathRelease(pathEllipse);
   CGContextRestoreGState(c);
   
}

+(void)addEllipseInRect:(CGRect)newRect withContext:(CGContextRef)c withGradient:(ODGradientColor*)gradientColor
{
   if (c != nil)  {
      
      CGContextSaveGState(c);
      
      //Build path
      CGMutablePathRef pathEllipse = CGPathCreateMutable();
      
      //Draw Ellipse
      CGPathAddEllipseInRect(pathEllipse, NULL, newRect);
      
      //Gradient
      CGGradientRef linearGradient = [ODGradientColor gradientWithColor:gradientColor];
      
      //Draw Path
      CGContextAddPath(c, pathEllipse);
      CGContextSaveGState(c);
      CGContextClip(c);
      
      //Transform
      CGAffineTransform matriceG = CGAffineTransformMake(1, 0, 0, -1, (newRect.size.width/44.3529f), (newRect.size.height/1.44438f));
      
      CGContextConcatCTM(c, matriceG);
      
      //Color Path
      CGPoint pStart, pEnd;
      
      pStart = CGPointMake(newRect.size.width/2,newRect.size.height/2);
      pEnd = CGPointMake(newRect.size.width/2,newRect.size.height/10);
      
      //Draw linear gradient
      CGContextDrawLinearGradient(c, linearGradient, pStart, pEnd, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
      
      CGGradientRelease(linearGradient), linearGradient = NULL;
      CGContextRestoreGState(c);
      
      CGPathRelease(pathEllipse);
      CGContextRestoreGState(c);
      
   }else{
      if (DEBUGMODE==kDebugOn) {
         ODEll(@"can't instanciate context");
      }
   }
}

@end
