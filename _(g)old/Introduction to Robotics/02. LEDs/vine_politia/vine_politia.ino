int led = 13;
int ledP = 8;

void setup() {

  pinMode(led, OUTPUT);
  pinMode(ledP, OUTPUT);
}

void loop() {

  digitalWrite(led, HIGH);
  digitalWrite(ledP, LOW);
  delay(400);
  digitalWrite(ledP, HIGH);
  digitalWrite(led, LOW);
  delay(400);

}
