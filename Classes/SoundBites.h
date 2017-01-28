//
//  SoundBites.h
//  SpeakHere
//
//  Created by Willie Chang on 1/27/17.
//
//

#import <Foundation/Foundation.h>
#import "ASJTagsView.h"

typedef struct SoundBite {
    NSString *text;
} SoundBite;

@interface SoundBites : NSObject {
    ASJTagsView *sound_bites;
    NSString *hypothesis;
}

@property (nonatomic, assign) ASJTagsView *sound_bites;
@property (nonatomic, assign) NSString *hypothesis;

- (id) initWithView:(ASJTagsView *) sound_bites_view;
- (void) setHypothesis:(NSString *) text;
- (void) addFinal:(NSString *) text;

@end
