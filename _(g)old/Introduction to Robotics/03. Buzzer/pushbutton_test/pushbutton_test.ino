const int pushButton = 2;
int buttonState = 0;
int counter = 0;

void setup() {
 Serial.begin(9600);
 pinMode(pushButton, INPUT_PULLUP);
}

void loop() {
  buttonState = digitalRead(pushButton);
  Serial.println(buttonState);

  if (buttonState == HIGH)
  delay(1); 
}
