public final static int SCREEN_SIZE = 500;
public final static int NUM_PARTICLES = 50;

Particle[] particles = new Particle[NUM_PARTICLES];

void setup()
{
	size(SCREEN_SIZE, SCREEN_SIZE);
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
	particles[1] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i].move();
		particles[i].show();
	}
}

void mouseClicked()
{
	setup();
}

class NormalParticle implements Particle
{
	int r, g, b;
	double x, y, theta, speed;
	NormalParticle()
	{
		r = (int)(Math.random()*255);
		g = (int)(Math.random()*255);
		b = (int)(Math.random()*255);
		x = SCREEN_SIZE/2;
		y = SCREEN_SIZE/2;
		theta = Math.random()*(2*Math.PI);
		speed = Math.random()*1;
	}
	public void move()
	{
		x += Math.cos(theta*speed);
		y += Math.sin(theta*speed);
	}
	public void show()
	{
		fill(r, g, b);
		ellipse((float)x, (float)y, 5, 5);
	}

}

interface Particle
{
	public void move();
	public void show();
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
		y = SCREEN_SIZE/2;
		theta = Math.random()*(2*Math.PI);
		speed = Math.random()*2;
	}
	public void move() 
	{
		x++;
		y++;
	};
	public void show() 
	{
		fill(r, g, b);
		ellipse((float)x, (float)y, 9, 9);
	};
}

class JumboParticle extends NormalParticle //uses inheritance
{
	public void show()
	{
		fill(r, g, b);
		ellipse((float)x, (float)y, 15, 15);
	}
}