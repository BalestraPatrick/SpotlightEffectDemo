//
//  ViewController.h
//  SpotlightEffectDemo
//
//  Created by Patrick Balestra on 8/20/13.
//  Copyright (c) 2013 Patrick Balestra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *spotlightScrollView;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

- (IBAction)cancel:(id)sender;

@end
