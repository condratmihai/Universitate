const int photoCellPin = A0;
const int buzzerPin = 11;

int buzzerTone = 0;

int minPhotoCell = 0;
int maxPhotoCell = 85;

int minPitch = 300;
int maxPitch = 1500;

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  int photoCellValue = analogRead(photoCellPin);
  buzzerTone = map(photoCellValue, minPhotoCell, maxPhotoCell, minPitch, maxPitch);
  tone(buzzerPin, buzzerTone, 10);
  //noTone(buzzerPin);

}
