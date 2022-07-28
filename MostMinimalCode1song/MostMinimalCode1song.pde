import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates an object to access all functions
AudioPlayer song1, song2;
AudioMetaData songMetaData1;

color black = #000000, purple = #2C08FF, resetWhite = 255;
float titleX, titleY, titleWidth, titleHeight;
PFont titleFont;

void setup() {

  size(500, 400); //Landscape

  minim = new Minim(this); //this loads from a data directory, loadFile should also load from project folder, like loadImage
  song1 = minim.loadFile("MostMinimalCode_OneSongPlay_groove.mp3"); //in this method, can pass absoltue path, file name and extension, and URL
  song2 = minim.loadFile("Waterfall.mp3");
  songMetaData1 = song1.getMetaData();
  //song1.play(); //this method has a parameter -> its the miliseconds from which the song starts to play
  //song1.loop(0); //its parameter passed is the number of times it will repeat; if no parameter passed, it will play infintely

  //Population
  titleX = width*1/4;
  titleY = height*0;
  titleWidth = width*1/2;
  titleHeight = height*1/10;
  titleFont = createFont("Arial Narrow", 55);
  
  //Verifying Meta Data, 18 println's 
  println( "File Name: ", songMetaData1.fileName() );
  println( "Song Length (in milliseconds): ", songMetaData1.length() );
  println( "Song Length (in seconds): ", songMetaData1.length()/1000 );
  println( "Song Length (in minutes & seconds): ", (songMetaData1.length()/1000)/60, " minute", (songMetaData1.length()/1000)-((songMetaData1.length()/1000)/60 * 60), " seconds" );
  println( "Song Title: ", songMetaData1.title() );
  println( "Author: ", songMetaData1.author() ); //Song Writer or Performer
  println( "Composer: ", songMetaData1.composer() ); //Song Writer
  println( "Orchestra: ", songMetaData1.orchestra() );
  println( "Album: ", songMetaData1.album() );
  println( "Disk: ", songMetaData1.disc() );
  println( "Publisher: ", songMetaData1.publisher() );
  println( "Date Release: ", songMetaData1.date() );
  println( "Copyright: ", songMetaData1.copyright() );
  println( "Comment: ", songMetaData1.comment() );
  println( "Lyrics: ", songMetaData1.lyrics() );
  println( "Track: ", songMetaData1.track() );
  println( "Genre: ", songMetaData1.genre() );
  println( "Encoded: ", songMetaData1.encoded() ); //how a computer reads the file
  
}

void draw() {
  //if (song1.isLooping() && song1.loopCount() != 1) println("There are", song1.loopCount(), "loops left.");
  //if (song1.isLooping() && song1.loopCount() == -1) println("Looping infinitely"); //-1 denotes infinity 
  //if (song1.isPlaying() && !song1.isLooping()) println("Play once."); //'!' is the 'NOT' operator; is basically saying -> 'if the song is playing AND NOT looping, then print "Play Once."
  //println("Song position", song1.position(), "Song length", song1.length());

  background(black);
  rect(titleX, titleY, titleWidth, titleHeight);
  fill(purple);//is the ink
  textAlign(CENTER, CENTER);
  textFont(titleFont, 30); //title font
  text(songMetaData1.title(), titleX, titleY, titleWidth, titleHeight);
  fill(resetWhite);




  
} 


void keyPressed() {
  //First play button
  //if (key == 'p' || key == 'P') {
  //  song1.play(); //Note: for char -> characters would use single quotes (''); whereas for str -> strings would use double quotes ("").
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
    if (song1.isPlaying()) {
      song1.loop(loopNum);
    } else if (song2.isPlaying()) {
      song2.loop(loopNum);
    }
    //End Looping only once
  }//'{}' is the body of the if statement; hence making the single line if statement into a multiline if statement


  if (key == 'i' || key == 'I') song1.loop(); //Inifinte Loop, no parameter or -1
  if (key >= '2' || key == '0') println("I dont loop  that much press 'i' for infinite loop"); //'0' is the quivalent to infinity in maths


  if (key == 'm' || key == 'M') {//Mute Button  
    if (song1.isPlaying()) {
      if (song1.isMuted()) {
        song1.unmute();
      } else {
        song1.mute();
      }
    } else if (song2.isPlaying()) {
      if (song2.isMuted()) {
        song2.unmute();
      } else {
        song2.mute();
      }
    }
  }//end Mute button


  //start fast forward key 
  if (key == 'f' || key == 'F') {
    if (song1.isPlaying()) {
      song1.skip(1000);
    } else if (song2.isPlaying()) {
      song2.skip(1000);
    }
  } //skip forward by 1 second(1000 milliseconds)
  //end
  //start reverse forward key
  if (key == 'r' || key == 'R') {
    if (song1.isPlaying()) {
      song1.skip(-1000);
    } else if (song2.isPlaying()) {
      song2.skip(-1000);
    }
  }
  //skip backwards by (-)1 second(-1000 milliseconds)
  //end


  //stop button
  if (key == 's' || key == 'S') {
    if (song1.isPlaying()) { //song1 is playing
      song1.rewind();
      song1.play();
    } else if (song1.isPlaying()) { //song1 not playing
      song1.rewind();
    } else if (song2.isPlaying()) {
      song2.rewind();
      song2.play();
    } else if (song2.isPlaying()) {
      song2.rewind();
    }
  }

  if (key == 'p' || key == 'P') {//Pause Button anf Play button
       
      if (song1.isPlaying()){
        song1.pause();
      }
      else if ( song1.position() >= song1.length() - song1.length()*1/5) {
        song1.rewind();
        song1.play();
      } else {
        song1.play(); //if the song is not playing then we mae the song play
      }
  }//end
  
  if (key == 'p' || key == 'P') {
    if (song1.position() >= song1.length() - song1.length()*1/5 ) {
      song2.play();
      
      if(song2.isPlaying()){
        song2.pause(); 
      }
      
      if (song2.position() >= song2.length() - song2.length()*(1/5) ) {
        song2.rewind();
        song2.play();
      } else {
        song2.play();
      }
    }
  }




  //int loopNum3 = 2; //Local Variable
  //if (key == 'l' || key == 'L') song1.loop(loopNum3);
}

void mousePressed() {
}
//End MAIN program
