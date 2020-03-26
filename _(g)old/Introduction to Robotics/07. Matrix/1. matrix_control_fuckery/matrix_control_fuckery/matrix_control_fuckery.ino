#include "LedControl.h" //  need the library
#include <stdio.h> // for function sprintf

LedControl lc = LedControl(12, 11, 10, 1); //DIN, CLK, LOAD, No. DRIVER
 
// pin 12 is connected to the MAX7219 pin 1
// pin 11 is connected to the CLK pin 13
// pin 10 is connected to LOAD pin 12
// 1 as we are only using 1 MAX7219

const int pinSW = 2;
const int pinX = A0;
const int pinY = A1;

int switchValue = 0;
int xValue = 0;
int yValue = 0;

int xComp = 0;
int yComp = 0;

bool joyMoved = false;

int minThreshold = 400;
int maxThreshold = 600;

int dotState = LOW;
int dpState = LOW;
int swState = LOW;
int lastSwState = HIGH;

char string[30];

int xMine = 4;
int yMine = 5;

int walls[8][8] = 
{
  {0, 0, 0, 0, 0, 0, 0, 0},
  {1, 1, 1, 1, 1, 1, 1, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {1, 1, 1, 1, 1, 1, 1, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 1, 1, 1, 1, 1, 1}
};

void readJoystick()
{
  switchValue = digitalRead(pinSW);
  xValue = analogRead(pinX);
  yValue = 1023 - analogRead(pinY);

  //xValue = map(xValue, 0, 1023, -1, 1);
  //yValue = map(yValue, 0, 1023, -1, 1);
  

  sprintf(string, "X = %d Y = %d S = %d", xValue, yValue, switchValue);
  //Serial.println(string);

  delay(10);
}

void lightUp()
{
  for (int row = 0; row < 8; row++)
  {
  for (int col = 0; col < 8; col++)
  {
    lc.setLed(0, col, row, true); // turns on LED at col, row
    delay(25);
  }
  }
  for (int row = 0; row < 8; row++)
  {
  for (int col = 0; col < 8; col++)
  {
    lc.setLed(0, col, row, false); // turns off LED at col, row
    delay(25);
  }
  }
}

void lightWalls()
{
  for (int row = 0; row < 8; row++)
  {
  for (int col = 0; col < 8; col++)
  {
    lc.setLed(0, col, row, walls[row][col]); // turns on LED at col, row
    delay(25);
  }
  }

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

void changexComp()
{
  if (xValue < minThreshold && joyMoved == false)
  {
    if (xComp > 0)
      xComp--;

    else
      xComp = 7;

    joyMoved = true;
  }

  if (xValue > maxThreshold && joyMoved == false)
  {
    if (xComp < 7)
      xComp++;

    else
      xComp = 0;

    joyMoved = true;
  }

  if (xValue > minThreshold && xValue < maxThreshold)
    joyMoved = false;

    dpState = HIGH;
  
  //Serial.print("xComp: ");
  //Serial.println(xComp);
  delay(1);
}

void changeyComp()
{
  
  if (yValue < minThreshold && joyMoved == false)
  {
    if (yComp > 0)
      yComp--;

    else
      yComp = 7;

    joyMoved = true;
  }

  if (yValue > maxThreshold && joyMoved == false)
  {
    if (yComp < 7)
      yComp++;

    else
      yComp = 0;

    joyMoved = true;
  }

  if (yValue > minThreshold && yValue < maxThreshold)
    joyMoved = false;

  dpState = !dpState;

  //Serial.print("yComp: ");
  //Serial.println(yComp);
  delay(1);
}

void displayDot(int row, int col)
{
  lc.setLed(0, row, col, true); // turns on LED at col, row
  delay(10);
  lc.setLed(0, row, col, false); // turns off LED at col, row
  delay(10);
}

void flickerMine(int row, int col)
{
  lc.setLed(0, row, col, true); // turns on LED at col, row
  delay(50);
  lc.setLed(0, row, col, false); // turns off LED at col, row
  delay(50);

  if (xComp == xMine && yComp == yMine)
  {
    xComp = yComp = 0;
    xMine = yMine = -1;
    Serial.println("hîtz!");
  }
}

void setup()
{
  Serial.begin(9600);
  pinMode(pinSW, INPUT_PULLUP);
  
  // the zero refers to the MAX7219 number, it is zero for 1 chip
  lc.shutdown(0, false); // turn off power saving, enables display
  lc.setIntensity(0, 2); // sets brightness (0~15 possible values)
  lc.clearDisplay(0);// clear screen

  lightWalls();

}

void loop()
{
  readJoystick();
  
  if(walls[7 - xValue][yValue] == 1) Serial.println("hâtz");
  
    changexComp();
    changeyComp();

    displayDot(xComp, yComp);
  

  
  //flickerMine(xMine, yMine);

  
  
  //lightUp();

 



  
}
