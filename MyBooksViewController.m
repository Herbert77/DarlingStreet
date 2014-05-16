//
//  MyBooksViewController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "MyBooksViewController.h"
#import "BookCell.h"
#import "SearchViewController.h"

#import "API.h"

@interface MyBooksViewController ()
{
    NSDictionary *bookInfo;
}

@end

@implementation MyBooksViewController

-(id) init
{
    if (self = [super init]) {
        
        // 添加一本书的导航button
        UIBarButtonItem *addBookItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBook:)];
        [[self navigationItem] setRightBarButtonItem:addBookItem];
        
        // 刷新表格视图的导航button
        UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
        [[self navigationItem] setLeftBarButtonItem:refresh];
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self refresh:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
     bookInfo = [[API sharedInstance] requestForBookInfo:@"1220562"];
    
}

-(void) addBook:(id)sender
{
    // TODO: addBook
    _searchViewController = [[SearchViewController alloc] init];
    _searchNavigation = [[UINavigationController alloc] initWithRootViewController:_searchViewController];
    
    // 模态视图
    [self presentViewController:_searchNavigation animated:YES completion:nil];
    
}

-(void) refresh:(id)sender
{
    // TODO: refresh
    bookInfo = [[API sharedInstance] requestForBookInfo:@"1220562"];
  
    [_tableView reloadData];
}

#pragma mark -
#pragma mark UITableView delegate and dataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // TODO: numberOfRowsInSection in mybooks
    return 5;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: the detail cell for the tableView
    static NSString *identifier = @"BookCell";
    
    BookCell *cell = (BookCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BookCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
//    cell.title.text = @"dream";
    
    // TODO: configure the data for cell
    
   
    
    cell.title.text = [bookInfo objectForKey:@"title"];
    

    
    return cell;

}

//-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        // TODO : 数据源必须在编辑后，进行修改
//        
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:YES];
//    }
//}

@end
