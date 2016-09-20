//
//  RootController.h
//
//  Created by gpiv29 on 2/22/16.
//

#import <UIKit/UIKit.h>

@interface RootController : UIViewController

@property (nonatomic, strong) IBOutlet UIView* sidePanelView;
@property (nonatomic, strong) IBOutlet UIView* containerView;
@property (nonatomic, strong) IBOutlet UIView* shadowView;

- (void) assignMenuButtonToController:(UIViewController*)viewController;
- (void) toggleMenuVisibility:(id)sender;
- (void) showListsOverview;
- (void) showPeopleOverview;
+ (UIStoryboard*) mainStoryBoard;

@end
