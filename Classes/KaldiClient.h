//
//  KaldiClient.h
//  SpeakHere
//
//  Created by Willie Chang on 1/28/17.
//
//

#import <Foundation/Foundation.h>
#import "Transcript.h"
#import "JFRWebSocket.h"

@interface KaldiClient : NSObject

- (id) initWithTranscript: (Transcript *) newTranscript withUrl: (NSString *) newUrl;
- (void) streamStart;
- (void) streamAudioData: (NSData *) data;
- (void) streamEnd;

@end
