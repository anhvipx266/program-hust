#include<stdio.h>
#include<conio.h>

int main(){
	
	int a;
	printf("Nhap vao so nguyen duong: ");
	scanf("%d",&a);
	
		printf("So %d chan",a);
	else
		printf("So %d le",a);
		
	
	// kiem tra chi het 3 va 5
	if (a%3==0 && a%5==0)
		printf("\nSo %d chi het cho 3 va 5",a);

	
	getch();
	return 0;
}
