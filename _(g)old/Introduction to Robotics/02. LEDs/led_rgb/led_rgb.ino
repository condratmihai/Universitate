
const int rPin = 11;
const int gPin = 10;
const int bPin = 9;

void setup() {
  
  pinMode(rPin, OUTPUT);
  pinMode(gPin, OUTPUT);
  pinMode(bPin, OUTPUT);

  Serial.begin(9600);
}

void potentiometerRead()
{
  //pentru control analog din potentiometru
}

void colourWrite (int r, int g, int b)
{
  analogWrite(rPin, r);
  analogWrite(gPin, g);
  analogWrite(bPin, b);
}

void loop() {

  colourWrite(255, 0, 0);
  delay(1000);
  colourWrite(0, 255, 0);
  delay(1000);
  colourWrite(0, 0, 255);
  delay(1000);

}
