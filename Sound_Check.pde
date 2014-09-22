import ddf.minim.*;

Minim minim;
AudioInput in;
int k;
float theamp;
int a, b, c, d, e, f, g, h, i, j, a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, x, y;
float sensitivity;

void setup()
{
  size(1000, 1000);
  a = width/4;
  b= height/2;
  a1=720;
  b1=560;

  c=width/3;
  d=height/3;
  c1=525;
  d1=330;

  e=670;
  f=220;
  e1=270;
  f1=620;

  g=750;
  h=600;
  g1=277;
  h1=233;

  i=525;
  j=500;
  i1=500;
  j1=436;
  k=1;
  minim = new Minim(this);
  background(0);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  sensitivity=100;
}

void draw()
{
  strokeWeight(0.25);
  if (k==0)
  {
    //background(0);
    noStroke();
    fill(0, 0, 0, 10);
    rect(0, 0, width-1, height-1);
    stroke(255);
  } else
  {
    //background(255);
    noStroke();
    fill(255, 255, 255, 10);
    rect(0, 0, width-1, height-1);
    stroke(0);
  }
  float rawamp = 0.;
  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize () - 1; i++)
  {
    rawamp = rawamp + abs(in.left.get(i)); // add the abs value of the current sample to the amp
  }
  rawamp = rawamp / in.bufferSize();

  theamp = mysmooth(rawamp, theamp, 0.9);

  //println(rawamp*100);
  println(theamp*100);
  if ((theamp*sensitivity)>8)
  { 
    if (k==0)
    {
      x=a1;
      y=b1;
    } else
    {
      x=a;
      y=b;
    }
    fill (0, 255, 255, 50);
    //translate(width/2, height*(1.0/3.0));
    //sphere(height*rawamp);
    ellipse(x, y, height*theamp*6, height*theamp*6 );
  }
  if ((theamp*sensitivity)>6)
  {
    if (k==0)
    {
      x=c1;
      y=d1;
    } else
    {
      x=c;
      y=d;
    }
    fill (0, 255, 0, 60);
    //translate(width/2, height*(1.0/3.0));
    //sphere(height*rawamp);
    ellipse(x, y, height*theamp*4.5, height*theamp*4.5);
  }
  if ((theamp*sensitivity)>4)
  {
    if (k==0)
    {
      x=e1;
      y=f1;
    } else
    {
      x=e;
      y=f;
    }
    fill (188, 19, 254, 70);
    //translate(width/2, height*(1.0/3.0));
    //sphere(height*rawamp);
    ellipse(x, y, height*theamp*2.5, height*theamp*2.5);
  }
  if ((theamp*sensitivity)>2)
  {
    if (k==0)
    {
      x=g1;
      y=h1;
    } else
    {
      x=g;
      y=h;
    }
    fill (255, 0, 0, 75);
    //translate(width/2, height*(1.0/3.0));
    //sphere(height*rawamp);
    ellipse(x, y, height*theamp*1.5, height*theamp*1.5);
  }
  if ((theamp*sensitivity)>0)
  {
    if (k==0)
    {
      x=i1;
      y=j1;
    } else
    {
      x=i;
      y=j;
    }
    fill (255, 0, 255, 75);
    //translate(width/2, height*(1.0/3.0));
    //sphere(height*rawamp);
    ellipse(x, y, height*theamp, height*theamp);
  }
}

void keyReleased()
{
  if (key==' ')
  {
    if (k==0)
    { 
      background(255);
      k++;
    } else
    {
      background(0);
      k--;
    }
  }
}

float mysmooth(float x, float y, float a)
{
  return(a*y + (1.0-a)*x);
}

