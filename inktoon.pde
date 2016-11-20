int i, j, k, l, p = 0;
String colorMode = "blue" ;
float r, g, bpix, opix = 0;
PImage img;
color blue = color(0, 0, 255);
color red = color(255, 0, 0);
color green = color(0, 255, 0);

void setup() {
  size( 600, 600 );
  smooth();
//  background( 255 ); //0:black 255:white
  img = loadImage( "background.png" );
  image(img, 0, 0);
}

void draw() {
  if(mousePressed == true) i++;
  else i = 0;
  displayColorRatio();
}

//void mouseClicked() {
//  stroke( #0000ff );
//  strokeWeight( 1 );
//  point( mouseX, mouseY );
//}

void mouseReleased(){
  pushMatrix();
  img = loadImage( "splatter.png" ); //500*500
  translate(mouseX-(i/2), mouseY-(i/2));
//  rotate(radians(random(360))); //rotate atomawasahi
  if (colorMode == "blue"){
    tint(blue);
  }
  else tint(255,165,0);
  image(img, 0, 0, i, i);
  popMatrix();
  
  //stroke(#0000ff); //blue
  //strokeWeight(i); //rect size
  //point( mouseX, mouseY );
  //for(j=0; j<i/5; j++){
  //  stroke(#0000ff); //blue
  //  strokeWeight(random(i)/5); //rect size
  //  point( mouseX+random(i)/1.8, mouseY+random(i)/1.8);
  //  strokeWeight(random(i)/5); //rect size
  //  point( mouseX+random(i)/1.8, mouseY-random(i)/1.8);
  //  strokeWeight(random(i)/5); //rect size
  //  point( mouseX-random(i)/1.8, mouseY+random(i)/1.8);
  //  strokeWeight(random(i)/5); //rect size
  //  point( mouseX-random(i)/1.8, mouseY-random(i)/1.8);
  //}
}

void mouseDragged(){
  //stroke( #0000ff ); //blue
  //strokeWeight( 5 ); //rect size
  //point( mouseX, mouseY ); 
}

void keyPressed() {
  if ( key == 'c' ) {
  noTint();
  img = loadImage( "background.png" );
  image(img, 0, 0);
  }
  if (key == 'o'){
    colorMode = "orange";
  }
  if (key == 'b'){
    colorMode = "blue";
  }
}

void displayColorRatio(){
    fill(255);
    strokeWeight(0);
    rect(0, 580, 600, 20);
    
    for(k=0; k<width; k++){
      for(l=0; l<height-20; l++){
         p = get(k,l);
         if(red(p) == 0 && green(p)== 0 && blue(p) == 114) bpix++;
         if(red(p) == 45 && green(p)== 138 && blue(p) == 0) opix++;
      }
    }
    
    bpix = bpix*100/width/height;
    opix = opix*100/width/height;
    fill(0);
    text("blue:" + nf(bpix, 0, 2) + "%  VS  orange:" + nf(opix, 0, 2) + "%", 0, 595);
}