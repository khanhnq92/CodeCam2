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
    CGFloat speedValue,valueRandom , birdValueChange,jumpVelocity, fallAcceleration;;
    CGRect sizeMain;
    BOOL isJump;
    CGAffineTransform rotation,scale;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isJump=false;
    speedValue=0.8;
    valueRandom=0;
    birdValueChange=0;
    jumpVelocity=1.0;
    sizeMain=[[UIScreen mainScreen] bounds];
    [self Addsprite];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]
                     initWithTarget:self
                             action:@selector(birdFlight)]];
    
    timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(running) userInfo:nil repeats:true];
}
-(void)birdFlight{
    jumpVelocity=1.0;
    CGRect f=bird.frame;
    if (f.origin.y<=100) {
        f.origin.y=-35;
    }else
        f.origin.y-=100;
    
    [UIView animateWithDuration:0.5 animations:^{
//        if (!isJump) {
//            bird.transform = CGAffineTransformMakeRotation(-M_PI/2);
//        }
        bird.frame=f;
    } completion:^(BOOL finished) {
//        isJump=false;
//        [UIView animateWithDuration:0.5 animations:^{
//            bird.transform = CGAffineTransformMakeRotation(M_PI/2);
//        }];
    }];
}
-(void)ProcessBird{
    CGRect f=bird.frame;
    jumpVelocity+=0.01;
    f.origin.y+=jumpVelocity;
    bird.frame=f;
}
-(void)checkEndGame{
    CGRect b=[bird convertRect:bird.bounds toView:nil];
    CGRect o1=[_ongDuoi1 convertRect:_ongDuoi1.bounds toView:nil];
    CGRect o2=[_ongDuoi2 convertRect:_ongDuoi2.bounds toView:nil];
    CGRect o3=[_ongDuoi3 convertRect:_ongDuoi3.bounds toView:nil];
    CGRect o4=[_ongTren1 convertRect:_ongTren1.bounds toView:nil];
    CGRect o5=[_ongTren2 convertRect:_ongTren2.bounds toView:nil];
    CGRect o6=[_ongTren3 convertRect:_ongTren3.bounds toView:nil];
    CGRect n=[_ground convertRect:_ground.bounds toView:nil];
    BOOL od1=CGRectIntersectsRect(b,o1);
    BOOL od2=CGRectIntersectsRect(b, o2);
    BOOL od3=CGRectIntersectsRect(b, o3);
    BOOL ot1=CGRectIntersectsRect(b, o4);
    BOOL ot2=CGRectIntersectsRect(b, o5);
    BOOL ot3=CGRectIntersectsRect(b, o6);
    BOOL nen=CGRectIntersectsRect(b, n);
    if(od1||ot1){
        [timer invalidate];
//        [UIView animateWithDuration:0.8 animations:^{
//            CGRect f=bird.frame;
//            f.origin.y=sizeMain.size.height+20;
//            bird.frame=f;
//        } completion:^(BOOL finished) {
//            [bird removeFromSuperview];
//            [self viewDidLoad];
//        }];
    }
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
    if (_ongTren1.frame.origin.x+_ongTren1.frame.size.width<0) {
         valueRandom=(CGFloat)arc4random_uniform(350)-450;
        _ongTren1.frame=CGRectMake(_ongTren3.frame.origin.x +_ongTren3.frame.size.width+200,valueRandom,_ongTren1.frame.size.width, _ongTren1.frame.size.height);
    }
    else{
        _ongTren1.frame=CGRectMake(_ongTren1.frame.origin.x-speedValue, _ongTren1.frame.origin.y, _ongTren1.frame.size.width, _ongTren1.frame.size.height);
    }
    if (_ongTren2.frame.origin.x+_ongTren2.frame.size.width<0) {
         valueRandom=(CGFloat)arc4random_uniform(350)-450;
        _ongTren2.frame=CGRectMake(_ongTren1.frame.origin.x +_ongTren1.frame.size.width+200, -100,_ongTren2.frame.size.width, _ongTren2.frame.size.height);
    }else{
         _ongTren2.frame=CGRectMake(_ongTren2.frame.origin.x-speedValue, _ongTren2.frame.origin.y, _ongTren2.frame.size.width, _ongTren2.frame.size.height);
    }
    
    if (_ongTren3.frame.origin.x+_ongTren3.frame.size.width<0) {
        valueRandom=(CGFloat)arc4random_uniform(350)-450;
        _ongTren3.frame=CGRectMake(_ongTren2.frame.origin.x +_ongTren2.frame.size.width+200, valueRandom,_ongTren3.frame.size.width, _ongTren3.frame.size.height);
    }else{
          _ongTren3.frame=CGRectMake(_ongTren3.frame.origin.x-speedValue, _ongTren3.frame.origin.y, _ongTren3.frame.size.width, _ongTren3.frame.size.height);
    }

    _ongDuoi1.frame=CGRectMake(_ongTren1.frame.origin.x,_ongTren1.frame.origin.y
                               +_ongTren1.frame.size.height+100, _ongDuoi1.frame.size.width, _ongDuoi1.frame.size.height);
    
    _ongDuoi2.frame=CGRectMake(_ongTren2.frame.origin.x,_ongTren2.frame.origin.y
                               +_ongTren2.frame.size.height+100,  _ongDuoi2.frame.size.width,  _ongDuoi2.frame.size.height);
    
    _ongDuoi3.frame=CGRectMake(_ongTren3.frame.origin.x, _ongTren3.frame.origin.y
                               +_ongTren3.frame.size.height+100,  _ongDuoi3.frame.size.width,  _ongDuoi3.frame.size.height);
    
    //su ly chim
    [self ProcessBird];
    [self checkEndGame];
}

-(void)Addsprite{

    _bg1.frame=CGRectMake(0, 0, _bg1.frame.size.width, _bg1.frame.size.height);
    _bg2.frame=CGRectMake(sizeMain.size.width,0, _bg2.frame.size.width, _bg2.frame.size.height);

    _ongTren1.frame=CGRectMake(sizeMain.size.width, -100, _ongTren1.frame.size.width, _ongTren1.frame.size.height);

    _ongTren2.frame=CGRectMake(_ongTren1.frame.origin.x+290, -223, _ongTren2.frame.size.width, _ongTren2.frame.size.height);

    _ongTren3.frame=CGRectMake(_ongTren2.frame.origin.x+290, -450, _ongTren3.frame.size.width, _ongTren3.frame.size.height);
    
    _ongDuoi1.frame=CGRectMake(_ongTren1.frame.origin.x,_ongTren1.frame.origin.y
                               +_ongTren1.frame.size.height+100, _ongDuoi1.frame.size.width, _ongDuoi1.frame.size.height);
    
    _ongDuoi2.frame=CGRectMake(_ongTren2.frame.origin.x,_ongTren2.frame.origin.y
                               +_ongTren2.frame.size.height+100,  _ongDuoi2.frame.size.width,  _ongDuoi2.frame.size.height);

    _ongDuoi3.frame=CGRectMake(_ongTren3.frame.origin.x, _ongTren3.frame.origin.y
                               +_ongTren3.frame.size.height+100,  _ongDuoi3.frame.size.width,  _ongDuoi3.frame.size.height);

    bird=[[UIImageView alloc] initWithFrame:CGRectMake(20,sizeMain.size.height/2,34,24)];
    bird.animationImages=@[
                           [UIImage imageNamed:@"bird1"],
                           [UIImage imageNamed:@"bird2"],
                           [UIImage imageNamed:@"bird3"]
                           ];
    bird.animationDuration=1.0;
    [self.view addSubview:bird];
    [bird startAnimating];
    
}

@end
