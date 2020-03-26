#include <stdio.h>

//digit:
//off:            not selected
//on, but dim:    selected, but not locked-in
//on, but bright: selected and locked-in

const int pinSW = 0;
const int pinX = A0;
const int pinY = A1;

int switchValue = 0;
int xValue = 0;
int yValue = 0;

char string[30];

const int pinA = 12;
const int pinB = 8;
const int pinC = 5;
const int pinD = 3;
const int pinE = 2;
const int pinF = 11;
const int pinG = 6;
const int pinDP = 4;
const int pinD1 = 7;
const int pinD2 = 9;
const int pinD3 = 10;
const int pinD4 = 13;

const int segSize = 8;
const int noOfDisplays = 4;
const int noOfDigits = 10;

int dotState = LOW;
int dpState = LOW;
int swState = LOW;
int lastSwState = HIGH;

int number = 0;
int digit[4] = {0, 0, 0, 0};
int lastDigit = 0;
int segment = 0;

bool joyMoved = false;

int minThreshold = 400;
int maxThreshold = 600;

int segments[segSize] = {
  pinA, pinB, pinC, pinD, pinE, pinF, pinG, pinDP
};

int digits[noOfDisplays] = {
  pinD1, pinD2, pinD3, pinD4
};

byte digitMatrix[noOfDigits][segSize - 1] = {
  // a b c d e f g
  {1, 1, 1, 1, 1, 1, 0}, // 0
  {0, 1, 1, 0, 0, 0, 0}, // 1
  {1, 1, 0, 1, 1, 0, 1}, // 2
  {1, 1, 1, 1, 0, 0, 1}, // 3
  {0, 1, 1, 0, 0, 1, 1}, // 4
  {1, 0, 1, 1, 0, 1, 1}, // 5
  {1, 0, 1, 1, 1, 1, 1}, // 6
  {1, 1, 1, 0, 0, 0, 0}, // 7
  {1, 1, 1, 1, 1, 1, 1}, // 8
  {1, 1, 1, 1, 0, 1, 1}  // 9
};

void readJoystick()
{
  switchValue = digitalRead(pinSW);
  xValue = analogRead(pinX);
  yValue = analogRead(pinY);
}

void displayNumber(byte digit, byte decimalPoint)
{
  for (int i = 0; i < segSize - 1; i++)
    digitalWrite(segments[i], digitMatrix[digit][i]);
  
  digitalWrite(segments[segSize - 1], decimalPoint);
}

void showDigit(int num)
{
  for (int i = 0; i < noOfDisplays; i++)
    digitalWrite(digits[i], HIGH);
  
  digitalWrite(digits[num], LOW);
}

void changeDotState()
{
  swState = digitalRead(pinSW);

  if (swState != lastSwState)
  {
    if (swState == LOW)
    {
      dotState = !dotState;
    }
  }
  //Serial.println(lastSwState);
  lastSwState = swState;
}

void dimDisplay()
{
  for (int i = 0; i < segSize - 1; i++)
      digitalWrite(segments[i], 0);
}

void changeDigit()
{
  if (xValue < minThreshold && joyMoved == false)
  {
    if (digit[segment] > 0)
      digit[segment]--;

    else
      digit[segment] = 9;

    joyMoved = true;
  }

  if (xValue > maxThreshold && joyMoved == false)
  {
    if (digit[segment] < 9)
      digit[segment]++;

    else
      digit[segment] = 0;

    joyMoved = true;
  }

  if (xValue > minThreshold && xValue < maxThreshold)
    joyMoved = false;

    dpState = HIGH;
  
  //Serial.print("Digit: ");
  //Serial.println(digit[segment]);
  //delay(1);
}

void changeSegment()
{
  
  if (yValue < minThreshold && joyMoved == false)
  {
    if (segment > 0)
      segment--;

    else
      segment = 3;

    joyMoved = true;
  }

  if (yValue > maxThreshold && joyMoved == false)
  {
    if (segment < 3)
      segment++;

    else
      segment = 0;

    joyMoved = true;
  }

  if (yValue > minThreshold && yValue < maxThreshold)
    joyMoved = false;

  dpState = !dpState;

  //Serial.print("Segment: ");
  //Serial.println(segment);
  //delay(1);
}

void printJoystickValues()
{
  sprintf(string, "X = %d Y = %d S = %d", xValue, yValue, switchValue);
  Serial.println(string);
}

void setup()
{
  pinMode(pinSW, INPUT_PULLUP);

  for (int i = 0; i < segSize - 1; i++)
    pinMode(segments[i], OUTPUT);
    
  for (int i = 0; i < noOfDisplays; i++)
    pinMode(digits[i], OUTPUT);
   
  Serial.begin(9600);
 
}

void loop()
{
  
  readJoystick();
  
  changeDotState();

  if (!dotState)
  {
    changeSegment();
    showDigit(segment);
    displayNumber(digit[segment], LOW);
    dimDisplay(); 
  }
    
  else
  {
    changeDigit();
    displayNumber(digit[segment], HIGH);
  }

}
