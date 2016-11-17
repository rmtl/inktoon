int i = 0;

void setup() {
  size( 600, 600 );
  smooth();
  background( 0 ); //0:black 255:white
}

void draw() {
  if(mousePressed == true) i++;
  else i = 0;
}

//void mouseClicked() {
//  stroke( #0000ff );
//  strokeWeight( 1 );
//  point( mouseX, mouseY );
//}

void mouseReleased(){
  stroke(#0000ff); //blue
  strokeWeight(i); //rect size
  point( mouseX, mouseY );
}

void mouseDragged(){
  stroke( #0000ff ); //blue
  strokeWeight( 5 ); //rect size
  point( mouseX, mouseY ); 
}

void keyPressed() {
  if ( key == 'c' ) {
    background( 0 ); //white
  }
}