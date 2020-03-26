const int pinA = 2;
const int pinB = 3;
const int pinC = 4;
const int pinD = 5;
const int pinE = 6;
const int pinF = 7;
const int pinG = 8;
const int pinDP = 9;

const int pinSW = 10;
const int pinX = A0;
const int pinY = A1;

const int segSize = 8;
const int digitsNo = 10;

int index = 0;
int digit = 0;
int state = HIGH;
int dotState = LOW;
int swState = LOW;
int lastSwState = HIGH;

int switchValue = 0;
int xValue = 0;
int yValue = 0;

bool joyMoved = false;

int minThreshold = 400;
int maxThreshold = 600;

int segments[segSize] = {
  pinA, pinB, pinC, pinD, pinE, pinF, pinG, pinDP
};

byte digitMatrix[digitsNo][segSize - 1] = {

// a  b  c  d  e  f  g
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

void displayNumber (byte, byte);

void setup()
{

  for (int i = 0; i < segSize; i++){
    pinMode(segments[i], OUTPUT);
  }

  pinMode(pinSW, INPUT_PULLUP);
  displayNumber(digit, dotState);

}

void cycle()
{
  digitalWrite(segments[index], state);
  index++;
  delay(500);
 
  if (index >= segSize){
    index = 0;
    state = !state;
  }
}

void displayNumber (byte digit, byte decimalPoint = LOW)
{
  for(int i = 0; i < segSize - 1; i++)
  {
    digitalWrite(segments[i], digitMatrix[digit][i]);
  }

  digitalWrite(segments[segSize - 1], decimalPoint);
}

void displayDigits()
{
  displayNumber(index, dotState);
  index++;
  delay(500);

  if (index >= digitsNo){
    index = 0;
    state = !state;
    dotState = !dotState;
  }
}

void loop()
{
  switchValue = digitalRead(pinSW);
  xValue = analogRead(pinX);
  yValue = analogRead(pinY);

  if (xValue < minThreshold && joyMoved == false)
  {
    if (digit > 0)
      digit--;

    else
      digit = 9;

    joyMoved = true;
  }

  if (xValue > maxThreshold && joyMoved == false)
  {
    if (digit < 9)
      digit++;

    else
      digit = 0;

    joyMoved = true;
  }

  if (xValue > minThreshold && xValue < maxThreshold)
    joyMoved = false;
  
  swState = digitalRead(pinSW);

  if (swState != lastSwState)
  {
    if (swState == LOW)
    {
      dotState = !dotState;
    }
  }

  lastSwState = swState;

  displayNumber(digit, dotState);
  delay(1);
  

}
