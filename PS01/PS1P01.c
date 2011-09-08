//Name: 	Laurence Putra Franslay
//Matric:	U096833E
//Email:	laurenceputra@gmail.com

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int eax, ebx, ecx, edx, esi, edi;
unsigned char M[10000];

void exec();

int main(){
	//initialisation
	int i;	//counter for for loop
	srand(time(NULL));
	//input string
	char *str = "123456789";
	//to force the first address location to be small enough in case rand()%10000 returns 9999
	int curr = rand() % 2000;
	esi = curr;
	for(i = 0; str[i-1] != '\0' || i == 0; i++){
		M[curr] = str[i];
		curr++;
	}
	exec();
	printf("%d\n", eax);
	return eax;
}

void exec(){
	eax = 0;
	edi = esi;
loop:
	ebx = M[edi];
	ebx -= 48;
	eax *= 10;
	eax += ebx;
	edi += 1;
	if('\0' == M[edi]) goto endloop;
	goto loop;
endloop:{}
}
