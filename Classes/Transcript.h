//
//  Transcript.h
//  SpeakHere
//
//  Created by Willie Chang on 1/27/17.
//
//

#import <Foundation/Foundation.h>
#import "ASJTagsView.h"

/*typedef struct SoundBite {
    NSString *text;
} SoundBite;*/

@interface Transcript : NSObject

- (id) initWithView:(ASJTagsView *) sound_bites_view;
- (void) setHypothesis:(NSString *) text;
- (void) addFinal:(NSString *) text;

@end