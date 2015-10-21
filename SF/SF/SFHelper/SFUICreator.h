//
//  SFUICreator.h
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SFUICreator : NSObject

+ (UITableView *)SFCommonTableView:(id)delegate;
+ (UITableView *)SFCommonTableView:(id)delegate frame:(CGRect)frame;
@end
