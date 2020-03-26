const int photoCellPin = A0;
int photoCellValue = 0;

int ledPin = 13;
int threshold = 40;

void setup()
{
  Serial.begin(9600);
  pinMode(photoCellPin, INPUT);
}

void loop()
{
 photoCellValue = analogRead(photoCellPin);
 Serial.println(photoCellValue);

 if(photoCellValue > threshold)
 {
  digitalWrite(ledPin, LOW);
 }
 else digitalWrite(ledPin, HIGH);
}
