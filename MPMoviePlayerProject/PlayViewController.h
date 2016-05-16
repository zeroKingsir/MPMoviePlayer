//
//  PlayViewController.h
//  MPMoviePlayerProject
//
//  Created by G.Z on 16/5/16.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZSingle.h"

@interface PlayViewController : UIViewController
GZSingletonH(PlayViewCtr)
@property (nonatomic,copy)NSString *filePath;
//传递一个视频资源路径 供当前控制器播放
@end
