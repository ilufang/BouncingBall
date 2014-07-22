int cx = 800, cy = 600;

void setup()
{
  size(cx, cy);
  frameRate(50); // Each draw is 0.05s
}

class Ball
{
  float x,y;
  float vx,vy;
  Ball(float v0x, float v0y)
  {
    x = cx/2;
    y = cy/2;
    vx = v0x;
    vy = v0y;
  }
  Ball()
  {
    x=cx/2;
    y=cy/2;
    vx=0;
    vy=0;
  }
  void move()
  {
    if(x>cx||x<0)
    {
      vx*=-1;
    }
    if(y>cy||y<0)
    {
      vy*=-1;
    }
    x+=vx;
    y+=vy;
  }
  void draw()
  {
    move();
    stroke(#000000);
    fill(#66CCFF);
    ellipse(x,y,30,30);
  }
}

class gravity_ball extends Ball
{
  void move()
  {
    if(mousePressed)
    {
      vx = mouseX-x;
      vy = mouseY-y;
      x = mouseX;
      y = mouseY;
    }
    else{
      if(x>cx||x<0)
      {
        vx*=-1;
      }
      if(y>cy||y<0)
      {
        vy*=-1;
      }
      if(y<cy)
      {
        vy+=0.5;
      }
      x+=vx;
      y+=vy;
    }
  }
  gravity_ball(float v0x, float v0y)
  {
    x = cx/2;
    y = cy/2;
    vx = v0x;
    vy = v0y;
  }
  void draw()
  {
    move();
    stroke(#000000);
    fill(#66BB21);
    ellipse(x,y,30,30);
  }
}

class controled_ball extends Ball
{
  void move()
  {
    vx=(mouseX-x)/20;
    vy=(mouseY-y)/20;
    x+=vx;
    y+=vy;
  }
  controled_ball()
  {
    x = cx/2;
    y = cy/2;
    vx = 0;
    vy = 0;
  }
  void draw()
  {
    move();
    stroke(#000000);
    fill(#FF6666);
    ellipse(x,y,30,30);
  }
}

Ball ball1 = new Ball(4,0);
Ball ball2 = new Ball(0,4);
Ball ball3 = new Ball(4,4);
controled_ball ball4 = new controled_ball();
gravity_ball ball5 = new gravity_ball(10,-10);




void draw()
{
  background(#ffffff);
  ball1.draw();
  ball2.draw();
  ball3.draw();
  ball4.draw();
  ball5.draw();
}
