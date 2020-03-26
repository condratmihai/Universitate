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

int dpState = LOW;

int currentNumber = 0;
unsigned long delayCounting = 50;  // incrementing interval
unsigned long lastIncreasing = 0;

// segments array, similar to before
int segments[segSize] = {
  pinA, pinB, pinC, pinD, pinE, pinF, pinG, pinDP
};
// digits array, to switch between them easily
int digits[noOfDisplays] = {
  pinD1, pinD2, pinD3, pinD4
 };   
 
byte digitMatrix[noOfDigits][segSize - 1] = {
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


void displayNumber(byte digit, byte decimalPoint) {
  for (int i = 0; i < segSize - 1; i++) {
  digitalWrite(segments[i], digitMatrix[digit][i]);
  }

  // write the decimalPoint to DP pin
  digitalWrite(segments[segSize - 1], decimalPoint);
}

// activate the display no. received as param
void showDigit(int num) {
  for (int i = 0; i < noOfDisplays; i++) {
  digitalWrite(digits[i], HIGH);
  }
  digitalWrite(digits[num], LOW);
}
         

void setup() {
  for (int i = 0; i < segSize - 1; i++)
  {
  pinMode(segments[i], OUTPUT);  
  }
  for (int i = 0; i < noOfDisplays; i++)
  {
  pinMode(digits[i], OUTPUT);  
  }
  Serial.begin(9600);
}

void loop() {
  int number;
  int digit;
  int lastDigit;
  Serial.println(currentNumber);

  number = currentNumber;
  digit = 0;
 
  while (number != 0) {
  lastDigit = number % 10;  // get the last digit
  showDigit(digit);
  displayNumber(lastDigit, HIGH);
  // increase this delay to see multiplexing in action. At about 100 it becomes obvious
  delay(5);
  digit++;            // move to next display
  number = number / 10;
  }
  // increment the number
  if (millis() - lastIncreasing >= delayCounting) {
  currentNumber = (currentNumber + 1) % 10000;
  lastIncreasing = millis();
  }
}
