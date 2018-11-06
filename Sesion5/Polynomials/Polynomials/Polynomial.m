//
//  Polynomial.m
//  Polynomials
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Polynomial.h"
#define HOPS (500) // Numero de puntos
#define RANDFLOAT() (random()%128/128.0)
static NSRect funcRect = {-10, -10, 20 ,20}; //MAXIMO Y MINIMO DE EJES X E Y Y DONDE ESTA LA ESQUINA INFERIOR IZQUIERDA

@implementation Polynomial

-(id) init
{
    NSLog(@"En init");
    self = [super init];
    if (!self) {
        return nil;
    }
    color = [NSColor colorWithSRGBRed:RANDFLOAT()
                                green:RANDFLOAT()
                                 blue:RANDFLOAT()
                                alpha:1.0];
    termCount = (random() % 3) + 2;
    terms = malloc(termCount * sizeof(float));
    
    for (int i = 0; i < termCount; i++) {
        terms[i] = 5.0 - (random() % 100)/10.0;
    }
    poly = [[NSBezierPath alloc] init];
    
    return self;
}

-(float) valueAt:(float)x
{
    float result = 0;
    for (int i = 0; i < termCount; i++) {
        //NSLog(@"(x * result) x = %f result = %f -> terms %f -> termCount %d\n",x, result, terms[i], termCount);
        // Esto es como si fuera una funcion y = (y*x) + a o f(x) = x*y + a
        result = (result * x) + terms[i];
    }
    
    return result;
}

// Cada vez que se añade una grafica cambian los bounds b y el contexto grafico (uno para todas las graficas)

-(void) drawInRect:(NSRect)b
withGraphicsContext:(NSGraphicsContext*)ctx
{
    NSPoint aPoint;
    float distance = funcRect.size.width/HOPS; // Distancia entre las x (cuanto más grande más anchas serán las gráficas)
    
    [poly removeAllPoints];
    [ctx saveGraphicsState]; //------------------- Contexto gráfico
    
        // Se crea el espacio afín
        // Las tareas se realizan en orden inverso a lo que se está realizando
        /*
         * se divide por la escala para que si aumenta la altura aumente la anchura proporcionamente a ese
         * incrementeo
         */
        NSAffineTransform *tf = [NSAffineTransform transform];
        [tf translateXBy:b.size.width/2 yBy:b.size.height/2];   // 2º Mult* por la matriz de Transformación Afín
        [tf scaleXBy:b.size.width/funcRect.size.width           // 1º Ancho y Alto / Escala (funcRect)
                 yBy:b.size.height/funcRect.size.height];
        [tf concat];
    
        [poly setLineWidth:0.1];
        [color setStroke];
    
        // Es como una regla de 3 a través de la cual se calcula el punto Y a partir de la x y de la función que nos den
        aPoint.x = funcRect.origin.x; // ESto en el trabajo el funcRect lo pasa el usuario como X e Y minimo y máximo
        aPoint.y = [self valueAt:aPoint.x]; // El punto en la grafica que se corresponde conn la x; es decir si X= 0.5 Y = 2 -> X = 1 Y = 1
    NSLog(@"aPointY: %f aPointX: %f\n",aPoint.y, aPoint.x);

        // OJO importante marcar el punto de referencia u origen desde donde empieza la grafica (sera la esquina inferior izquierda el punto de origen.
    // Desde el punto de origen = -10 sumando 0.04 cada vez hasta 10 = -10 + 20 (origen de x + ancho)
        [poly moveToPoint:aPoint];
        while (aPoint.x <= funcRect.origin.x + funcRect.size.width) {
            aPoint.y = [self valueAt:aPoint.x];
            [poly lineToPoint:aPoint];
            aPoint.x += distance;
        }
    
        [poly stroke];
    [ctx restoreGraphicsState]; //------------------- Contexto gráfico
}


@end
