class Elements {

  void displayMainTitle() {
    background(#008080);
    fill(#FFFFFF);
    textSize(60);
    text("Touch and Communicate", width/2, height/2);
    textFont(myFont);
    textAlign(CENTER);
    noStroke();
    rectMode(CENTER);
    fill(229, 91, 60, 145);
    rect(width/2, height/2 + 110, 30, 30);
    fill(62, 160, 85, 145);
    rect(width/2, height/2 + 140, 30, 30);
    fill(255, 232, 124, 145);
    rect(width/2, height/2 + 170, 60, 30);

    if ( (frameCount-pastTime+1) % transitionSpeed == 0) {
      seq = 1;
      pastTime = frameCount;
    }
  }

  void displayText() {
    if (textIndex == 3) {
      background(#3EA055);
      fill(#624C92);
    } else if (textIndex == 2) {
      background(#E55B3C);
      fill(#1FC2DB);
    } else {
      background(#FFE87C);
      fill(#7D95FF);
    }
    textSize(36);
    text(yellowBloc[textIndex], width/2, height/2); 

    // change text index
    if ( (frameCount-pastTime) % transitionSpeed == 0) {
      textIndex++;
      if (textIndex > yellowBloc.length - 1) {
        textIndex = 0;
      }
    }
  }

  void drawResultQuestion() {
    textAlign(CENTER, CENTER);
    textSize(200);
    fill(255, 255, 255, 20);
    text(styleText, width / 2, height / 2);
  }

  void drawResultBackground(int col, String str) {
    if (col == 'r') {
      // red
      background(#E55B3C);
      fill(#1FC2DB);
    } else if (col == 'g') {
      // green
      background(#3EA055);
      fill(#624C92);
    }
    textSize(26);
    text( str, width / 2, height / 2, 270, 150);
  }

  void displayResults() {
    // check for RFIDs
    if (tagID.equals("72005F6074")) {
      drawResultBackground('g', questionGreen[0]);
      drawResultQuestion();
    } else if (tagID.equals("6F006BC724")) {
      drawResultBackground('g', questionGreen[1]);
      drawResultQuestion();
    } else if (tagID.equals("72005F7839")) {
      drawResultBackground('g', questionGreen[2]);
      drawResultQuestion();
    } else if (tagID.equals("72005F5258")) {
      drawResultBackground('g', questionGreen[3]);
      drawResultQuestion();
    } else if (tagID.equals("72005F266A")) {
      drawResultBackground('r', questionRed[0]);
      drawResultQuestion();
    } else if (tagID.equals("72005F76F3")) {
      drawResultBackground('r', questionRed[1]);
      drawResultQuestion();
    } else if (tagID.equals("72005F765B")) {
      drawResultBackground('r', questionRed[2]);
      drawResultQuestion();
    } else if (tagID.equals("72005F76F0")) {
      drawResultBackground('r', questionRed[3]);
      drawResultQuestion();
    }

    if ( (frameCount-pastTime) > 500) {
      seq = 0;
      pastTime = frameCount;
    }
  }
}