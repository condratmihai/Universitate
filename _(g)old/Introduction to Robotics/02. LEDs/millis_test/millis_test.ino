
int led = 9;
int ledState = HIGH;

unsigned long previousms = 0;
const long interval = 1000;

void loop() {

  unsigned long currentms = millis();
  Serial.println(currentms);
  
  if(currentms - previousms >= interval)
  {
    previousms = currentms;

    if(ledState == LOW) ledState = HIGH;
    else ledState = LOW;

    digitalWrite(led, ledState);
    //digitalWrite(8, 1 - ledState); //Alt LED, care dă blink alternant
  }
  
}
