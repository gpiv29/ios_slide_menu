//
//  MenuController.m
//
//  Created by gpiv29 on 2/27/16.
//

#import <Foundation/Foundation.h>
#import "MenuController.h"
#import "RootController.h"

@interface MenuController()
@property (nonatomic, strong) RootController* rootController;
@end

@implementation MenuController

@synthesize menu, menuData;
@synthesize rootController;

typedef enum {
    MenuSectionPeople = 0,
    MenuSectionListsOverview = 1,
    MenuSectionLists = 2,
} MenuSection;

- (void) viewDidLoad{
    [super viewDidLoad];
    
    self.rootController = (RootController*)self.parentViewController;
}

- (void) viewWillAppear:(BOOL)animated{
    [self loadMenuData];
}

-(void) loadMenuData {
    if(!self.menuData) {
        self.menuData = [[NSMutableArray alloc] init];
        
        [self.menuData addObject:[[NSMutableArray alloc] init]];
        [self.menuData addObject:[[NSMutableArray alloc] init]];
        [self.menuData addObject:[[NSMutableArray alloc] init]];
        
        //Add 'dummy' objects to represent static list overview/people overview cells
        [self.menuData[MenuSectionListsOverview] addObject:@"dummy"];
        [self.menuData[MenuSectionPeople] addObject:@"dummy"];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.menuData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menuData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = nil;
    if (indexPath.section == MenuSectionPeople){
        cell = [self.menu dequeueReusableCellWithIdentifier:@"overviewCell"];
        cell.textLabel.text = NSLocalizedString(@"People", @"");
    } else if (indexPath.section == MenuSectionListsOverview){
        cell = [self.menu dequeueReusableCellWithIdentifier:@"overviewCell"];
        cell.textLabel.text = NSLocalizedString(@"Lists", @"");
    } else {
        NSLog(@"create list cell from List model object");
        cell = [self.menu dequeueReusableCellWithIdentifier:@"listCell"];
        cell.textLabel.text = @"A List cell";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.rootController toggleMenuVisibility:nil];
    if (indexPath.section == MenuSectionListsOverview){
        [self.rootController showListsOverview];
    } else if (indexPath.section == MenuSectionPeople){
        [self.rootController showPeopleOverview];
    } else {
        //show list
    }
}

//- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
//    
//    if (sourceIndexPath.section != proposedDestinationIndexPath.section) {
//        NSInteger row = 0;
//        if (sourceIndexPath.section < proposedDestinationIndexPath.section) {
//            row = [tableView numberOfRowsInSection:sourceIndexPath.section] - 1;
//        }
//        return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
//    }
//    
//    return proposedDestinationIndexPath;
//}

@end