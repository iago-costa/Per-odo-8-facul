/* Projeto: Campainha elétrica sem fio com Xbee */

//Código que encaminha o processamento do botão pressionado


//void setup()
//{
//  // Se tiver usando o Uno usa o serial
//  Serial.begin(9600); //Inicia a porta serial
//}
//
//void loop()
//{
//  Serial.println(digitalRead(botao)); // Envia o estado do botão
//  delay(300); //Pequeno atraso para não sobrecarregar o receptor
//}


//#include <XBee.h>
//#include <SoftwareSerial.h>
//#include <LiquidCrystal.h>

//LiquidCrystal lcd(12,11,5,4,3,2);

// XBee's DOUT (TX) is connected to pin 0 (Arduino's Software RX)
// XBee's DIN (RX) is connected to pin 1 (Arduino's Software TX)
//SoftwareSerial serial1(0, 1); // RX, TX

//XBee xbee=XBee();
//XBeeResponse response = XBeeResponse();
//Rx16Response rx16 = Rx16Response();
//Rx64Response rx64 = Rx64Response();
//
//uint8_t option = 0;
//uint8_t data = 0;
//uint8_t rssi = 0;

//int dado;
const int botao = 8;
const int verificador = 7;

void setup() 
{
  Serial.begin(9600);
  pinMode(botao, INPUT_PULLUP);
  pinMode(verificador, INPUT_PULLUP);
//  serial1.begin(9600);
//  xbee.setSerial(serial1);
//  lcd.begin(16,2);
//  lcd.clear();
}

void loop() 
{

  if ((digitalRead(botao)) == LOW){
     Serial.println(1); // Envia o estado do botão   
     
  }else {
    Serial.println(0);
  }
  delay(100); //Pequeno atraso para não sobrecarregar o receptor

//  xbee.readPacket(100);
//  if (xbee.getResponse().isAvailable())
//  {
//    Serial.println("available");
//    if(xbee.getResponse().getApiId() == RX_64_RESPONSE || xbee.getResponse().getApiId() == RX_16_RESPONSE)
//    { 
//      Serial.println("16");
//      if (xbee.getResponse().getApiId() == RX_16_RESPONSE) 
//      {
//        Serial.println("16");
//        xbee.getResponse().getRx16Response(rx16);
////        option = rx16.getOption();
////        data = rx16.getData(0);
////        Serial.print("data: "); Serial.println(data);
////        Serial.print("option: "); Serial.println(option);
//        rssi = rx16.getRssi();
//
////        lcd.clear();
////        lcd.print(rssi);
//        Serial.println(rssi);
//      } 
//      else 
//      {
//        Serial.println("64");
//        xbee.getResponse().getRx64Response(rx64);
////        option = rx64.getOption();
////        data = rx64.getData(0);
////        Serial.print("data: "); Serial.println(data);
////        Serial.print("option: "); Serial.println(option);
//        rssi = rx64.getRssi();
////        lcd.clear();
////        lcd.print(rssi);
//        Serial.println(rssi);
//      }
//    }
//  }
}
