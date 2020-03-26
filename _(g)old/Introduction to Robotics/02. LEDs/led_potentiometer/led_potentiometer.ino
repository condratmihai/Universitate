
const int ledPin = 9;
const int potPin = A0;

int ledState = LOW;

int potValue = 0;
int ledValue = 0;
float voltage = 0;

void setup() {
  
  Serial.begin(9600);

  pinMode(potPin, INPUT);
  pinMode(ledPin, OUTPUT);
  
}

void loop() {

  potValue = analogRead(potPin);
  ledValue = map(potValue, 0, 1023, 0, 255);
  analogWrite(ledPin, ledValue);

  //voltage = potValue * (5.0 / 1023.0);  // voltajCurent = voltajCititConvertitDinDigitalInAnalog * (VOLTAJ_MAXIM / coeficient_remove_mapping)




}
