//
//  Medicamento.h
//  Medicamento
//
//  Created by Luis Blazquez Miñambres on 27/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medicamento : NSObject
{ // Declaracion de variables
    NSString *name;
    NSString *serialNumber;
    NSString *producer;
    NSString *activePrinciple;
    NSString *form;
    int quantity;
    NSString *expirationDate;
}

// Declaracion de metodos
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) NSString *producer;
@property (nonatomic) NSString *activePrinciple;
@property (nonatomic) NSString *form;
@property (nonatomic) int quantity;
@property (readonly) NSString *expirationDate;


-(NSDate *)generateRandomDateWithinDaysBeforeToday:(NSUInteger)daysBack;

// Constructor o inicializador
-(id) initWithMedicineName: (NSString *) medicine_Name
              serialNumber: (NSString *) medicine_SerialNumber
                  producer: (NSString *) medicine_Producer
           activePrinciple: (NSString *) medicine_ActivePrinciple
                      form: (NSString *) medicine_Form
                  quantity: (int) medicine_Quantity;

// FactoryMethod o metodo de clase
+(id) randomMedicine;

@end
