//
//  Transcript.m
//  SpeakHere
//
//  Created by Willie Chang on 1/27/17.
//
//

#import "Transcript.h"

@implementation Transcript

ASJTagsView *soundBitesView;
NSString *guess;
NSMutableArray *soundBites;

- (id) initWithView:(ASJTagsView *)newSoundBitesView {
    self = [super init];
    soundBitesView = newSoundBitesView;
    guess = @"";
    soundBites = [[NSMutableArray alloc] init];
    [soundBitesView setTagColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
    [soundBitesView setTapBlock:^(NSString *tagText, NSInteger idx, UIButton* tagButton)
     {
         // Check if idx (index) is within range
         if (idx < [soundBites count]) {
         
             // Show hypotheses
             NSArray *hypotheses = [[soundBites objectAtIndex:idx] objectForKey:@"hypotheses"];
         
             // Get initial selection
             int initialSelection = 0;
             for (int i = 0; i < [hypotheses count]; i++) {
                if ([[hypotheses objectAtIndex:i] isEqualToString:[[soundBites objectAtIndex:idx] objectForKey:@"currentHypothesis"]]) {
                    initialSelection = i;
                }
            }
             
             [ActionSheetStringPicker
            showPickerWithTitle: @"Select interpretation"
            rows: hypotheses
            initialSelection: initialSelection
            doneBlock: ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                // Set new current hypothesis
                NSDictionary *replacementDictionary = @{@"currentHypothesis" : [[hypotheses objectAtIndex:selectedIndex] retain], @"hypotheses" : [hypotheses retain]};
                soundBites[idx] = replacementDictionary;
                // Replace all tags
                NSMutableArray *replacementTags = [NSMutableArray array];
                for (int i = 0; i < [soundBites count]; i++) {
                    [replacementTags addObject:[[soundBites objectAtIndex:i] objectForKey:@"currentHypothesis"]];
                }
                CGPoint scrollPosition = [soundBitesView contentOffset];
                [soundBitesView replaceTags:replacementTags];
                soundBitesView.contentOffset = scrollPosition;
            }
            cancelBlock: ^(ActionSheetStringPicker *picker) {}
            origin: tagButton];
         }
     }];
    [soundBitesView setDeleteBlock:^(NSString *tagText, NSInteger idx, UIButton* tagButton)
     {
         // TODO: Drag and drop
     }];
    return self;
}

- (void) setGuess:(NSString *)text {
    // Protip: use "retain" when passing pointer of an input variable to a member variable
    // to ensure that the variable the pointer is pointing to does not get cleaned up!
    [soundBitesView deleteTag:[@"@" stringByAppendingString:guess]];
    [soundBitesView addTag:[@"@" stringByAppendingString:text]];
    guess = [text retain];
}

- (void) addFinal:(NSArray *)hypotheses {
    // Add to sound bites
    NSDictionary *soundBite = @{@"currentHypothesis" : [hypotheses[0] retain], @"hypotheses" : [hypotheses retain]};
    [soundBites addObject:soundBite];
    // Add tag
    [soundBitesView deleteTag:[@"@" stringByAppendingString:guess]];
    [soundBitesView addTag:hypotheses[0]];
    guess = @"";
    
}

@end
