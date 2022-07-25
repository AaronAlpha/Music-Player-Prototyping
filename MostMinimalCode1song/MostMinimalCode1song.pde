import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates an object to access all functions
AudioPlayer song1;

void setup() {
  minim = new Minim(this); //this loads from a data directory, loadFile should also load from project folder, like loadImage
  song1 = minim.loadFile("Waterfall.mp3"); //in this method, can pass absoltue path, file name and extension, and URL
  //song1.play(); //this method has a parameter -> its the miliseconds from which the song starts to play
  //song1.loop(0); //its parameter passed is the number of times it will repeat; if no parameter passed, it will play infintely
}

void draw() {
  if (song1.isLooping() && song1.loopCount() != 1) println("There are", song1.loopCount(), "loops left.");
  if (song1.isLooping() && song1.loopCount() == -1) println("Looping infinitely"); //-1 denotes infinity 
  if (song1.isPlaying() && !song1.isLooping()) println("Play once."); //'!' is the 'NOT' operator; is basically saying -> 'if the song is playing AND NOT looping, then print "Play Once."
  println("Song position", song1.position(), "Song length", song1.length());
} 


void keyPressed() {
  //First play button
  //if (key == 'p' || key == 'P') {
  //  song1.play(); //Note: for char -> characters would use single quotes (''); whereas for str -> strings would use double quotes ("").
  //  if (song1.position() >= song1.length()) {
  //    song1.rewind();
  //  }
  //}
  
  
  //Alternate play button, as a finite loop() && infinite loop()
  //only press a number for this code below
  println(key);
  if ( key == '1'  /*|| key == '9'*/) {//Looping only once
    if (key == '1') println("Looping once");
    //(key == '9') println("Looping 9 times");
    String keystr  = String.valueOf(key);
    println("Number of repeats is", keystr);
    int loopNum = int(keystr);
    song1.loop(loopNum);
    //End Looping only once
  }//'{}' is the body of the if statement; hence making the single line if statement into a multiline if statement


  if (key == 'i' || key == 'I') song1.loop(); //Inifinte Loop, no parameter or -1
  if (key >= '2' || key == '0') println("I dont loop  that much press 'i' for infinite loop"); //'0' is the quivalent to infinity in maths


  if (key == 'm' || key == 'M') {//Mute Button  
    if (song1.isMuted()) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }//end Mute button


  //start fast forward key 
  if (key == 'f' || key == 'F') song1.skip(1000); //skip forward by 1 second(1000 milliseconds)
  //end
  //start reverse forward key
  if (key == 'r' || key == 'R') song1.skip(-1000); //skip backwards by (-)1 second(-1000 milliseconds)
  //end


  //stop button
  if (key == 's' || key == 'S') {
    if (song1.isPlaying()) { //song is playing
      song1.rewind();
      song1.play();
    } else {//song not playing
      song1.rewind();
    }
  }


  if (key == 'p' || key == 'P') {//Pause Button anf Play button
    if (song1.isPlaying()) {
      song1.pause();
    } else if ( song1.position() >= song1.length() - song1.length()*1/5 ) {
      song1.pause();
      song1.rewind();
    } else {
      song1.play(); //if the song is not playing then we mae the song play
      
    }
  }//end




  //int loopNum3 = 2; //Local Variable
  //if (key == 'l' || key == 'L') song1.loop(loopNum3);
}

void mousePressed() {
}
//End MAIN program
