//
//  DetailViewController.m
//  NavigationBarTest
//
//  Created by likid1412 on 10/16/14.
//  Copyright (c) 2014 Likid. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self addSubviews];

    self.view.backgroundColor = [UIColor redColor];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSubviews
{
    CGFloat heightOfStatusBar = 20.f;
    CGFloat heightOfNavigationBar = 44.f;

    UIToolbar *topBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, heightOfStatusBar + heightOfNavigationBar)];
    [topBar setBackgroundImage:[[UIImage alloc] init] forToolbarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];

    CGFloat margin = 10.f;

    UIButton *leftBarButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(margin, heightOfStatusBar, 0, 0)];
    [leftBarButtonItem setTitle:@"Back" forState:UIControlStateNormal];
    [leftBarButtonItem addTarget:self action:@selector(onLeftBarItemTaped:) forControlEvents:UIControlEventTouchUpInside];
    [leftBarButtonItem sizeToFit];

    UIButton *rightBarButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) - CGRectGetWidth(leftBarButtonItem.frame) - margin, heightOfStatusBar, 0, 0)];
    [rightBarButtonItem setTitle:@"Right" forState:UIControlStateNormal];
    [rightBarButtonItem addTarget:self action:@selector(onRightBarItemTaped:) forControlEvents:UIControlEventTouchUpInside];
    [rightBarButtonItem sizeToFit];

    CGRect frame = rightBarButtonItem.frame;
    frame.origin.x = CGRectGetWidth(self.view.frame) - CGRectGetWidth(leftBarButtonItem.frame) - margin;
    rightBarButtonItem.frame = frame;

    [topBar addSubview:leftBarButtonItem];
    [topBar addSubview:rightBarButtonItem];


    [self.view addSubview:topBar];
}

- (void)onLeftBarItemTaped:(UIBarButtonItem *)item
{
    NSLog(@"%@", item);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onRightBarItemTaped:(UIBarButtonItem *)item
{
    [[[UIAlertView alloc] initWithTitle:@"Taped Right" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
