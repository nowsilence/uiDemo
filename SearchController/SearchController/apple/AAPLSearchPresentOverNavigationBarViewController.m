/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A view controller that demonstrates how to present a search controller over a navigation bar.
*/

#import "AAPLSearchPresentOverNavigationBarViewController.h"
#import "AAPLSearchResultsViewController.h"

@interface AAPLSearchPresentOverNavigationBarViewController ()

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation AAPLSearchPresentOverNavigationBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem = item;
}
#pragma mark - View Life Cycle

- (void)searchButtonClicked:(UIBarButtonItem *)sender {
    AAPLSearchResultsViewController *searchResultsController = [[AAPLSearchResultsViewController alloc] init];
    
    
    // Create the search controller and make it perform the results updating.
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    self.searchController.searchResultsUpdater = searchResultsController;
    self.searchController.hidesNavigationBarDuringPresentation = NO;

    // Present the view controller.
    [self presentViewController:self.searchController animated:YES completion:nil];
}

@end
