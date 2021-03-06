//
//  BVSampleAppMainViewController.m
//  BVSampleApp
//
//  Created by Bazaarvoice Engineering on 3/10/12.
//  Copyright (c) 2012 Bazaarvoice Inc.. All rights reserved.
//

#import "BVSampleAppMainViewController.h"

@interface BVSampleAppMainViewController ()

@end

@implementation BVSampleAppMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGSize mySize;
    UIScrollView *setContentSize = (UIScrollView*)self.view;
    mySize.width = self.view.bounds.size.width;
    mySize.height = self.view.bounds.size.height;
    setContentSize.contentSize = mySize;

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    myResultsView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - BVDelegate

- (void) didReceiveResponse:(BVResponse *)response forRequest:(BVBase *)request {
    // When we get a response let's push the view controller response.
    NSLog(@"Raw Response: %@", response.rawResponse);
    if (myResultsView == nil) {
        myResultsView = [[BVSampleAppResultsViewController alloc] init];
    }
    
    myResultsView.responseToDisplay = response;
    [self.navigationController pushViewController:myResultsView animated:YES];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(BVSampleAppFlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    BVSampleAppFlipsideViewController *controller = [[BVSampleAppFlipsideViewController alloc] initWithNibName:@"BVSampleAppFlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

- (IBAction)showReview {
    BVDisplayReview *showDisplayRequest = [[BVDisplayReview alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"Id:192612";
    showDisplayRequest.parameters.include = @"Products";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];
}

- (IBAction)showQuestion {
    BVDisplayQuestion *showDisplayRequest = [[BVDisplayQuestion alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"Id:14898";
    showDisplayRequest.parameters.include = @"Answers";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];
}

- (IBAction)showAnswers {
    BVDisplayAnswer *showDisplayRequest = [[BVDisplayAnswer alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"Id:16369";
    showDisplayRequest.parameters.include = @"Questions";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];
}

- (IBAction)showStory {
    BVDisplayStories *showDisplayRequest = [[BVDisplayStories alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"ProductId:1000001";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];
}

- (IBAction)showComments {
    BVDisplayReviewComment *showDisplayRequest = [[BVDisplayReviewComment alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"reviewid:192548";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];    
}

- (IBAction)showCommentStory {
    BVDisplayStoryComment *showDisplayRequest = [[BVDisplayStoryComment alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"storyid:1593";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];    
}

- (IBAction)showProfile {
    BVDisplayProfile *showDisplayRequest = [[BVDisplayProfile alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"TotalCommentCount:gte:20";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];    
}

- (IBAction)showProducts {
    BVDisplayProducts *showDisplayRequest = [[BVDisplayProducts alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"CategoryId:eq:testcategory1011";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];
}

- (IBAction)showCateogry {
    BVDisplayCategories *showDisplayRequest = [[BVDisplayCategories alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"id:testCategory1011";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];
}

- (IBAction)showStatistics {
    BVDisplayStatistics *showDisplayRequest = [[BVDisplayStatistics alloc] init];
    [BVSettings instance].passKey = @"kuy3zj9pr3n7i0wxajrzj04xo";
    showDisplayRequest.parameters.filter = @"productid:test1,test2";
    showDisplayRequest.parameters.stats = @"Reviews,NativeReviews";
    showDisplayRequest.delegate = self;
    
    [showDisplayRequest startAsynchRequest];
}

- (IBAction)submissionReview {
    BVSubmissionReview *mySubmission = [[BVSubmissionReview alloc] init];
    mySubmission.parameters.productId = @"1000001";
    mySubmission.parameters.userId = @"123abc";
    mySubmission.parameters.rating = @"5";
    mySubmission.parameters.title = @"Test title";
    mySubmission.parameters.reviewText = @"Some kind of review text.";
    mySubmission.parameters.userNickName = @"testnickname";
    [mySubmission.parameters.videoUrl addKey:@"1" andValue:@"http://www.youtube.com/"];
    [BVSettings instance].passKey = @"2cpdrhohmgmwfz8vqyo48f52g";
    mySubmission.delegate = self;
    [mySubmission startAsynchRequest];                                  
}

- (IBAction)submissionQuestions {
    BVSubmissionQuestion *mySubmission = [[BVSubmissionQuestion alloc] init];
    mySubmission.parameters.categoryId = @"1020";
    mySubmission.parameters.userId = @"123abc";
    mySubmission.parameters.questionSummary = @"Some kind of summary";
    mySubmission.delegate = self;
    
    [BVSettings instance].passKey = @"2cpdrhohmgmwfz8vqyo48f52g";
    NSString *temp = [BVSettings instance].customerName;
    [BVSettings instance].customerName = @"answers.apitestcustomer";
    
    [mySubmission startAsynchRequest];                    
    [BVSettings instance].customerName = temp;
                                 
}

- (IBAction)submissionAnswers {
    BVSubmissionAnswer *mySubmission = [[BVSubmissionAnswer alloc] init];
    mySubmission.parameters.questionId = @"6104";
    mySubmission.parameters.userId = @"123abc";
    mySubmission.parameters.answerText = @"Some kind of answer";
    mySubmission.delegate = self;
    [BVSettings instance].passKey = @"2cpdrhohmgmwfz8vqyo48f52g";
    NSString *temp = [BVSettings instance].customerName;
    [BVSettings instance].customerName = @"answers.apitestcustomer";
    
    
    [mySubmission startAsynchRequest];    
    [BVSettings instance].customerName = temp;
}

- (IBAction)submissionStories {
    BVSubmissionStory *mySubmission = [[BVSubmissionStory alloc] init];
    mySubmission.parameters.title = @"This is the title";
    mySubmission.parameters.storyText = @"This is my story";
    mySubmission.parameters.categoryId = @"1020";
    mySubmission.parameters.userId = @"123abc";
    mySubmission.delegate = self;
    [BVSettings instance].customerName = @"stories.apitestcustomer";
    [BVSettings instance].passKey = @"2cpdrhohmgmwfz8vqyo48f52g";
    
    [mySubmission startAsynchRequest];        
}

- (IBAction)submissionComments {
    BVSubmissionReviewComment *mySubmission = [[BVSubmissionReviewComment alloc] init];    
    mySubmission.parameters.commentText = @"This is my comment text";
    mySubmission.parameters.reviewId = @"83964";
    mySubmission.parameters.userId = @"123abc";
    mySubmission.delegate = self;
    [BVSettings instance].passKey = @"2cpdrhohmgmwfz8vqyo48f52g";
    
    [mySubmission startAsynchRequest];            
}
- (IBAction)submissionPhotos {
    BVSubmissionPhoto *mySubmission = [[BVSubmissionPhoto alloc] init];
    mySubmission.parameters.contentType = @"review";
    mySubmission.parameters.userId = @"123";
    mySubmission.parameters.photo = [UIImage imageNamed:@"bv533x533.png"];
    mySubmission.delegate = self;
    [BVSettings instance].passKey = @"f5jyj7alrfvm7hh3mbykot8ui";
    [BVSettings instance].apiVersion = @"5.1";
    [BVSettings instance].customerName = @"reviews.apitestcustomer";
    [mySubmission startAsynchRequest];         
}

- (IBAction)submissionVideos {
    BVSubmissionVideo *mySubmission = [[BVSubmissionVideo alloc] init];    
    mySubmission.parameters.contentType = @"review";
    mySubmission.parameters.video = @"http://www.youtube.com/";
    mySubmission.parameters.userId = @"123abc";
    mySubmission.delegate = self;
    [BVSettings instance].passKey = @"2cpdrhohmgmwfz8vqyo48f52g";
    
    [mySubmission startAsynchRequest];                
}

- (IBAction)submissionFeedback {
    BVSubmissionFeedback *mySubmission = [[BVSubmissionFeedback alloc] init];
    mySubmission.parameters.contentType = @"review";
    mySubmission.parameters.contentId = @"83964";
    mySubmission.parameters.userId = @"123abc";
    mySubmission.parameters.feedbackType = @"helpfulness";
    mySubmission.parameters.vote = @"negative";
    mySubmission.delegate = self;
    [mySubmission startAsynchRequest];                      
}

@end