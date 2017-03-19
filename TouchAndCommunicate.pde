import processing.serial.*;
Serial myPort;

Elements element;
String tagID = "";
PFont myFont;  
String val; 
int pastTime;    
String styleText = "Q&A";

String[] yellowBloc = {
  "> Please answer all questions out loud", 
  "> Now get to know each other", 
  "Tell green user your name", 
  "Tell red user your name", 
  "> Choose block and place slowly for Q&A", 
};

String[] questionRed = {
  "What borough do you live in?", 
  "If you could have a superpower, what would it be?", 
  "Who has influenced you the most?", 
  "What's your favorite music genre?"
};

String[] questionGreen = {
  "What's your favorite movie genre?", 
  "If you were to write a book, what would you choose as the title?", 
  "If you could be a movie/T.V show character, who would you choose?", 
  "Choose one you have to give up - ice cream, cake or cookies?"
};

int seq = 0;
int textIndex = 0;
int transitionSpeed = 250;

void setup() {
  element = new Elements();
  
  //fullScreen();
  println(Serial.list());

  myFont = createFont("assets/fonts/Minecraft.ttf", 32);

  String portnum = Serial.list() [1];
  myPort = new Serial(this, portnum, 9600);
  myPort.bufferUntil(0x03);
}

void draw() {

  switch ( seq ) {
  case 0:
    element.displayMainTitle();
    break;
  case 1:
    element.displayText();
    break;
  case 2:
    element.displayResults();
    break;
  }
}

void serialEvent(Serial myPort) {
  String inputString = myPort.readString();

  char firstChar = inputString.charAt(0);

  char lastChar = inputString.charAt(inputString.length() - 1);

  if ((firstChar == 0x02) && (lastChar == 0x03)) {
    tagID = inputString.substring(1, 11);
    seq = 2;
    pastTime = frameCount;
  }
}

void keyPressed() {
  textIndex = 0;
}