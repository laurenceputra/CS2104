//Name: 	Laurence Putra Franslay
//Matric:	U096833E
//Email:	laurenceputra@gmail.com

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Var{
	char *var_name;
	int value;
	struct Var *next;
} Var;

Var *variables = NULL;

Var* getVar(char* str);
void printValues();
char* getVarName(char *str);
char* getOp(char *str, int varLen);
char* getRValue(char *str, int varLen, int opLen);
void processString(char *str);
void interpret();
int isnumeric(char *str);
char* myStrTok(char *str, char delim);

int main(){
	char *chunk, *delim = ";";
	//can be replaced with scanf for input.
	char *tmp = "x+=3;y+=5;x*=y;";
	char *str = strdup(tmp);
	chunk = strtok(str, delim);
	while(chunk){
		processString(chunk);
		chunk = strtok(NULL, delim);
	}

	printValues();
	return 0;
}
//get the variable from the linkedlist
//if not inside, create a new one
Var* getVar(char* str){
	Var* tmp = variables;

	while(tmp){
		if(strcmp(tmp->var_name, str) == 0){
			return tmp;
		}
		tmp = tmp->next;
	}
	tmp = malloc(sizeof(Var));
	tmp->var_name = str;
	tmp->value = 0;
	tmp->next = variables;
	variables = tmp;
	return tmp;
}

//print all values in the list
void printValues(){
    Var *tmp = variables;
    while(tmp){
            printf("%s = %d ", tmp->var_name, tmp->value);
            tmp = tmp->next;
    }
}

//parse and returns the var name
char* getVarName(char *str){
	int i, found = 0;
	char *tmp = malloc(strlen(str));
	for(i = 0; i < strlen(str) && 0 == found; i++){
		if(str[i] == '+' || str[i] == '-' || str[i] == '/' || str[i] == '*' || str[i] == '='){
			found = 1;
		}
	}
	tmp = strncpy(tmp, str, i - 1);
	return tmp;
}

//parse and returns the operation
char* getOp(char *str, int varLen){
	char *tmp = malloc(strlen(str));
	strncpy(tmp, str + varLen, 2);
	return tmp;
}

//parse and returns the RValue
char* getRValue(char *str, int varLen, int opLen){

	char *tmp = malloc(strlen(str));
	tmp = strncpy(tmp, str + varLen + opLen, strlen(str) - varLen - opLen + 1);
	return tmp;
}
//processes a statement 
void processString(char *str){
	Var *tmp = variables, *var1, *var2;
	int varLen, opLen, isNumeric, var3;
	char *lValue, *op, *rValue;

	lValue = getVarName(str);
	varLen = strlen(lValue);

	op = getOp(str, varLen);
	opLen = strlen(op);

	rValue = getRValue(str, varLen, opLen);
	var1 = getVar(lValue);
	isNumeric = isnumeric(rValue);
	if(1 == isNumeric){
		var3 = atoi(rValue);
	}
	else{
		var2 = getVar(rValue);
		var3 = var2->value;
	}

	switch(op[0]){
		case '+':
			var1->value+=var3;
			break;
		case '-':
			var1->value-=var3;
			break;
		case '*':
			var1->value*=var3;
			break;
		case '/':
			var1->value/=var3;
			break;
	}
} 

//checks if a string is numeric
int isnumeric(char *str){
	while(*str){
		if(!isdigit(*str))
 		return 0;
    	str++;
  	}
  	return 1;
}
