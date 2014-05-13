//
//  SearchViewController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "SearchViewController.h"
#import "BookCell.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

-(id) init
{
    if (self = [super init]) {
    
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
        
        UIBarButtonItem *search = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBar:)];
        
        [[self navigationItem] setLeftBarButtonItem:back];
        [[self navigationItem] setRightBarButtonItem:search];
    }
    
    return self;
}

-(void) back:(id)sender
{
    [[self parentViewController] dismissViewControllerAnimated:YES completion:nil];
}

-(void) searchBar:(id)sender
{
    // TODO: searchBar
    [_mySearchDisplayController setActive:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _searchBar = [[UISearchBar alloc] init];
    [_searchBar setScopeButtonTitles:[NSArray arrayWithObjects:@"书名", @"作者名",@"ISBN", nil]];
    _searchBar.delegate = self;
    [_searchBar sizeToFit];
    

    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _searchBar;
    
    
    /*
	 fix the search bar width problem in landscape screen
	 */
	if (UIInterfaceOrientationLandscapeRight == [[UIDevice currentDevice] orientation] ||
		UIInterfaceOrientationLandscapeLeft == [[UIDevice currentDevice] orientation])
	{
		self.tableView.tableHeaderView.frame = CGRectMake(0.f, 0.f, 480.f, 44.f);
	}
	else
	{
		self.tableView.tableHeaderView.frame = CGRectMake(0.f, 0.f, 320.f, 44.f);
	}
    
    // set up the searchDisplayController programically
    _mySearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _mySearchDisplayController.delegate = self;
    _mySearchDisplayController.searchResultsDataSource = self;
    
    [self.view addSubview:_tableView];
    
}

#pragma mark -
#pragma mark UITableView delegate and dataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // TODO:
    return 4;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO:
    static NSString *identifier = @"BookCell";
    
    BookCell *cell = (BookCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BookCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.title.text = @"other";
    
    // TODO: configure the data for cell
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


#pragma mark -
#pragma mark Content Filtering

-(void) filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    //TODO:
}


#pragma mark -
#pragma mark UISearchBar and UISearchDisplayController delegate

-(BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
	 [[_mySearchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[_mySearchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // return yes to cause the search result table view to be reloaded
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
    [self filterContentForSearchText:[_mySearchDisplayController.searchBar text] scope:
	 [[_mySearchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller{
	/*
     Bob: Because the searchResultsTableView will be released and allocated automatically, so each time we start to begin search, we set its delegate here.
     */
	[_mySearchDisplayController.searchResultsTableView setDelegate:self];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
	/*
	 Hide the search bar
	 */
	[_tableView setContentOffset:CGPointMake(0, 20.f) animated:YES];
}


@end
