//
//  RootController.m
//
//  Created by gpiv29 on 2/22/16.
//


#import "RootController.h"
#import "ListsOverviewController.h"
#import "PeopleOverviewController.h"
#import "MenuController.h"

@interface RootController()
@property (nonatomic, assign) BOOL isMenuVisible;
@property (nonatomic, strong) UINavigationController* containerNav;
@end


@implementation RootController

@synthesize sidePanelView, shadowView;
@synthesize containerNav;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //a shadowView touch will close the menu
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(handleShadowViewTap:)];
    [self.shadowView addGestureRecognizer:singleFingerTap];
}

- (void)handleShadowViewTap:(UITapGestureRecognizer *)recognizer {
    [self toggleMenuVisibility:recognizer];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //Offset the menu off the left edge
    CGRect sidePanelFrame = self.sidePanelView.frame;
    self.sidePanelView.frame = CGRectMake(0 - sidePanelFrame.size.width, sidePanelFrame.origin.y, sidePanelFrame.size.width, sidePanelFrame.size.height);
}

- (void) assignMenuButtonToController:(UIViewController*)viewController{
    UIImage* image3 = [UIImage imageNamed:@"menu.png"];
    CGRect frameimg = CGRectMake(0, 0, 37, 37);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(toggleMenuVisibility:)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem* revealMenuBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:someButton];
    
    viewController.navigationItem.leftBarButtonItem = revealMenuBarButtonItem;
}


- (void)toggleMenuVisibility:(id)sender {
    self.isMenuVisible = !self.isMenuVisible;
    
    CGRect spFrame = self.sidePanelView.frame;
    if (self.isMenuVisible) {
        //Prepare views to appear as if they are fading in
        self.shadowView.alpha = 0.0;
        self.sidePanelView.frame = CGRectMake(0 - spFrame.size.width, spFrame.origin.y, spFrame.size.width, spFrame.size.height);
        self.shadowView.hidden = NO;
        self.sidePanelView.hidden = NO;
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             //Fade in the shadowView & shift menu
                             self.shadowView.alpha = 0.7;
                             self.sidePanelView.frame = CGRectMake(0, spFrame.origin.y, spFrame.size.width, spFrame.size.height);
                         } completion:nil];
    } else {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             //Fade out the shadowView & shift menu
                             self.shadowView.alpha = 0.0;
                             self.sidePanelView.frame = CGRectMake(0 - spFrame.size.width, spFrame.origin.y, spFrame.size.width, spFrame.size.height);
                         } completion:^(BOOL finished){
                             //hide views again, so they cannot be tapped or seen on orientation change
                             self.sidePanelView.hidden = YES;
                             self.shadowView.hidden = YES;
                         }];
    }
}

- (void) showListsOverview{
    ListsOverviewController* listsOverviewConstroller = [[RootController mainStoryBoard] instantiateViewControllerWithIdentifier:@"listsOverviewController"];
    listsOverviewConstroller.rootController = self;
    //[outgoingViewController willMoveToParentViewController:nil];
    //TODO if containerNav.rootController == nil, no need to remove child?
    [self.containerNav setViewControllers:@[listsOverviewConstroller] animated:NO];
}

- (void) showPeopleOverview{
    PeopleOverviewController* peopleOverviewController = [[RootController mainStoryBoard] instantiateViewControllerWithIdentifier:@"peopleOverviewController"];
    peopleOverviewController.rootController = self;
    //[outgoingViewController willMoveToParentViewController:nil];
    [self.containerNav setViewControllers:@[peopleOverviewController] animated:NO];
}

+ (UIStoryboard*) mainStoryBoard{
    return [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"displayMenu"] || [[segue identifier] isEqualToString:@"displayContainerNav"]){
        [self addChildViewController:segue.destinationViewController];
        [segue.destinationViewController didMoveToParentViewController:self];
    }
    if ([[segue identifier] isEqualToString:@"displayContainerNav"]){
        self.containerNav = [segue destinationViewController];
    }
}

@end