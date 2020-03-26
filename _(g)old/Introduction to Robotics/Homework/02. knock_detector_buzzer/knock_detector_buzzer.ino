const int buzzInPin = A0;
const int buzzOutPin = 11;
const int buttonPin = 2;

bool playing = false;
int buzzInValue = 0;
int buzzValue = 0;
int threshold = 0;

int buttonInput = LOW;
int lastButtonState = HIGH;

float timeDelay = 0;
float knockTime = 0;

void setup(){
  
  Serial.begin(9600);
  
  pinMode(buzzInPin, INPUT);
  pinMode(buzzOutPin, OUTPUT);
  pinMode(buttonPin, INPUT);

  noTone(buzzOutPin);

  threshold = analogRead(buzzInPin) + 10;
  
  buzzValue = 2000;
  timeDelay = 5000;
  
  bool playing = false;
}

void checkButtonInput(){
  
  buttonInput = digitalRead(buttonPin);
  
  if(buttonInput != lastButtonState)
    playing = false;
    
  lastButtonState = buttonInput;
}

void buzzerPlay(){
  tone (buzzInPin, buzzValue);
}

void buzzerStop(){

  playing = false;

  noTone(buzzOutPin);
}

void loop(){

  checkButtonInput();
  
  buzzInValue = analogRead(buzzInPin);
  //Serial.println(playing);
  //Serial.println(buzzInValue - threshold);

  if (buzzInValue >= threshold && playing == false) 
    knockTime = millis();

  if (millis() >= knockTime + timeDelay)
    playing = true;

  if (playing == true){
    if (buttonInput == true){
      buzzerStop();
      return;
    }
    else
      buzzerPlay();
  } 
}
