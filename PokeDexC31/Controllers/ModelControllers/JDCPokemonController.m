//
//  JDCPokemonController.m
//  PokeDexC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "JDCPokemonController.h"
#import "JDCPokemon.h"
// https://pokeapi.co/api/v2

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon";

@implementation JDCPokemonController

+ (JDCPokemonController *)sharedInstance
{
    static JDCPokemonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JDCPokemonController new];
    });
    return sharedInstance;
}

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(JDCPokemon * _Nullable))completion
{
    /// Turning the string URL into URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        // Handle error
        if (error)
        {
            NSLog(@"There was an error:: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        // Handle response
        if (response)
        {
            NSLog(@"Response: %@", response);
        }
        
        // Handle data
        if (data)
        {
            // using 'data' to input into jsonserialization to create top level dict
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
            
            // unwrap, make sure it exists, and handle error
            if (!topLevelDictionary)
            {
                NSLog(@"Error passing json: %@", error);
                completion(nil);
                return;
            }
            
            // creating pokemon from the dictionary we created
            JDCPokemon *pokemon = [[JDCPokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
    }] resume];
}

@end
