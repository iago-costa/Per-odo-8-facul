#include <WiFiClient.h>
#include <WiFiServer.h>
#include <WiFiUdp.h>

/* Projeto: Campainha elétrica sem fio com Xbee
   Autor: Domingos R S Jr
   */

//Código que encaminha o processamento do botão pressionado
const int ldr =12; //LDR no pino 12
int estado = 0;
void setup()
{
  // Se tiver usando o Uno usa o serial
  Serial.begin(9600); //Inicia a porta serial
  pinMode(ldr , INPUT_PULLUP);//Define ldr como entrada
}

void loop()
{
  
  estado = digitalRead(ldr); // Envia o estado do botão
  if (estado == 1){
    Serial.println(1);
  }
  else{
    Serial.println(0);
  }

  delay(100); //Pequeno atraso para não sobrecarregar o receptor
}
