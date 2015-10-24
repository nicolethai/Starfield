public final static int SCREEN_SIZE = 750;
public final static int NUM_PARTICLES = 125;

Particle[] particles = new Particle[NUM_PARTICLES];
Particle[] moreParticles = new Particle[NUM_PARTICLES];

public int newX = SCREEN_SIZE/2, newY = (SCREEN_SIZE-100)/2;

PImage popcorn, soda;

void setup()
{
	size(SCREEN_SIZE, (SCREEN_SIZE-100));
	popcorn = loadImage("popcorn.png");
	soda = loadImage("soda.png");
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i] = new NormalParticle();
		moreParticles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
	particles[1] = new JumboParticle();              
}
void draw()
{
	background(255);
	
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i].move();
		particles[i].show();
		particles[i].wrap();
		moreParticles[i].move();
		moreParticles[i].show();
		moreParticles[i].wrap();
	}
}

void mouseClicked()
{
	// setup();
	newX = mouseX;
	newY = mouseY;
}


class NormalParticle implements Particle
{
	int r, g, b, size;
	double x, y, theta, speed;
	NormalParticle()
	{
		r = (int)(Math.random()*255);
		g = (int)(Math.random()*255);
		b = (int)(Math.random()*255);
		size = (int)((Math.random()*50)+20);
		x = SCREEN_SIZE/2;
		y = (SCREEN_SIZE-100)/2;
		theta = Math.random()*(2*Math.PI);
		speed = Math.random()*3;
	}
	public void move()
	{
		x += Math.cos(theta)*speed;
		y += Math.sin(theta)*speed;
	}
	public void show()
	{
		image(popcorn, (float)x, (float)y, size, size);
	}
	public void wrap()
	{
		if ((x < 0 || x > SCREEN_SIZE)  && 
			(y < 0 || y > (SCREEN_SIZE-100)))
		{
			x = newX;
			y = newY;
			theta = Math.random()*(2*Math.PI);
			speed = Math.random()*2;
		}
		move();
	}

}

interface Particle
{
	public void move();
	public void show();
	public void wrap();
}

class OddballParticle implements Particle //uses an interface
{
	int r, g, b;
	double x, y, theta, speed;
	OddballParticle()
	{
		r = (int)(Math.random()*255);
		g = (int)(Math.random()*255);
		b = (int)(Math.random()*255);
		x = SCREEN_SIZE/2;
		y = (SCREEN_SIZE-100)/2;
		theta = Math.random()*(2*Math.PI);
		speed = Math.random()*3;
	}
	public void move() 
	{
		int randDir = (int)(Math.random()*4);
		if (randDir == 0)
		{
			x += (int)(Math.random()*9)-3;
			y += (int)(Math.random()*9)-3;			
		}
		else if (randDir == 1)
		{
			x -= (int)(Math.random()*9)-3;
			y += (int)(Math.random()*9)-3;
		}
		else if (randDir == 2)
		{
			x += (int)(Math.random()*9)-3;
			y -= (int)(Math.random()*9)-3;
		}
		else if (randDir == 3)
		{
			x -= (int)(Math.random()*9)-3;
			y -= (int)(Math.random()*9)-3;			
		}

	};
	public void show() 
	{
		image(soda, (float)x, (float)y, 30, 60);
	};
	public void wrap()
	{
		if ((x < 0 || x > SCREEN_SIZE)  && 
			(y < 0 || y > (SCREEN_SIZE-100)))
		{
			x = newX;
			y = newY;
			theta = Math.random()*(2*Math.PI);
			speed = Math.random()*2;		
		}
		move();
	} 
}

class JumboParticle extends NormalParticle //uses inheritance
{
	public void show()
	{
		image(popcorn, (float)x, (float)y, 100, 100);
	}
}
