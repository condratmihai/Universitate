char incomingByte = 0; // for incoming serial data

String inputString = "";       // a String to hold incoming data
bool stringComplete = false;  // whether the string is complete

void setup() {
  Serial.begin(9600);
}

void loop() {
  // send data only when you receive data:
  if (Serial.available() > 0) {
  // read the incoming byte:
  incomingByte = (char)Serial.read();
  inputString += incomingByte;
  Serial.print("I received: ");
  Serial.println(incomingByte);
  // if the incoming character is a newline, set a flag so the main loop can
  // do something about it:
  if (incomingByte == '\n') {
    stringComplete = true;
    Serial.println(inputString);
  }
  }
}
