//
//  JDCPokemonController.h
//  PokeDexC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDCPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDCPokemonController : NSObject

// Singleton
+ (JDCPokemonController *)sharedInstance;

// Creating a function for fetching the pokemon with a search term
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion: (void (^_Nullable) (JDCPokemon *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
