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
NSString *guess;

- (id) initWithView:(ASJTagsView *)sound_bites_view {
    self = [super init];
    sound_bites = sound_bites_view;
    guess = [[NSString alloc] init];
    guess = @"";
    [sound_bites setTagColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
    [sound_bites setDeleteBlock:^(NSString *tagText, NSInteger idx)
     {
         printf("DELETE");
     }];
    return self;
}

- (void) setGuess:(NSString *)text {
    [sound_bites deleteTag:[@"~" stringByAppendingString:guess]];
    [sound_bites addTag:[@"~" stringByAppendingString:text]];
    guess = text;
}

- (void) addFinal:(NSArray *)hypotheses {
    [sound_bites deleteTag:[@"~" stringByAppendingString:guess]];
    [sound_bites addTag:hypotheses[0]];
    guess = @"";
}

@end
