//
//  PeopleOverviewController.m
//
//  Created by gpiv29 on 2/22/16.
//

#import <Foundation/Foundation.h>
#import "PeopleOverviewController.h"
#import "RootController.h"

@implementation PeopleOverviewController

@synthesize rootController;

- (void) viewDidLoad{
    [super viewDidLoad];
    
    if (rootController == nil){
        NSLog(@"rootController is 'nil' - viewDidLoad called before setting it");
    }
    [self setupUIComponents];
}

- (void) setupUIComponents{
    self.navigationItem.title = NSLocalizedString(@"People", @"");
    [self.rootController assignMenuButtonToController:self];
}

@end