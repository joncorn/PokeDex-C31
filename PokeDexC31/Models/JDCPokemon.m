//
//  JDCPokemon.m
//  PokeDexC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "JDCPokemon.h"

@implementation JDCPokemon

- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities
{
    self = [self init];
    if (self)
    {
        _name = [name copy];
        _identifier = identifier;
        _abilities = [abilities copy];
    }
    return self;
}

@end

@implementation JDCPokemon (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesArray = dictionary[@"abilities"];
    
    if (![name isKindOfClass: [NSString class]] || ![abilitiesArray isKindOfClass:[NSArray class]])
    {
        return nil;
    }
    // our source of truth
    NSMutableArray *abilities = [NSMutableArray new];
    // for loop to pull ou abilities name
    for (NSDictionary *dictionary in abilitiesArray)
    {
        NSDictionary *abilityDictrionary = dictionary[@"ability"];
        NSString *abilityName = abilityDictrionary[@"name"];
        if (!abilityName)
        {
            continue;
        }
        [abilities addObject:abilityName];
    }
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
