#include<stdio.h>
#include<conio.h>

int main(){
	
	int d, r, i, j;
	
	do{
		printf("Nhap vao chieu dai va chieu rong: ");
		scanf("%d%d", &d, &r);
	}while(d <= 0 || r <= 0 || d < r); 
	// in hinh chu nhat
	for(i = 0; i < r; i++){
		for(j = 0; j < d; j++){
			printf(" * ");	
		}
		printf("\n");
	}
	
	getch();
	return 0;
}