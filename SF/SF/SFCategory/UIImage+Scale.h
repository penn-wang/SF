//
//  UIImage+Scale.h
//  SF
//
//  Created by penn on 15/10/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;

@end
