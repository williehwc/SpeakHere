//
//  KaldiClient.m
//  SpeakHere
//
//  Created by Willie Chang on 1/28/17.
//
//

#import "KaldiClient.h"

@implementation KaldiClient

Transcript *transcript;
JFRWebSocket *socket;
NSString *url;

- (id) initWithTranscript: (Transcript *) newTranscript withUrl: (NSString *) newUrl {
    transcript = newTranscript;
    socket = [[JFRWebSocket alloc] initWithURL:[NSURL URLWithString:newUrl] protocols:nil];
    // Set up procedure for processing server's results (hypotheses and final guesses)
    socket.onText = ^(NSString *text) {
        NSData *textData = [text dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:textData options:NSJSONReadingMutableContainers error:nil];
        if ([dictionary objectForKey:@"result"]) {
            NSLog(@"%@", dictionary[@"result"]);
        }
    };
    return self;
}

- (void) streamStart {
    [socket connect];
}

- (void) streamAudioData: (NSData *) data {
    // Source: https://developer.ibm.com/answers/questions/174947/stream-microphone-input-from-ios-to-speech-to-text/
    [socket writeData:data];
}

- (void) streamEnd {
    // Send "EOS" (the server, not the client, closes the connection)
    [socket writeString:@"EOS"];
}

@end
