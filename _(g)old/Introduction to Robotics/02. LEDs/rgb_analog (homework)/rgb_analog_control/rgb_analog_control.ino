const int riPin = A0;
const int giPin = A1;
const int biPin = A2;

const int roPin = 9;
const int goPin = 10;
const int boPin = 11;

int rValue = 0;
int gValue = 0;
int bValue = 0;

void setup()
{
  Serial.begin(9600);

  pinMode(riPin, INPUT);
  pinMode(giPin, INPUT);
  pinMode(biPin, INPUT);

  pinMode(roPin, OUTPUT);
  pinMode(goPin, OUTPUT);
  pinMode(goPin, OUTPUT);
}

void serialWrite(int r, int g, int b)
{
  Serial.print("R = ");
  Serial.print(r);
  Serial.print(" G = ");
  Serial.print(g);
  Serial.print(" B = ");
  Serial.print(b);
  Serial.println();
}

void colourWrite (int r, int g, int b)
{
  analogWrite(roPin, r);
  analogWrite(goPin, g);
  analogWrite(boPin, b);
}

void loop()
{
  rValue = analogRead(riPin);
  rValue = map(rValue, 0, 1023, 0, 255);
  
  gValue = analogRead(giPin);
  gValue = map(gValue, 0, 1023, 0, 255);
  
  bValue = analogRead(biPin);
  bValue = map(bValue, 0, 1023, 0, 255);

  colourWrite(rValue, gValue, bValue);
  serialWrite(rValue, gValue, bValue);
}
