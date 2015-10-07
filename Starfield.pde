public final static int SCREEN_SIZE = 500;
public final static int NUM_PARTICLES = 10;

Particle[] particles = new Particle[NUM_PARTICLES];

void setup()
{
	background(0);
	size(SCREEN_SIZE, SCREEN_SIZE);
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
}
void draw()
{
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i].move();
		particles[i].show();
	}
}

class NormalParticle implements Particle
{
	int someColor;
	double x, y, theta, speed;
	NormalParticle()
	{
		someColor = 255;
		x = SCREEN_SIZE/2;
		y = SCREEN_SIZE/2;
		theta = Math.random()*(2*Math.PI);
		speed = Math.random()*10;
	}
	public void move()
	{
		x += Math.cos(theta*speed);
		y += Math.sin(theta*speed);
	}
	public void show()
	{
		fill(someColor);
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
	int someColor;
	OddballParticle()
	{
		someColor = 125;
		x = SCREEN_SIZE/2;
		y = SCREEN_SIZE/2;
		theta = Math.random()*(2*Math.PI);
		speed = Math.random()*5;
	}
	public void move() 
	{
		x++;
		y++;
	};
	public void show() 
	{
		fill(someColor);
		ellipse((float)x, (float)y, 9, 9);
	};
}
class JumboParticle implements Particle //uses inheritance
{
	//your code here
}

