#include <IRremote.h>
#include <LiquidCrystal.h>

const int V0_PIN = 9; // PWN in loc de POTENTIOMETRU
const int RECV_PIN = 10;
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
IRrecv irrecv(RECV_PIN);
decode_results results;
unsigned long key_value = 0;

void setup(){
  Serial.begin(9600);
  irrecv.enableIRIn(); 
  irrecv.blink13(true);
  lcd.begin(16, 2);

  pinMode(V0_PIN, OUTPUT); // PWN in loc de POTENTIOMETRU
  analogWrite(V0_PIN, 90); // PWN in loc de POTENTIOMETRU

}

void loop(){
  if (irrecv.decode(&results)){
 
        if (results.value == 0XFFFFFFFF)
        results.value = key_value;
        lcd.setCursor(0, 0);
        lcd.clear();
        
        switch(results.value){
          case 0xFFA25D:          
          lcd.print("CH-");
          break;
          case 0xFF629D:
          lcd.print("CH");
          break;
          case 0xFFE21D:
          lcd.print("CH+");
          break;
          case 0xFF22DD:
          lcd.print("|<<");
          break;
          case 0xFF02FD:
          lcd.print(">>|");
          break ;  
          case 0xFFC23D:
          lcd.print(">|");
          break ;               
          case 0xFFE01F:
          lcd.print("-");
          break ;  
          case 0xFFA857:
          lcd.print("+");
          break ;  
          case 0xFF906F:
          lcd.print("EQ");
          break ;  
          case 0xFF6897:
          lcd.print("0");
          break ;  
          case 0xFF9867:
          lcd.print("100+");
          break ;
          case 0xFFB04F:
          lcd.print("200+");
          break ;
          case 0xFF30CF:
          lcd.print("1");
          break ;
          case 0xFF18E7:
          lcd.print("2");
          break ;
          case 0xFF7A85:
          lcd.print("3");
          break ;
          case 0xFF10EF:
          lcd.print("4");
          break ;
          case 0xFF38C7:
          lcd.print("5");
          break ;
          case 0xFF5AA5:
          lcd.print("6");
          break ;
          case 0xFF42BD:
          lcd.print("7");
          break ;
          case 0xFF4AB5:
          lcd.print("8");
          break ;
          case 0xFF52AD:
          lcd.print("9");
          break ;                   
        }
        key_value = results.value;
        irrecv.resume(); 
  }
}
