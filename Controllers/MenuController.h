//
//  MenuController.h
//
//  Created by gpiv29 on 2/27/16.
//

#import <UIKit/UIKit.h>


@interface MenuController : UITableViewController

@property (nonatomic, strong) IBOutlet UITableView* menu;
@property (nonatomic, strong) NSMutableArray* menuData;

@end
