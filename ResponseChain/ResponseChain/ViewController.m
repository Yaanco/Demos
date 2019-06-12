//
//  ViewController.m
//  ResponseChain
//
//  Created by Yaanco on 2019/6/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()
{
    CustomButton *cornerButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    cornerButton = [[CustomButton alloc] initWithFrame:CGRectMake(100, 100, 120, 120)];
    cornerButton.backgroundColor = [UIColor redColor];
    [cornerButton addTarget:self action:@selector(clickCornerBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cornerButton];
}

- (void)clickCornerBtn:(id)sender {
    NSLog(@"%s",__func__);
}

@end
