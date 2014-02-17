//
//  MLViewController.m
//  MultiPlayerLayer
//
//  Created by Matt Long on 2/17/14.
//  Copyright (c) 2014 Matt Long. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer;
@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _player = [AVPlayer playerWithURL:[[NSBundle mainBundle] URLForResource:@"Launch" withExtension:@"mp4"]];
    
    _playerLayer = [AVPlayerLayer layer];
    
    _replicatorLayer = [CAReplicatorLayer layer];
    [_replicatorLayer setAnchorPoint:CGPointMake(0.0f, 0.0f)];
    [_replicatorLayer setBounds:CGRectMake(0.0f, 0.0f, 700.0f, 300.0f)];
    [_replicatorLayer setPosition:CGPointMake(0.0f, 44.0f)];
    [_replicatorLayer setInstanceCount:8];
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DScale(transform, 0.75, 0.75, 1.0);
    transform = CATransform3DTranslate(transform, 30.0f, 300.0f, 0.0f);

    [_replicatorLayer setInstanceTransform:transform];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    [_playerLayer setBounds:CGRectMake(0.0f, 0.0f, 700.0f, 300.0f)];
    [_playerLayer setPosition:CGPointMake(0.0f, 0.0f)];
    [_playerLayer setAnchorPoint:CGPointMake(0.0f, 0.0f)];
    
    [_replicatorLayer addSublayer:_playerLayer];
    
    [[[self view] layer] addSublayer:_replicatorLayer];
    
    [_player play];
}

@end
