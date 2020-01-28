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
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation JDCPokemon (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    
}

@end
