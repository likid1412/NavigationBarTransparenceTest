//
//  DetailViewController.h
//  NavigationBarTest
//
//  Created by likid1412 on 10/16/14.
//  Copyright (c) 2014 Likid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

