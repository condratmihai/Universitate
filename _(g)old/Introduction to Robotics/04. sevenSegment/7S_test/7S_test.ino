const int pinA = 2;
const int pinB = 3;
const int pinC = 4;
const int pinD = 5;
const int pinE = 6;
const int pinF = 7;
const int pinG = 8;
const int pinDP = 9;

const int segSize = 8;
const int digitsNo = 10;

int index = 0;
int state = HIGH;
int dotState = LOW;

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

void setup()
{

  for (int i = 0; i < segSize; i++){
    pinMode(segments[i], OUTPUT);
  }

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

  displayDigits();
  

}
