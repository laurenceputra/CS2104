//Name: 	Laurence Putra Franslay
//Matric:	U096833E
//Email:	laurenceputra@gmail.com

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int eax, ebx, ecx, edx, esi, edi;
unsigned char M[10000];

void exec();

//first 1000 bytes act as a MFT basically to check if the memory location is in use
//the remaining 8000 bytes will then be used for linked list, forming 1000 records
//technically can be converted to 1111 records, but 1000 would be easier to read
int main(){
	//initialisation
	int i, next;	//counter for for loop, and next counter
	//values to be put into linkedlist.
	int a[] = {12, 63, 29, 74, 43, 54};
	int finish = 0;
	for(i = 0; i < 10000; i++){
		M[i] = '0';
	}
	srand(time(NULL));
	//to ensure that it will leave at least 8bits for the record
	int curr = rand() % 1000;
	esi = curr * 8 + 1000;
	
	*(int *)&M[esi] = a[0];
	for(i = 0; i < 6; i++){
		M[curr] = '1';
		*(int *)&M[curr * 8 + 1000] = a[i];
		while(0 == finish){
			if(5 == i){
				*(int *)&M[curr * 8 + 1000 + 4] = 0;
				finish = 1;
			}
			else{
				next = rand() % 1000;
				if('1' == M[next]){
					
				}
				else {
					M[next] = '1';
					*(int *)&M[curr * 8 + 1000 + 4] = next * 8 + 1000;
 	                                finish = 1;
					curr = next;
				}
			}
		}
		finish = 0;
	}

	exec();
	printf("%d\n", eax);
	return eax;
}

void exec(){
	eax = 0;
	edi = esi;
loop:
	ebx = *(int *)&M[edi];
	eax += ebx;
	edi = *(int *)&M[edi + 4];
	if(0 == edi) goto endloop;
	goto loop;
endloop:{}
}
