//
//  ViewController.m
//  SimonSaysSwipeGame
//
//  Created by Vladan Randjelovic on 25/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    self.swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    self.swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    self.swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    self.swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:self.swipeLeft];
    [self.view addGestureRecognizer:self.swipeRight];
    [self.view addGestureRecognizer:self.swipeUp];
    [self.view addGestureRecognizer:self.swipeDown];
}

-(void)handleSwipe:(UISwipeGestureRecognizer *)sender {
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            self.label.text = @"Left";
            break;
        case UISwipeGestureRecognizerDirectionRight:
            self.label.text = @"Right";
            break;
        case UISwipeGestureRecognizerDirectionUp:
            self.label.text = @"Up";
            break;
        case UISwipeGestureRecognizerDirectionDown:
            self.label.text = @"Down";
            break;
    }
    
}

- (IBAction)startGame:(id)sender {
}
@end
