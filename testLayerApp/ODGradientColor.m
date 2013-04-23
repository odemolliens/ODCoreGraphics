//
//  ODEllipseColor.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//


//Header
#import "ODGradientColor.h"

#ifdef DEBUG

#define ODGradColor(fmt, ...) NSLog((@"ODGradColor:l%d: " fmt),__LINE__, ##__VA_ARGS__);

#else

#define ODGradColor(fmt, ...)

#endif

//Protocol
#import "ODQuartzView.h"
#import "ODQuartzDebug.h"

@interface ODGradientColor() <ODQuartzDebug>

@end


@implementation ODGradientColor
{
   NSMutableArray *locationGradientList_;
   NSMutableArray *colorGradientList_;
   NSMutableArray *pathPercentList_;
}


#pragma mark Static

+(CGGradientRef)gradientWithColor:(ODGradientColor*)gradientColor
{
   //Gradient
   CGGradientRef linearGradient;
   
   //Color
   CGColorSpaceRef colorSpace;
   
   size_t locationGradientCount = [gradientColor locationGradientListCount];
   
   CGFloat locationGradientList[[gradientColor locationGradientListCount]];
   
   for (int i = 0; i < [gradientColor locationGradientListCount]; i++) {
      id value = [[gradientColor locationList] objectAtIndex:i];
      
      if (DEBUGMODE==kDebugOn) {
         if (![value isKindOfClass:[NSNumber class]]) {
            ODGradColor(@"Location array content must be only NSNumber");
         }
      }
      
      locationGradientList[i] = [value floatValue];
   }
   
   CGFloat colorGradientList[[gradientColor colorGradientListCount]];
   
   for (int i = 0; i < [gradientColor colorGradientListCount]; i++) {
      id value = [[gradientColor colorGradientList] objectAtIndex:i];
      
      if (DEBUGMODE==kDebugOn) {
         if (![value isKindOfClass:[NSNumber class]]) {
            ODGradColor(@"ColorGradientList array content must be only NSNumber");
         }
      }
      colorGradientList[i] = [value floatValue];
   }
   
   colorSpace = CGColorSpaceCreateDeviceRGB();
   
   linearGradient = CGGradientCreateWithColorComponents(colorSpace, colorGradientList, locationGradientList, locationGradientCount);
   
   CGColorSpaceRelease(colorSpace), colorSpace = NULL;
   
   return linearGradient;
}

#pragma mark Constructor

- (id)init
{
   self = [super init];
   if (self) {
      locationGradientList_ = [[NSMutableArray alloc]init];
      colorGradientList_ = [[NSMutableArray alloc]init];
      pathPercentList_ = [[NSMutableArray alloc]init];
   }
   return self;
}

- (id)initWithLocationGradientList:(NSArray*)lGl andColorGradient:(NSArray*)cGl andPathList:(NSArray*)pL
{
   self = [super init];
   if (self) {
      
      if (lGl != nil && [lGl count]>0) {
         locationGradientList_ = [[NSMutableArray alloc]initWithArray:lGl copyItems:YES];
      }else
      {
         locationGradientList_ = [[NSMutableArray alloc]init];
      }
      
      if (cGl != nil && [cGl count]>0) {
         colorGradientList_ = [[NSMutableArray alloc]initWithArray:cGl copyItems:YES];
      }else
      {
         colorGradientList_ = [[NSMutableArray alloc]init];
      }
      
      if (pL != nil && [pL count]>0) {
         pathPercentList_ = [[NSMutableArray alloc]initWithArray:pL copyItems:YES];
      }else
      {
         pathPercentList_ = [[NSMutableArray alloc]init];
      }
   }
   return self;
}

- (id)initWithMutableLocationGradientList:(NSMutableArray*)lGl andMutableColorGradient:(NSMutableArray*)cGl andPathList:(NSMutableArray*)pL
{
   self = [super init];
   if (self) {
      
      if (lGl != nil && [lGl count]>0) {
         if (DEBUGMODE==kDebugOn) {
            for (int i = 0; i < [lGl count]; i++) {
               NSAssert([[lGl objectAtIndex:i] isMemberOfClass:[NSNumber class]], @"Location array content must be only NSNumber");
            }
         }
         
         locationGradientList_ = [[NSMutableArray alloc]initWithArray:lGl copyItems:YES];
      }else
      {
         locationGradientList_ = [[NSMutableArray alloc]init];
      }
      
      if (cGl != nil && [cGl count]>0) {
         if (DEBUGMODE==kDebugOn) {
            for (int i = 0; i < [cGl count]; i++) {
               NSAssert([[cGl objectAtIndex:i] isMemberOfClass:[NSNumber class]], @"Location array content must be only NSNumber");
            }
         }
         colorGradientList_ = [[NSMutableArray alloc]initWithArray:cGl copyItems:YES];
      }else
      {
         colorGradientList_ = [[NSMutableArray alloc]init];
      }
      
      if (pL != nil && [pL count]>0) {
         pathPercentList_ = [[NSMutableArray alloc]initWithArray:pL copyItems:YES];
      }else
      {
         pathPercentList_ = [[NSMutableArray alloc]init];
      }
   }
   return self;
}

#pragma mark Public Accessor
#pragma mark Count

-(NSInteger)locationGradientListCount
{
   return [locationGradientList_ count];
}

-(NSInteger)colorGradientListCount
{
   return [colorGradientList_ count];
}

#pragma mark List

-(NSArray*)locationList
{
   return [NSArray arrayWithArray:locationGradientList_];
}

-(NSArray*)colorGradientList
{
   return [NSArray arrayWithArray:colorGradientList_];
}

-(NSArray*)pathGradientList
{
   return [NSArray arrayWithArray:pathPercentList_];
}

#pragma mark Data CompletionUtil
#pragma mark LocationGradient

-(void)addLocationGradientWithCGFloat:(CGFloat)floatNumber
{
   [locationGradientList_ addObject:[NSNumber numberWithFloat:floatNumber]];
}

-(void)addLocationGradientWithNSNumber:(NSNumber*)floatNSNumber
{
   [locationGradientList_ addObject:floatNSNumber];
}

#pragma mark ColorGradient

-(void)addColorGradientWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue withAlpha:(CGFloat)alpha
{
   [colorGradientList_ addObject:[NSNumber numberWithFloat:red]];
   [colorGradientList_ addObject:[NSNumber numberWithFloat:green]];
   [colorGradientList_ addObject:[NSNumber numberWithFloat:blue]];
   [colorGradientList_ addObject:[NSNumber numberWithFloat:alpha]];
}

-(void)addColorGradientWithRGBRed:(CGFloat)red andRGBGreen:(CGFloat)green andRGBBlue:(CGFloat)blue withAlpha:(CGFloat)alpha
{
   [colorGradientList_ addObject:[NSNumber numberWithFloat:red]];
   [colorGradientList_ addObject:[NSNumber numberWithFloat:green]];
   [colorGradientList_ addObject:[NSNumber numberWithFloat:blue]];
   [colorGradientList_ addObject:[NSNumber numberWithFloat:alpha]];
}

#pragma mark PathPercentGradient

-(void)addPathWithStart:(CGPoint)pStart andEnd:(CGPoint)pEnd andDrawMode:(ODGradientDraw*)drawMode
{
   
   NSMutableArray *newPath = [[NSMutableArray alloc]initWithCapacity:2];
   
   NSMutableArray *newArrayStartPath = [[NSMutableArray alloc]initWithCapacity:2];
   [newArrayStartPath addObject:[NSNumber numberWithFloat:pStart.x]];
   [newArrayStartPath addObject:[NSNumber numberWithFloat:pStart.y]];
   
   [newPath addObject:newArrayStartPath];
   
   [newArrayStartPath release];
   
   NSMutableArray *newArrayStartEnd = [[NSMutableArray alloc]initWithCapacity:2];
   [newArrayStartEnd addObject:[NSNumber numberWithFloat:pEnd.x]];
   [newArrayStartEnd addObject:[NSNumber numberWithFloat:pEnd.y]];
   
   [newPath addObject:newArrayStartEnd];
   
   [newArrayStartEnd release];
   
   /*NSMutableArray *newArrayDrawMode = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:drawMode], nil];
   
   [newPath addObject:newArrayDrawMode];
   
   [newArrayDrawMode release];
   */
   
   [pathPercentList_ addObject:newPath];
   
   [newPath release];
}

#pragma mark Memory Management

- (void)dealloc
{
   [pathPercentList_ release], pathPercentList_ = nil;
   [locationGradientList_ release],locationGradientList_ = nil;
   [colorGradientList_ release],colorGradientList_ = nil;
   [super dealloc];
}

@end
