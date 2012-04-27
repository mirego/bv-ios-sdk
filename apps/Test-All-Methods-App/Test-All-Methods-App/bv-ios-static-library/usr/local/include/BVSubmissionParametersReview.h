//
//  BVSubmissionParametersReview.h
//  bazaarvoiceSDK
//
//  Created by Bazaarvoice Engineering on 2/27/12.
//  Copyright (c) 2012 by Bazaarvoice Inc. All rights reserved.
//

#import "BVSubmissionParametersBase.h"

@interface BVSubmissionParametersReview : BVSubmissionParametersBase

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* isRecommended;
@property (nonatomic, copy) NSString* netPromoterComment;
@property (nonatomic, copy) NSString* netPromoterScore;
@property (nonatomic, copy) NSString* rating;
@property (nonatomic, strong) BVParametersType* RatingParam;
@property (nonatomic, copy) NSString* reviewText;

@end