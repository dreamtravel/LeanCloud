//
//  LCBrowserViewController.m
//  LeanCloud
//
//  Created by Mac on 15/12/1.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCBrowserViewController.h"

@interface LCBrowserViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousBarBtnItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextBarBtnItem;

// 上一页
- (IBAction)previousPage:(UIBarButtonItem *)sender;
// 上一页
- (IBAction)nextPage:(UIBarButtonItem *)sender;
// 收藏
- (IBAction)collection:(UIBarButtonItem *)sender;
// 刷新
- (IBAction)refresh:(UIBarButtonItem *)sender;

@property (nonatomic, strong) NSMutableArray *urls;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSURL *currentURL;

@end

@implementation LCBrowserViewController

- (NSMutableArray *)urls {
    if (_urls == nil) {
        _urls = [NSMutableArray array];
    }
    return _urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    self.previousBarBtnItem.enabled = NO;
    self.nextBarBtnItem.enabled = NO;
    
    // 进去控制器后开始加载传入的URL链接
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.loadStringURL]];
    [self.webView loadRequest:request];
}

- (void)loadWeb {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.urls[self.currentIndex]];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)previousPage:(UIBarButtonItem *)sender {
    NSLog(@"%s", __func__);
    if (self.currentIndex == 0) {
        self.previousBarBtnItem.enabled = NO;
        return;
    }
#warning 网页加载bug，未调试
    self.currentIndex--;
    self.nextBarBtnItem.enabled = YES;
    [self loadWeb];
}

- (IBAction)nextPage:(UIBarButtonItem *)sender {
    NSLog(@"%s", __func__);
    self.currentIndex++;
    if (self.currentIndex == self.urls.count) {
        self.nextBarBtnItem.enabled = NO;
    }
    self.previousBarBtnItem.enabled = YES;
    [self loadView];
}

- (IBAction)collection:(UIBarButtonItem *)sender {
    NSLog(@"%s", __func__);
}

- (IBAction)refresh:(UIBarButtonItem *)sender {
    NSLog(@"%s", __func__);
    [self loadView];
}

#pragma mark - WebView Delegate

// 网页开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%s", __func__);
}

// 网页加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%s", __func__);
    if ([self.urls indexOfObject:self.currentURL] == NSNotFound) {
        [self.urls addObject:self.currentURL];
        self.currentIndex++;
    }
    if (self.urls.count > 1) {
        self.previousBarBtnItem.enabled = YES;
    }
    NSLog(@"%ld, %ld", self.currentIndex, self.urls.count);
}

// 网页加载错误
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%s", __func__);
}

// 拦截web请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%@", request);
    self.currentURL = request.URL;
    return YES;
}
@end
