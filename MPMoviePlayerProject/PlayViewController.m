//
//  PlayViewController.m
//  MPMoviePlayerProject
//
//  Created by G.Z on 16/5/16.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import "PlayViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
//播放视频 需要导入

// audio / video AV
// core animation   CA
// media player MP
// Map kik MK
// NextStep NS
// system SC

@interface PlayViewController ()

@property (nonatomic, strong)MPMoviePlayerController *mpc;
//系统提供的控制器 专用于视频播放 由于封装度比较好 无法进行自定义 因此直接使用即可
//并不是直接使用mpc 而是使用mpc.view 将mpc.view 添加到self.view上
@end

@implementation PlayViewController

GZSingletonM(PlayViewCtr)//单例 .m文件实现


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //创建mpc 设置播放的视频的路劲
    
    //1.设置文件路劲
    //    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"积木屋的回忆._标清" ofType:@"mp4"];
    
    //路径从外部传入 传什么 就显示什么
    
    //2.创建mpc
    _mpc = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:self.filePath]];
    
    NSLog(@"*******%@",_mpc);
    
    //ContentURL 资源的路径
    
    //3.mpc的相关设置
    
    //(1)大小
    
    _mpc.view.frame = self.view.bounds;
    
    //(2)播放界面自动调整宽高（停靠模式）
    _mpc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    //(3)将mpc.view add 到 self.view
    
    [self.view addSubview:_mpc.view];
    
    //【注意】mpc.view是作为self.view的子视图 而不是直接赋值
    
    [_mpc play];
    //开始播放
    
    
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    [_mpc stop];
}

//- (void)viewWillAppear:(BOOL)animated{
//    
//    [super viewWillAppear:animated];
//    [_mpc play];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
