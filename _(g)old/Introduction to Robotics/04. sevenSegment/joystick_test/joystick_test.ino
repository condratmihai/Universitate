#include <stdio.h> // for function sprintf

const int pinSW = 2;
const int pinX = A0;
const int pinY = A1;

int switchValue = 0;
int xValue = 0;
int yValue = 0;

char string[30];

void setup()
{
 pinMode(pinSW, INPUT_PULLUP);
 Serial.begin(9600);

 
}

void loop()
{
  switchValue = digitalRead(pinSW);
  xValue = analogRead(pinX);
  yValue = analogRead(pinY);

  sprintf(string, "X = %d Y = %d S = %d", xValue, yValue, switchValue);
  Serial.println(string);

  delay(10);

}
