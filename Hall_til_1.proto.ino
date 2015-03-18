#include "Pinns.h"

void setup() {
  
  Serial.begin(9600); 
  
  pinMode(hallPin, INPUT); 
  pinMode(hallPin2, INPUT); 
  pinMode(hallPin3, INPUT);
  pinMode(hallPin4, INPUT); 
  //pinMode(hallPin5, INPUT);
  
   
}

void loop(){
  hallState = digitalRead(hallPin);
  hallState2 = digitalRead(hallPin2);
  hallState3 = digitalRead(hallPin3);
  hallState4 = digitalRead(hallPin4);
  //hallState5 = digitalRead(hallPin5);


  Serial.print(hallState);
  Serial.print(hallState2);
  Serial.print(hallState3);
  Serial.print(hallState4);
  //Serial.print(hallState5);
  Serial.println();
 
  delay(10);
}

