public final static int SCREEN_SIZE = 500;
public final static int NUM_PARTICLES = 150;

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
	// for (int k = 0; k < 2; k++)
	// {
	// for (int j = 0; j < NUM_PARTICLES; j++)
	// {
	for (int i = 0; i < NUM_PARTICLES; i++)
	{
		particles[i].move();
		particles[i].show();
	}
	// }
	// }


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
		speed = Math.random()*3;
	}
	public void move()
	{
		x += Math.cos(theta)*speed;
		y += Math.sin(theta)*speed;
		if ((x < 0 && y > 0) /* && 
			(y < SCREEN_SIZE || y > SCREEN_SIZE)*/)
		{
			// System.out.println("Here!");
			x -= Math.cos(theta*speed);
			y -= Math.sin(theta*speed);
		}
		// System.out.println(x);
		// System.out.println(y);
	}
	public void show()
	{
		noStroke();
		fill(r, g, b); 
		ellipse((float)x, (float)y, 5, 5);
	}
	public void wrap()
	{
		if ((x < SCREEN_SIZE || x > SCREEN_SIZE)  && 
			(y < SCREEN_SIZE || y > SCREEN_SIZE))
		{
			// System.out.println("Here!");
			// x = SCREEN_SIZE/2;
			// y = SCREEN_SIZE/2;
			redraw();
		}
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
		y = SCREEN_SIZE/2;
		theta = Math.random()*(2*Math.PI);
		speed = Math.random()*3;
	}
	public void move() 
	{
		int randDir = (int)(Math.random()*4);
		if (randDir == 0)
		{
			x += (int)(Math.random()*5)-3;
			y += (int)(Math.random()*5)-3;			
		}
		else if (randDir == 1)
		{
			x -= (int)(Math.random()*5)-3;
			y += (int)(Math.random()*5)-3;
		}
		else if (randDir == 2)
		{
			x += (int)(Math.random()*5)-3;
			y -= (int)(Math.random()*5)-3;
		}
		else if (randDir == 3)
		{
			x -= (int)(Math.random()*5)-3;
			y -= (int)(Math.random()*5)-3;			
		}

	};
	public void show() 
	{
		noStroke();
		fill(r, g, b);
		ellipse((float)x, (float)y, 9, 9);
	};
	public void wrap()
	{
		if ((x < 0 || x > 0)  && 
			(y < SCREEN_SIZE || y > SCREEN_SIZE))
		{
			redraw();
			// System.out.println("Here!");
			// x -= Math.cos(theta*speed);
			// y -= Math.sin(theta*speed);
		}
	}
}

class JumboParticle extends NormalParticle //uses inheritance
{
	public void show()
	{
		fill(r, g, b);
		ellipse((float)x, (float)y, 15, 15);
	}
}