//
//  Transcript.m
//  SpeakHere
//
//  Created by Willie Chang on 1/27/17.
//
//

#import "Transcript.h"

@implementation Transcript

ASJTagsView *sound_bites;
NSString *hypothesis;

- (id) initWithView:(ASJTagsView *)sound_bites_view {
    sound_bites = sound_bites_view;
    [sound_bites setTagColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
    [sound_bites setDeleteBlock:^(NSString *tagText, NSInteger idx)
     {
         printf("DELETE");
     }];
    return self;
}

- (void) setHypothesis:(NSString *)text {
    [sound_bites deleteTag:[@"~" stringByAppendingString:(hypothesis) ? hypothesis : @""]];
    [sound_bites addTag:[@"~" stringByAppendingString:text]];
    hypothesis = text;
}

- (void) addFinal:(NSString *)text {
    [sound_bites deleteTag:[@"~" stringByAppendingString:(hypothesis) ? hypothesis : @""]];
    [sound_bites addTag:text];
    hypothesis = nil;
}

@end
