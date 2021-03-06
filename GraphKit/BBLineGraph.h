//
//  BBLineGraph.h
//  GraphKit
//
//  Created by Benjamin Briggs on 27/01/2014.
//  Copyright (c) 2014 Benjamin Briggs. All rights reserved.
//

#import "BBGraph.h"

@class BBLineGraph;

@protocol BBLineGraphDelegate <BBGraphDelegate>

@optional
- (CGFloat)lineGraph:(BBLineGraph *)lineGraph widthForSeries:(NSUInteger)series;

//The number of length of time (seconds) it takes to draw each line.  If you implement this method you must call -animateGraph;
- (NSTimeInterval)lineGraph:(BBLineGraph *)lineGraph animationDurationForSeries:(NSUInteger)series;

//Whether or not the line is curved
- (BOOL)lineGraph:(BBLineGraph *)lineGraph shouldCurveSeries:(NSUInteger)series;

- (BOOL)lineGraph:(BBLineGraph *)lineGraph shouldPlotNegativeValuesForSeries:(NSUInteger)series;
@end

@interface BBLineGraph : BBGraph

@property (nonatomic, weak) IBOutlet id<BBLineGraphDelegate> delegate;

@end