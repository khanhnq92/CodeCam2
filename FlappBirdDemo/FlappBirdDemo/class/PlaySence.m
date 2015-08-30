//
//  PlaySence.m
//  FlappBirdDemo
//
//  Created by ios31 on 30/08/2015.
//  Copyright (c) Năm 2015 ios31. All rights reserved.
//

#import "PlaySence.h"

@interface PlaySence ()
@property (weak, nonatomic) IBOutlet UIImageView *ongTren1;
@property (weak, nonatomic) IBOutlet UIImageView *ongTren2;
@property (weak, nonatomic) IBOutlet UIImageView *ongTren3;
@property (weak, nonatomic) IBOutlet UIImageView *ongDuoi1;
@property (weak, nonatomic) IBOutlet UIImageView *ongDuoi2;
@property (weak, nonatomic) IBOutlet UIImageView *ongDuoi3;
@property (weak, nonatomic) IBOutlet UIImageView *ground;
@property (weak, nonatomic) IBOutlet UIImageView *bg1;
@property (weak, nonatomic) IBOutlet UIImageView *bg2;
@end

@implementation PlaySence{
    UIImageView *bird;
    NSTimer* timer;
    CGFloat speedValue;
    CGRect sizeMain;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    speedValue=10;
    sizeMain=[[UIScreen mainScreen] bounds];
    [self Addsprite];
    [self animationBrid];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(running) userInfo:nil repeats:true];
}
-(void) animationBrid{
//    [UIView animateWithDuration:2 animations:^{
//        <#code#>
//    } completion:^(BOOL finished) {
//        <#code#>
//    }];
}
-(void)running{
    //chay background
    CGRect fBG1=_bg1.frame;
    CGRect fBG2=_bg2.frame;
    
    fBG1.origin.x-=speedValue;
    _bg1.frame=fBG1;
    
    fBG2.origin.x-=speedValue;
    _bg2.frame=fBG2;
    
    if (_bg1.frame.origin.x+_bg1.frame.size.width<0) {
        _bg1.frame=CGRectMake(_bg2.frame.origin.x+_bg2.frame.size.width, 0, sizeMain.size.width, sizeMain.size.height);
    }
    if (_bg2.frame.origin.x+_bg2.frame.size.width<0) {
        _bg2.frame=CGRectMake(_bg1.frame.origin.x+_bg1.frame.size.width, 0, sizeMain.size.width, sizeMain.size.height);
    }
    
    //chay ong duoi va ong tren
    _ongDuoi1.frame=CGRectMake(_ongDuoi1.frame.origin.x-speedValue, _ongDuoi1.frame.origin.y, _ongDuoi1.frame.size.width, _ongDuoi1.frame.size.height);
    _ongDuoi2.frame=CGRectMake(_ongDuoi2.frame.origin.x-speedValue, _ongDuoi2.frame.origin.y, _ongDuoi2.frame.size.width, _ongDuoi2.frame.size.height);
    _ongDuoi3.frame=CGRectMake(_ongDuoi3.frame.origin.x-speedValue, _ongDuoi3.frame.origin.y, _ongDuoi3.frame.size.width, _ongDuoi3.frame.size.height);
    
    if (_ongDuoi1.frame.origin.x+_ongDuoi1.frame.size.width<0) {
        _ongDuoi1.frame=CGRectMake(_ongDuoi3.frame.origin.x +_ongDuoi3.frame.size.width+200, _ongDuoi3.frame.origin.y,_ongDuoi1.frame.size.width, _ongDuoi1.frame.size.height);
    }
    if (_ongDuoi2.frame.origin.x+_ongDuoi2.frame.size.width<0) {
        _ongDuoi2.frame=CGRectMake(_ongDuoi1.frame.origin.x +_ongDuoi1.frame.size.width+200, _ongDuoi2.frame.origin.y,_ongDuoi2.frame.size.width, _ongDuoi2.frame.size.height);
    }
    if (_ongDuoi3.frame.origin.x+_ongDuoi3.frame.size.width<0) {
        _ongDuoi3.frame=CGRectMake(_ongDuoi2.frame.origin.x +_ongDuoi2.frame.size.width+200, _ongDuoi3.frame.origin.y,_ongDuoi3.frame.size.width, _ongDuoi3.frame.size.height);
    }
    
    _ongTren1.frame=CGRectMake(_ongTren1.frame.origin.x-speedValue, _ongTren1.frame.origin.y, _ongTren1.frame.size.width, _ongTren1.frame.size.height);
    _ongTren2.frame=CGRectMake(_ongTren2.frame.origin.x-speedValue, _ongTren2.frame.origin.y, _ongTren2.frame.size.width, _ongTren2.frame.size.height);
    _ongTren3.frame=CGRectMake(_ongTren3.frame.origin.x-speedValue, _ongTren3.frame.origin.y, _ongTren3.frame.size.width, _ongTren3.frame.size.height);
    
    if (_ongTren1.frame.origin.x+_ongTren1.frame.size.width<0) {
        _ongTren1.frame=CGRectMake(_ongTren3.frame.origin.x +_ongTren3.frame.size.width+200, _ongTren1.frame.origin.y,_ongTren1.frame.size.width, _ongTren1.frame.size.height);
    }
    if (_ongTren2.frame.origin.x+_ongTren2.frame.size.width<0) {
        _ongTren2.frame=CGRectMake(_ongTren1.frame.origin.x +_ongTren1.frame.size.width+200, _ongDuoi2.frame.origin.y,_ongTren2.frame.size.width, _ongTren2.frame.size.height);
    }
    if (_ongTren3.frame.origin.x+_ongTren3.frame.size.width<0) {
        _ongTren3.frame=CGRectMake(_ongTren1.frame.origin.x +_ongTren1.frame.size.width+200, _ongTren3.frame.origin.y,_ongTren3.frame.size.width, _ongTren3.frame.size.height);
    }
    
    

}
-(void)Addsprite{

    _bg1.frame=CGRectMake(0, 0, _bg1.frame.size.width, _bg1.frame.size.height);
    _bg2.frame=CGRectMake(sizeMain.size.width, 0, _bg2.frame.size.width, _bg2.frame.size.height);

    _ongTren1.frame=CGRectMake(sizeMain.size.width, 0, 90, 277);

    _ongTren2.frame=CGRectMake(_ongTren1.frame.origin.x+290, 0, 90, 277);

    _ongTren3.frame=CGRectMake(_ongTren2.frame.origin.x+290, 0, 90, 277);
    
    _ongDuoi1.frame=CGRectMake(_ongTren1.frame.origin.x, _ongTren1.frame.size.height+100, _ongTren1.frame.size.width, _ongTren1.frame.size.height);
    
    _ongDuoi2.frame=CGRectMake(_ongTren2.frame.origin.x,_ongTren2.frame.size.height+100,  _ongDuoi2.frame.size.width,  _ongDuoi2.frame.size.height);

    _ongDuoi3.frame=CGRectMake(_ongTren3.frame.origin.x, _ongTren3.frame.size.height+100,  _ongDuoi3.frame.size.width,  _ongDuoi3.frame.size.height);

    bird=[[UIImageView alloc] initWithFrame:CGRectMake(20,sizeMain.size.height/2,34,24)];
    bird.animationImages=@[
                           [UIImage imageNamed:@"bird1"],
                           [UIImage imageNamed:@"bird2"],
                           [UIImage imageNamed:@"bird3"]
                           ];
    bird.animationDuration=1.0;
    [self.view addSubview:bird];
    [bird startAnimating];
    
    UITapGestureRecognizer* gs=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(birdFlight)];
}
-(void)birdFlight{
    
}
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
