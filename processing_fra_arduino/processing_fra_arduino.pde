
import processing.serial.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import ddf.minim.*;
Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
Serial myPort;
String message[]=new String[4];
String returnVal="abcde";
String values="";
char tempVal1='x';
char tempVal2='y';
char tempVal3='z';
char tempVal4='q';
char val1='a';
char val2='a';
char val3='a';
char val4='a';

void setup()
{
  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);
  minim = new Minim(this);
  song1 = minim.loadFile("01 Ain't No Sunshine.mp3");
  song2 = minim.loadFile("01 Uprising.mp3");
  song3 = minim.loadFile("02 Maestro.mp3");
}

String serialEvent()
{
  for(int i=0;i<4;i++)
  { message[i] = myPort.readStringUntil('\r');
           if(message[i] != null)
               {
               returnVal = (message[i]);
                }
  }
  return returnVal;
}

void draw()
{
  values = serialEvent();
  print(values);
  val1 = values.charAt(1);
  val2 = values.charAt(2);
  val3 = values.charAt(3);
  val4 = values.charAt(4);


  if ((val1 == '0') && (tempVal1 != val1)) 
    {
    if ((song2.isPlaying()) || (song3.isPlaying()))
      {
        song2.pause();
        song2.rewind();
        song3.pause();
        song3.rewind();
      }
    song1.play(); 
    tempVal1 = val1;
    tempVal2 = 'y';
    tempVal3 = 'z';
    tempVal4 = 'q';
    }
  if ((val2 == '0') && (tempVal2 != val2)) 
    {
    if ((song1.isPlaying()) || (song3.isPlaying()))
      {
        song1.pause();
        song1.rewind();
        song3.pause();
        song3.rewind();
      }
    song2.play();
    tempVal1 = 'x';
    tempVal2 = val2;
    tempVal3 = 'z';
    tempVal4 = 'q';
    }
  if ((val3 == '0') && (tempVal3 != val3)) 
    {
    if ((song1.isPlaying()) || (song2.isPlaying()))
      {
        song1.pause();
        song1.rewind();
        song2.pause();
        song2.rewind();
      }
    song3.play();
    tempVal1 = 'x';
    tempVal2 = 'y';
    tempVal3 = val3;
    tempVal4 = 'q';
    }
    if ((val4 == '0') && (tempVal4 != val4)) 
    {
    if ((song1.isPlaying()) || (song2.isPlaying()) || (song3.isPlaying()))
      {
        song1.pause();
        song1.rewind();
        song2.pause();
        song2.rewind();
        song3.pause();
        song3.rewind();
      }
    tempVal1 = 'x';
    tempVal2 = 'y';
    tempVal3 = 'z';
    tempVal4 = val4;
    }
}
