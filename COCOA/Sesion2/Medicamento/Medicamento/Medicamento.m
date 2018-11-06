//
//  Medicamento.m
//  Medicamento
//
//  Created by Luis Blazquez Miñambres on 27/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Medicamento.h"

@implementation Medicamento
@synthesize name, serialNumber, producer, activePrinciple, form, quantity, expirationDate;

-(NSString *) description
{
    NSString *descriptionString;
    
    // Se rellenará los valores con lo que devuelva el getter de possesioName,...
    descriptionString = [[NSString alloc] initWithFormat:@"%@:\n\t-SerialNum: %@\n\t-Producer: %@\n\t-ActivePrinciple: %@\n\t-Form: %@\n\t-Quantity: %d\n\t-Expiration: %@\n\t",
                         name, serialNumber, producer, activePrinciple, form, quantity, expirationDate];
    
    // Devolvemos la instancia (como un stringBuilder)
    return descriptionString;
}


// Inicializador o constructor
-(id) initWithMedicineName: (NSString *) medicine_Name
              serialNumber: (NSString *) medicine_SerialNumber
                  producer: (NSString *) medicine_Producer
           activePrinciple: (NSString *) medicine_ActivePrinciple
                      form: (NSString *) medicine_Form
                  quantity: (int) medicine_Quantity;
{
    NSDateFormatter *dateFormat;
    NSDate *date;
    
    
    self = [super init];
    
    if(!self)
        return nil;
    [self setName: medicine_Name];
    [self setSerialNumber: medicine_SerialNumber];
    [self setProducer: medicine_Producer];
    [self setActivePrinciple: medicine_ActivePrinciple];
    [self setForm: medicine_Form];
    [self setQuantity: medicine_Quantity];
    
    date = [[NSDate alloc] init];
    
    //----------------------------------------------------------------
    /*
     Generate a random date sometime between now and n days before day.
     
     Also, generate a random time to go with the day while we are at it.
     @param days date range between today and minimum date to generate
     @return random date
     @see http://stackoverflow.com/questions/10092468/how-do-you-generate-a-random-date-in-objective-c
     */
    
    NSUInteger daysBack = 305;
    NSUInteger day = arc4random_uniform((u_int32_t)daysBack);  // explisit cast
    NSUInteger hour = arc4random_uniform(23);
    NSUInteger minute = arc4random_uniform(59);
    
    NSDate *today = [NSDate new];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setDay:(day * -1)];
    [offsetComponents setHour:hour];
    [offsetComponents setMinute:minute];
    
    date = [gregorian dateByAddingComponents:offsetComponents
                                                    toDate:today
                                                   options:0];
    //----------------------------------------------------------------
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE d MMMM, YYYY"];
    expirationDate = [dateFormat stringFromDate:date];
    
    return self;
}

+(id) randomMedicine
{
    // OJO poner comas en los arrays estaticos de nombres random
    
    static NSString *randomNameList[] =
    {
        @"Paracetamol",
        @"Biodramina",
        @"Jarabe",
        @"Endolina",
        @"Teina",
        @"Edulcorante",
        @"Enantium",
        @"Betadine"
    };
    
    static NSString *randomFirstNameList[] =
    {
        @"Luis",
        @"Alberto",
        @"Miguel",
        @"Carlos",
        @"Alejandro",
        @"Jose",
        @"Samuel",
        @"Mario"
    };
    
    static NSString *randomSureNameList[] =
    {
        @"Blázquez",
        @"Gómez",
        @"Sánchez",
        @"Hernández",
        @"Tejero",
        @"Santos",
        @"Nuñez",
        @"Calvo"
    };
    
    // Random values for name of product, serialNumber, producer,...
    
    NSString *randomName = [NSString stringWithFormat:@"%@",
                            randomNameList[random() % 8]];
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    (char)('0' + random() % 10),
                                    (char)('0' + random() % 10),
                                    (char)('A' + random() % 26),
                                    (char)('A' + random() % 26),
                                    (char)('0' + random() % 10)];
    
    NSString *randomProducer = [NSString stringWithFormat:@"%@ %@ %@",
                            randomFirstNameList[random() % 8],
                            randomSureNameList[random() % 8],
                            randomSureNameList[random() % 8]];
    
    int randomQuantity = random() % 500 + 1;
    
    Medicamento *newMedicine = [[Medicamento alloc]
                                 initWithMedicineName: randomName
                                 serialNumber: randomSerialNumber
                                 producer: randomProducer
                                 activePrinciple: nil
                                 form: nil
                                 quantity: randomQuantity];
    
    return newMedicine;
}
@end
