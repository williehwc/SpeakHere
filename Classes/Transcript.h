//
//  Transcript.h
//  SpeakHere
//
//  Created by Willie Chang on 1/27/17.
//
//

#import <Foundation/Foundation.h>
#import "ASJTagsView.h"
#import "ActionSheetPicker.h"

@interface Transcript : NSObject

- (id) initWithView:(ASJTagsView *) sound_bites_view;
- (void) setGuess:(NSString *) text;
- (void) addFinal:(NSArray *) hypotheses;

@end
