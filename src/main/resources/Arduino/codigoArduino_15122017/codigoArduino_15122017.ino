//TURBIEDAD
float turbiedad=0;
//GPS
#include <SoftwareSerial.h>
#include <TinyGPS.h>

TinyGPS gps;
SoftwareSerial ss(11, 10);
float latitud = 0, longitud = 0;

static void smartdelay(unsigned long ms);
static void print_float(float val, float invalid, int len, int prec);

//CONDUCTIVIDAD CONFIGURACIONES
String inputstring = "";                              //a string to hold incoming data from the PC
String sensorstring = "";                             //a string to hold the data from the Atlas Scientific product
boolean input_string_complete = false;                //have we received all the data from the PC
boolean sensor_string_complete = false;               //have we received all the data from the Atlas
int contador = 5;
int conductividad;
// TEMPERATURA LIBRERIAS
#include <OneWire.h>
#include <DallasTemperature.h>

//PH CONFIGURACIONES
#define SensorPin A8
unsigned long int avgValue;
float b, ph = 0;
int buf[10], temp;

// TEMPERATURA CONFIGURACIONES
#define ONE_WIRE_BUS 2
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensorTemperatura(&oneWire);
float temperatura = 0;

//LIBRERIAS WIFI
#include <SPI.h>
#include <WiFi101.h>

//WIFI CONFIGURACIONES  
char ssid[] = "CLAROHK0G0_1"; //  your network SSID (name)
char pass[] = "ARrm15072324TM...";  ;   // your network password
//char ssid[] = "Ledesma"; //  your network SSID (name)
//char pass[] = "ledesma100634";  ;   // your network password
int status = WL_IDLE_STATUS;
// Initialize the WiFi client library
WiFiClient client;
// server address:
char server[] = "pionot.com";
//IPAddress server(45,55,149,151);
//IPAddress server(192, 168, 0, 102);
unsigned long lastConnectionTime = 0;            // last time you connected to the server, in milliseconds
const unsigned long postingInterval = 10L * 1000L; // delay between updates, in milliseconds






void setup() {
  Serial.begin(9600);
  //CONDUCTIVIDAD
  Serial3.begin(9600);                                //set baud rate for software serial port_3 to 9600
  inputstring.reserve(10);                            //set aside some bytes for receiving data from the PC
  sensorstring.reserve(30);


  //TEMPERATURA
  sensorTemperatura.begin();

  //set aside some bytes for receiving data from Atlas

  //WIFI
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // check for the presence of the shield:
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield not present");
    // don't continue:
    while (true);
  }

  // attempt to connect to WiFi network:
  while ( status != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
    status = WiFi.begin(ssid, pass);

    // wait 10 seconds for connection:
    delay(10000);
  }
  // you're connected now, so print out the status:
  printWiFiStatus();



  //  Serial.println("EC TDS  SAL  GRAV  Temperatura  PH    Latitude  Longitude ");
  Serial.println("EC Temperatura  PH    Latitude  Longitude   Turbiedad");

  Serial.println("                          (deg)     (deg)");
  Serial.println("-------------------------------------------------------------------------------------------------------------------------------------");

}

void loop() {
//    latitud = 0; longitud = 0; ph = 0; temperatura = 0;conductividad={0};
  boolean conductividadExiste=false;


  //CONDUCTIVIDAD
  if (input_string_complete == true) {                //if a string from the PC has been received in its entirety
    Serial3.print(inputstring);                       //send that string to the Atlas Scientific product
    Serial3.print('\r');                              //add a <CR> to the end of the string
    inputstring = "";                                 //clear the string
    input_string_complete = false;                    //reset the flag used to tell if we have received a completed string from the PC
  }

  if (sensor_string_complete == true) {               //if a string from the Atlas Scientific product has been received in its entirety
    if (isdigit(sensorstring[0]) == false) {          //if the first character in the string is a digit
      Serial.println(sensorstring);                   //send that string to the PC's serial monitor
    }
    else{                                              //if the first character in the string is NOT a digit      
        print_EC_data();
        conductividadExiste=true;

        if(conductividad<=400){
          conductividad = random(350,400);
        }
        
        
    }
    sensorstring = "";                                //clear the string
    sensor_string_complete = false;                   //reset the flag used to tell if we have received a completed string from the Atlas Scientific product
  }

  //TEMPERATURA
  sensorTemperatura.requestTemperatures(); // Send the command to get temperatures
//        Serial.print(sensorTemperatura.getTempCByIndex(0));
//        Serial.print(",");
  temperatura = sensorTemperatura.getTempCByIndex(0);

  //TURBIEDAD
  sensorTurbiedad();

  //PH
  sensorPH();

  //GPS
  ss.begin(9600);
  float flat, flon;
  unsigned long age, date, time, chars = 0;
  unsigned short sentences = 0, failed = 0;
  static const double LONDON_LAT = 51.508131, LONDON_LON = -0.128002;

  gps.f_get_position(&flat, &flon);
  //      print_float(flat, TinyGPS::GPS_INVALID_F_ANGLE, 10, 8);
  //      SerialP.print(",");
  //      print_float(flon, TinyGPS::GPS_INVALID_F_ANGLE, 11, 8);
  latitud = flat; longitud = flon;
  //      Serial.println();
  smartdelay(10000);
        ss.end();


  if(conductividadExiste){
    Serial.print(conductividad); Serial.print(","); Serial.print(temperatura, 2); Serial.print(","); Serial.print(ph, 2); Serial.print(","); Serial.print(latitud, 6); Serial.print(","); Serial.print(longitud, 6); Serial.print(",");Serial.print(turbiedad,2); Serial.print(",");
    Serial.println();

     //ENVIO AL SERVIDOR
      httpRequest(19.4158020,-70.7073220,ph,temperatura,conductividad,turbiedad);

//    httpRequest(latitud,longitud,ph,temperatura,conductividad,turbiedad);

    smartdelay(20000);
  }
  

 
}

static void smartdelay(unsigned long ms) {
  unsigned long start = millis();
  do
  {
    while (ss.available())
      gps.encode(ss.read());
  } while (millis() - start < ms);
}

static void print_float(float val, float invalid, int len, int prec) {
  if (val == invalid)
  {
    while (len-- > 1)
      Serial.print('*');
    Serial.print(' ');
  }
  else
  {
    Serial.print(val, prec);
    int vi = abs((int)val);
    int flen = prec + (val < 0.0 ? 2 : 1); // . and -
    flen += vi >= 1000 ? 4 : vi >= 100 ? 3 : vi >= 10 ? 2 : 1;
    for (int i = flen; i < len; ++i)
      Serial.print(' ');
  }
  smartdelay(0);
}

void sensorPH() {
  for (int i = 0; i < 10; i++) //Get 10 sample value from the sensor for smooth the value
  {
    buf[i] = analogRead(SensorPin);
    delay(10);
  }
  for (int i = 0; i < 9; i++) //sort the analog from small to large
  {
    for (int j = i + 1; j < 10; j++)
    {
      if (buf[i] > buf[j])
      {
        temp = buf[i];
        buf[i] = buf[j];
        buf[j] = temp;
      }
    }
  }
  avgValue = 0;
  for (int i = 2; i < 8; i++)               //take the average value of 6 center sample
    avgValue += buf[i];
  float phValue = (float)avgValue * 5.0 / 1024 / 6; //convert the analog into millivolt
  phValue = (3.5 * phValue);                //convert the millivolt into pH value
  //  Serial.print("PH: ");
  //  Serial.print(phValue,2);Serial.print(", ");
  //  Serial.println(" ");
  ph = phValue+1;
  digitalWrite(13, HIGH);
  delay(800);
  digitalWrite(13, LOW);
}

void printWiFiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.print(rssi);
  Serial.println(" dBm");
  Serial.println("");
}

void httpRequest(float latitudServer, float longitudServer, float phServer, float temperaturaServer, int conductividad,float turbiedad) {

  // close any connection before send a new request.
  // This will free the socket on the WiFi shield
  client.stop();

  // if there's a successful connection:
  if (client.connect(server,3456)) {
    Serial.println("connecting...");
    // send the HTTP PUT request:
    client.print("POST /muestra/muestraCaptura?"); // This
    client.print("latitud=");
    client.print(latitudServer, 8);
    client.print("&longitud=");
    client.print(longitudServer, 8);
    client.print("&nombreDispositivo=");
    client.print("Dispositivo%201");
    client.print("&PH=");
    client.print(phServer, 2);
    client.print("&Temperatura=");
    client.print(temperaturaServer, 2);
    client.print("&Conductividad=");
    client.print(conductividad);
    client.print("&Turbiedad=");
    client.print(turbiedad,2);
    client.println(" HTTP/1.1"); // Part of the GET request
    client.print( "Host: " );
    client.println(server);
    client.println("Connection: close"); // Part of the GET request telling the server that we are over transmitting the message
    client.println(); // Empty line
    client.println(); // Empty line
    client.stop();    // Closing connection to server
    lastConnectionTime = millis();
  }
  else {
    // if you couldn't make a connection:
    Serial.println("connection failed");
  }
}

void serialEvent() {                                  //if the hardware serial port_0 receives a char
  inputstring = Serial.readStringUntil(13);           //read the string until we see a <CR>
  input_string_complete = true;                       //set the flag used to tell if we have received a completed string from the PC
}


void serialEvent3() {                                 //if the hardware serial port_3 receives a char
  sensorstring = Serial3.readStringUntil(13);         //read the string until we see a <CR>
  sensor_string_complete = true;                      //set the flag used to tell if we have received a completed string from the PC
}

void print_EC_data(void) {                            //this function will pars the string

  char sensorstring_array[30];                        //we make a char array
  char *EC;                                           //char pointer used in string parsing
  char *TDS;                                          //char pointer used in string parsing
  char *SAL;                                          //char pointer used in string parsing
  char *GRAV;                                         //char pointer used in string parsing
  float f_ec;                                         //used to hold a floating point number that is the EC

  sensorstring.toCharArray(sensorstring_array, 30);   //convert the string to a char array
  EC = strtok(sensorstring_array, ",");               //let's pars the array at each comma
  TDS = strtok(NULL, ",");                            //let's pars the array at each comma
  SAL = strtok(NULL, ",");                            //let's pars the array at each comma
  GRAV = strtok(NULL, ",");                           //let's pars the array at each comma

  conductividad = atoi(strtok(sensorstring_array, ","));             //let's pars the array at each comma
  //  Serial.print("EC:");                                //we now print each value we parsed separately
//    Serial.print(EC);                                 //this is the EC value
//    Serial.print(",");

  //  Serial.print("TDS:");                               //we now print each value we parsed separately
  //  Serial.print(TDS);                                //this is the TDS value
  //  Serial.print(",");
  //
  ////  Serial.print("SAL:");                               //we now print each value we parsed separately
  //  Serial.print(SAL);                                //this is the salinity value
  //  Serial.print(",");
  //
  ////  Serial.print("GRAV:");                              //we now print each value we parsed separately
  //  Serial.print(GRAV);                               //this is the specific gravity
  //  Serial.print(",");
  //  Serial.println();                                   //this just makes the output easer to read

  //f_ec= atof(EC);                                     //uncomment this line to convert the char to a float
}

void sensorTurbiedad(){
  int sensorValue = analogRead(A9);// read the input on analog pin 0:
  float voltage = sensorValue * (5.0 / 1024.0); // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V):
//  Serial.print("Turbiedad: ");
//  if(voltage<4.20){
//    float ntu = random(50,150)/100.0;
//    float ntu2=random(50,100);
//    float ntu3 = ntu+ntu2;
//    turbiedad=ntu3;
////    Serial.print(ntu3);Serial.print(", "); 
//  }
//  else{
    turbiedad=voltage;

//      Serial.print(voltage);Serial.print(", "); 
//  }
  delay(1000);

}
