public final static int SCREEN_SIZE = 500;
public final static int NUM_PARTICLES = 10;

NormalParticle[] particles = new NormalParticle[NUM_PARTICLES];

void setup()
{
	background(0);
	size(SCREEN_SIZE, SCREEN_SIZE);
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i] = new NormalParticle();
	}
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
	int partColor;
	double partX, partY, partTheta, partSpeed;
	NormalParticle()
	{
		partColor = 255;
		partX = SCREEN_SIZE/2;
		partY = SCREEN_SIZE/2;
		partTheta = Math.random()*(2*Math.PI);
		partSpeed = Math.random()*10;
	}
	public void move()
	{
		partX += Math.cos(partTheta*partSpeed);
		partY += Math.sin(partTheta*partSpeed);
	}
	public void show()
	{
		fill(partColor);
		ellipse((float)partX, (float)partY, 5, 5);
	}

}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle //uses an interface
{
	//your code here
}
class JumboParticle implements Particle //uses inheritance
{
	//your code here
}

