//
//  TestViewController.m
//  TextTest
//
//  Created by renxinwei on 2022/11/25.
//

#import "TestViewController.h"
#import "UIView+YYAdd.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
        [self initSnowLayer];
    });
    [self setupViews];
}

- (void)initSnowLayer {
    // 创建粒子Layer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    // 粒子发射位置
    snowEmitter.emitterPosition = CGPointMake(self.view.width/2, -10);
    // 发射源的尺寸大小
    snowEmitter.emitterSize = self.view.bounds.size;
    // 发射模式
    snowEmitter.emitterMode = kCAEmitterLayerSurface;
    // 发射源的形状
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    // 粒子的名字
    snowflake.name = @"iapsnow";
    // 粒子参数的速度乘数因子
    snowflake.birthRate = 30.0;  //每秒生成数量
    snowflake.lifetime = 45;        //生存时间
    // 粒子速度
    snowflake.velocity = 9;
    // 粒子的速度范围
    snowflake.velocityRange = 10;
    // 粒子y方向的加速度分量
    snowflake.yAcceleration = 8;
    // 周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    // 子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents = (id)[[UIImage imageNamed:@"img_iap_snow"] CGImage];
    // 设置雪花形状的粒子的颜色
    snowflake.color = [[UIColor whiteColor] CGColor];
    //缩放范围
    snowflake.scaleRange = 0.25f;
    snowflake.scale = 0.1f;
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 0.0);
    // 粒子边缘的颜色
    snowEmitter.shadowColor = [[UIColor whiteColor] CGColor];
    // 添加粒子
    snowEmitter.emitterCells = @[snowflake];
    // 将粒子Layer添加进图层中
    [self.view.layer addSublayer:snowEmitter];
}

- (void)setupViews {
    self.view.backgroundColor = UIColor.blackColor;
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(100, 100, 100, 100);
    label.text = @"==测试==";
    label.textColor = UIColor.whiteColor;
    [self.view addSubview:label];
}

@end
