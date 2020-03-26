#include <LiquidCrystal.h>

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

const int trigPin = 10;
const int echoPin = 9;

int distance;
long duration;

void setup() {

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  lcd.begin(16,2);
  //lcd.print("Hello world!");

  Serial.begin(9600);
  
}

void loop() {

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034/2;
  Serial.print("Distance: ");
  Serial.println(distance);

  lcd.setCursor(0, 0);
  lcd.print("Distance: ");
  lcd.setCursor(0, 5);
  lcd.print(distance);
  lcd.print("      ");  //lcd.clear();
  delay(10);

//  digitalWrite(trigPin, LOW);
//  delayMicroseconds(2);
//
//  digitalWrite(trigPin, HIGH);
//  delayMicroseconds(10);
//  digitalWrite(trigPin, LOW);
  

}
