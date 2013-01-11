//
//  DemoViewController.h
//  ImageAnalyzer
//
//  Created by David Schimon on 1/5/13.
//  Copyright (c) 2013 David Schimon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *primary;
@property (weak, nonatomic) IBOutlet UILabel *secondary;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *background;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIButton *analyzeButton;
@property (weak, nonatomic) IBOutlet UIButton *libraryButton;

@end
