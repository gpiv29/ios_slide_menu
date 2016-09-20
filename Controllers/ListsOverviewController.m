//
//  ViewController.m
//
//  Created by gpiv29 on 2/21/16.
//

#import "ListsOverviewController.h"
#import "RootController.h"

@implementation ListsOverviewController

@synthesize rootController;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (rootController == nil){
        NSLog(@"ListsOverviewController accessing rootController through parent/child relationship (done when initialized via segue)");
        self.rootController = (RootController*)self.parentViewController.parentViewController;
    }
    [self setupUIComponents];
}

- (void) setupUIComponents{
    self.navigationItem.title = NSLocalizedString(@"Lists", @"");
    [self.rootController assignMenuButtonToController:self];
}

@end
