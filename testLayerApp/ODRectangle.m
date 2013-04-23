//
//  ODRectangle.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 28/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import "ODRectangle.h"

#ifdef DEBUG
#define ODRect(fmt, ...) NSLog((@"ODRect:l%d: " fmt),__LINE__, ##__VA_ARGS__);
#else
#define ODRect(fmt, ...)
#endif

//Protocol
#import "ODQuartzDebug.h"

//SubComponent
#import "ODFillColor.h"
#import "ODStrokeColor.h"

@interface ODRectangle() <ODQuartzDebug>

@end

@implementation ODRectangle

#pragma mark static methods

+(void)addRectangle:(CGRect)newRect withContext:(CGContextRef)c withCornerRadius:(NSNumber*)cornerRadius withGradient:(ODGradientColor*)gradientColor
{
   if (c != nil)  {
      
      CGContextSaveGState(c);
      
      CGMutablePathRef pathRoundedRec = [self roundedPathFromRectWith:c and:newRect andCornerRadius:[cornerRadius floatValue]];
      
      //Gradient
      CGGradientRef linearGradient = [ODGradientColor gradientWithColor:gradientColor];

      //Draw Path
      CGContextAddPath(c, pathRoundedRec);
      CGContextSaveGState(c);
      CGContextClip(c);
      
      //Transform
      CGAffineTransform matriceG = CGAffineTransformMake(1, 0, 0, -1, (newRect.size.width/44.3529f), (newRect.size.height/1.44438f));
      
      CGContextConcatCTM(c, matriceG);
      
      //////
      
      if([[gradientColor pathGradientList]count]>0){
         for (int i = 0; i < [[gradientColor pathGradientList]count]; i++) {
            
            //Color Path
            CGPoint pStart, pEnd;
            
            NSMutableArray *array = [[gradientColor pathGradientList]objectAtIndex:i];
            
            //CGPoint start
            pStart = CGPointMake([[[array objectAtIndex:0]objectAtIndex:0]floatValue],[[[array objectAtIndex:0]objectAtIndex:1]floatValue]);
            
            //CGPoint end
            pEnd = CGPointMake([[[array objectAtIndex:1]objectAtIndex:0]floatValue],[[[array objectAtIndex:1]objectAtIndex:1]floatValue]);
            
            //CGGradientDrawingOptions
            [array objectAtIndex:2];
            
            if([[array objectAtIndex:2] count]>0) {
               CGGradientDrawingOptions total = [[[array objectAtIndex:2]objectAtIndex:0]intValue];
               
               for (int j = 1; j < [[array objectAtIndex:2]count]; j++) {
                  total |= [[[array objectAtIndex:2]objectAtIndex:i]intValue];
               }
               
               CGContextDrawLinearGradient(c, linearGradient, pStart, pEnd, total);
            }
            
                       
            
            
            //Draw linear gradient
            
         }
      }
      
      //
      
      //Color Path
      CGPoint pStart, pEnd;
      
      pStart = CGPointMake(newRect.size.width/2,newRect.size.height/2);
      pEnd = CGPointMake(newRect.size.width/2,newRect.size.height/10);
      
      //Draw linear gradient
      CGContextDrawLinearGradient(c, linearGradient, pStart, pEnd, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);

      CGGradientRelease(linearGradient), linearGradient = NULL;
      CGContextRestoreGState(c);
      
      CGPathRelease(pathRoundedRec);
      CGContextRestoreGState(c);
      
   }else{
      if (DEBUGMODE==kDebugOn) {
         ODRect(@"can't instanciate context");
      }
   }
}

+(void)addRectangle:(CGRect)newRect withContext:(CGContextRef)c withCornerRadius:(NSNumber*)cornerRadius withColor:(ODColorComponent*)colorComponent
{
   if (c != nil)  {
      
      CGContextSaveGState(c);
      
      CGMutablePathRef pathRoundedRec = [self roundedPathFromRectWith:c and:newRect andCornerRadius:[cornerRadius floatValue]];
      
      //Add path
      CGContextAddPath(c, pathRoundedRec);
      
      
      if(colorComponent && [colorComponent isMemberOfClass:[ODStrokeColor class]]){
         
         //Line
         CGContextSetLineWidth(c, [[(ODStrokeColor*)colorComponent lineWidth]floatValue]);
         
         [ODStrokeColor addStrokeColorWithContext:c withRed:[[colorComponent redColor]floatValue] andGreen:[[colorComponent greenColor]floatValue] andBlue:[[colorComponent blueColor]floatValue] withAlpha:[[colorComponent alphaRatio]floatValue]];
         
          CGContextStrokePath(c);
         
      } else if(colorComponent && [colorComponent isMemberOfClass:[ODFillColor class]]){
         
         [ODFillColor addFillColorWithContext:c withRed:[[colorComponent redColor]floatValue] andGreen:[[colorComponent greenColor]floatValue] andBlue:[[colorComponent blueColor]floatValue] withAlpha:[[colorComponent alphaRatio]floatValue]];
         
         CGContextFillPath(c);
      }

      CGPathRelease(pathRoundedRec);
      CGContextRestoreGState(c);
      
   }else{
      if (DEBUGMODE==kDebugOn) {
         ODRect(@"can't instanciate context");
      }
   }
}

+(CGMutablePathRef)roundedPathFromRectWith:(CGContextRef)ctx and:(CGRect)rect andCornerRadius:(int)cornerRadius {
   
   CGMutablePathRef newPath = CGPathCreateMutable();
   
   float x_left = rect.origin.x;
   float x_left_center = x_left + cornerRadius;
   float x_right_center = x_left + rect.size.width - cornerRadius;
   float x_right = x_left + rect.size.width;
   float y_top = rect.origin.y;
   float y_top_center = y_top + cornerRadius;
   float y_bottom_center = y_top + rect.size.height - cornerRadius;
   float y_bottom = y_top + rect.size.height;
   
   if (cornerRadius >= 2.0f) {
      
      CGPathMoveToPoint(newPath,NULL, x_left, y_top_center);
      
      // First corner
      CGPathAddArcToPoint(newPath,NULL, x_left, y_top, x_left_center, y_top, cornerRadius);
      CGPathAddLineToPoint(newPath,NULL, x_right_center, y_top);
      
      // Second corner
      CGPathAddArcToPoint(newPath,NULL, x_right, y_top, x_right, y_top_center, cornerRadius);
      CGPathAddLineToPoint(newPath,NULL, x_right, y_bottom_center);
      
      // Third corner
      CGPathAddArcToPoint(newPath,NULL, x_right, y_bottom, x_right_center, y_bottom, cornerRadius);
      CGPathAddLineToPoint(newPath,NULL, x_left_center, y_bottom);
      
      // Fourth corner
      CGPathAddArcToPoint(newPath,NULL, x_left, y_bottom, x_left, y_bottom_center, cornerRadius);
      CGPathAddLineToPoint(newPath,NULL, x_left, y_top_center);
      
   }else{
      CGPathAddLineToPoint(newPath,NULL, 0, 0);
   }
   
   
   CGPathCloseSubpath(newPath);
   
   return newPath;
}
@end
