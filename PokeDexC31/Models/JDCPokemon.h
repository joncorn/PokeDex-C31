//
//  JDCPokemon.h
//  PokeDexC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDCPokemon : NSObject

// Properties
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
// Initializer
- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities;
NS_DESIGNATED_INITIALIZER;

@end

@interface JDCPokemon (JSONConvertable)

- (instancetype)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
