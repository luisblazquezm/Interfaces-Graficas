//
//  PolynomialController.m
//  Polynomials
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "PolynomialController.h"
#import "Polynomial.h"
#import "PolynomialView.h"

@implementation PolynomialController

extern NSString *PolynomialControllerSendViewNotification;

-(id) init
{
    self = [super init];
    if(self){
        polynomials = [[NSMutableArray alloc] init];
        polynomialView = [[PolynomialView alloc] init];
        NSNotificationCenter *nc =[NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(handlePolynomialReceived:)
                   name:PolynomialControllerSendViewNotification
                 object:nil];
    }
    return self;
}

-(IBAction) createNewPolynomial:(id)sender
{
    Polynomial *p = [[Polynomial alloc] init];
    [polynomials addObject:p];
    [polynomialView setNeedsDisplay:YES];
}

-(IBAction) deleteRandomPolynomial:(id)sender
{
    if ([polynomials count] == 0) {
        NSBeep();
        return;
    }
    NSInteger i = random() % [polynomials count];
    [polynomials removeObjectAtIndex:i];
    [polynomialView setNeedsDisplay:YES]; // Actualiza la vista porque se ha borrado una grafica o funcion (se fuerza a rellamar a drawRect)
    
}
     
-(void) handlePolynomialReceived:(NSNotification*)aNotification
{
    // Lo que se recibe de la notificación que es la información de las dimensiones de la ventana en cada momento (asi como su contexto grafico -> todas las graficas están dentro del mismo contexto gráfico)
    
        NSLog(@"Notific recivida");
    NSDictionary *info = [aNotification userInfo];
    NSNumber *oX = [info objectForKey:@"OrigenX"];
    NSNumber *oY = [info objectForKey:@"OrigenY"];
    NSNumber *alt = [info objectForKey:@"Altura"];
    NSNumber *anch = [info objectForKey:@"Ancho"];
    NSGraphicsContext *ctx = [info objectForKey:@"ContextoGrafico"];
    
    NSRect bounds;
    bounds.origin.x = [oX integerValue];
    bounds.origin.y = [oY integerValue];
    bounds.size.height = [alt integerValue];
    bounds.size.width = [anch integerValue];
    
    // Cada vez que se añade una grafica se llama a esta notificacion
    // Y hay que redibujar las graficas ya dibujadas anteriormente y la que se acaba de añadir
    // Cada una dentro del mismo contexto grafico (Las anteriores cambian del contexto grafico en el que estaban al ACTUAL que acaba de cambiar debido a la adición de la nueva gráfica)
            NSLog(@"A pintar Count = %ld!!!!!",[polynomials count]);
    for (Polynomial *p in polynomials){
        [p drawInRect:bounds withGraphicsContext:ctx];
    }
                NSLog(@"Grafica Representada");
}
@end
