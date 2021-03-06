//
//  BBViewController.m
//  GraphKit
//
//  Created by Benjamin Briggs on 27/01/2014.
//  Copyright (c) 2014 Benjamin Briggs. All rights reserved.
//

#import "BBViewController.h"
#import "BBLineGraph.h"
#import "BBBarGraph.h"

@interface BBViewController ()
<BBGraphDataSource,
BBLineGraphDelegate>

@property (weak, nonatomic) IBOutlet BBLineGraph *lineGraph;
@property (nonatomic, strong) NSArray *items;
@end

@implementation BBViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

    //TODO: Think about what is going to be a property and what is going to be a delegate method
    self.lineGraph.displayXAxis = YES;
    self.lineGraph.displayYAxis = YES;
    
    self.lineGraph.scaleYAxisToValues = YES;
    self.lineGraph.scaleXAxisToValues = YES;
    
    self.lineGraph.axisColor = [UIColor lightGrayColor];
    
    self.lineGraph.axisDataPointWidth = 1.f;
    
    self.lineGraph.xPadding = 5;
    self.lineGraph.yPadding = 5;
}

- (void)viewDidAppear:(BOOL)animated
{
//    [self.lineGraph animateGraph];
}

#pragma mark - BBGraphDataSource

- (NSInteger)graph:(BBGraph *)graph numberOfPointsInSeries:(NSInteger)line
{
	return 10;
}

- (CGPoint)graph:(BBGraph *)graph valueForPointAtIndex:(NSIndexPath *)indexPath
{
    return CGPointMake(indexPath.point * 100, (CGFloat) (double) arc4random_uniform(750));
}

- (NSInteger)numberOfSeriesInGraph:(BBGraph *)lineGraph
{
    if ([lineGraph isMemberOfClass:[BBBarGraph class]])
        return 1;
    
    else
        return 3;
}

- (CGFloat)graph:(BBGraph *)graph intervalOfLabelsForAxis:(BBGraphAxis)axis
{
    if (axis == BBGraphAxisY)
    {
        return 200;
    }
    return 100;
}

#pragma mark - BBGraphDelegate

- (UIColor *)graph:(BBGraph *)graph colorForSeries:(NSInteger)series
{
    switch (series) {
        case 0:
            return [UIColor colorWithHue:0.011 saturation:0.623 brightness:0.894 alpha:1.000];
            
        case 1:
            return [UIColor colorWithHue:0.583 saturation:0.673 brightness:0.600 alpha:1.000];
            
        case 2:
            return [UIColor colorWithHue:0.312 saturation:0.261 brightness:0.827 alpha:1.000];
            
        default:
            return [UIColor colorWithHue:arc4random_uniform(100)/100.0 saturation:1 brightness:1 alpha:1];
    }
}


- (NSString *)graph:(BBGraph *)graph stringForLabelAtValue:(CGFloat)value onAxis:(BBGraphAxis)axis
{
    return [NSString stringWithFormat:@"%.1f", value];
}

#pragma mark - BBLineGraphDelegate

- (CGFloat)lineGraph:(BBLineGraph *)lineGraph widthForSeries:(NSUInteger)line {
    return 1.0;
}

- (NSTimeInterval)lineGraph:(BBLineGraph *)lineGraph animationDurationForSeries:(NSUInteger)line {
    return 2;
}

- (BOOL)lineGraph:(BBLineGraph *)lineGraph shouldCurveSeries:(NSUInteger)series {
    return YES;
}

@end
