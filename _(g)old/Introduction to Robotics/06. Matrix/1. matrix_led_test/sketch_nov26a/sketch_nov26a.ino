                //R1 R2  R3  R4 R5 R6 R7  R8
const int row[] = {6, 11, A5, 9, 5, A4, 4, A2};
                 //C1 C2 C3  C4 C5 C6  C7  C8
const int col[] = {10, 3, 2, 7, A3, 8, 12, 13};

int i;

void lightUp()
{
  for (i = 0; i < 8; i++) {
    digitalWrite(row[i], LOW);
    digitalWrite(col[i], HIGH);
  }
}

void setup()
{
  for (i = 0; i < 8; i++) {
    pinMode(row[i], OUTPUT);
    pinMode(col[i], OUTPUT);
  }

  
}

void loop(){
  
}
