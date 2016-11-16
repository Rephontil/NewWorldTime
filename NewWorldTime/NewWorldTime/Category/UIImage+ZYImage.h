//
//  UIImage+ZYImage.h
//  NewWorldTime
//
//  Created by ZhouYong on 16/11/16.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZYImage)

/**
 返回image最原始的样式（用于阻止系统帮我们渲染图片）

 @param imageName 要传入的图片名称
 @return 最原始的图片（不被渲染）
 */
+ (UIImage *)imageWithRenderingModelAlwaysOriginalWithImageName:(NSString *)imageName;

@end