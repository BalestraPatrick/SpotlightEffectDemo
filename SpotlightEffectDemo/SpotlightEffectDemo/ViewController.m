//
//  ViewController.m
//  SpotlightEffectDemo
//
//  Created by Patrick Balestra on 8/20/13.
//  Copyright (c) 2013 Patrick Balestra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set nice wallpaper as background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaper-example.png"]];
    // Enable the scrolling
	_spotlightScrollView.scrollEnabled = YES;
    // Enable the paging that allows the snap feature
    _spotlightScrollView.pagingEnabled = YES;
    // Hide the vertical scroll indicator
    _spotlightScrollView.showsVerticalScrollIndicator = NO;
    // Specify the content size
    _spotlightScrollView.contentSize = CGSizeMake(320, 628);
    // We want to make the spotlight view 60 pxs higher but at the start, we scroll it down to hide it.
    _spotlightScrollView.contentOffset = CGPointMake(0, 60);
    // Set the delegate to self
    _spotlightScrollView.delegate = (id)self;
    
    // Just a little bit of customization of the textfield to give it a more iOS 7 style :D
    _searchTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _searchTextField.layer.masksToBounds = YES;
    _searchTextField.layer.borderWidth = 1.0;
    _searchTextField.layer.cornerRadius = 5.0;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _searchTextField.leftView = paddingView;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
}

- (IBAction)cancel:(id)sender {
    // When the user clicks cancel, we change the offset to hide the view (scrolling up of 60 pxs) and we animate it.
    [_spotlightScrollView setContentOffset:CGPointMake(0, 60) animated:YES];
    // dismiss the keyboard
    [_searchTextField resignFirstResponder];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // We detect when the searchView completely reached the screen
    if (scrollView.contentOffset.y < 0) {
        // Create the new frame of our search view to make it stay at the same position also if the user scrolls more. Note that we set the y value is the same as the content offset so the view will stay fix at the top.
        CGRect topFixFrame = CGRectMake(0, scrollView.contentOffset.y, 320, 60);
        // assign the new frame to our view
        _searchView.frame = topFixFrame;
        // we make our textfield become the first responder so that the keyboard will appear automatically
        [_searchTextField becomeFirstResponder];
    }
    // Now, if you scroll down the view will be still visible. We don't want that to happen, so we stop the content offset at 1 px before this and we keeep it at the same position.
    if (scrollView.contentOffset.y > 50) {
        // Keep the scroll view at the same position so that the searchView is hidden.
        [scrollView setContentOffset:CGPointMake(0, 60)];
        // Hide the keyboard
        [_searchTextField resignFirstResponder];
    }
}

@end
