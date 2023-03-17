#include<stdio.h>
#include<conio.h>
#include<string.h>

// le
int main(){
	char str[1001];
	int i;
	int count = 0;
	printf("Nhap vao chuoi: ");
	gets(str);
	printf("Chuoi vua nhap la: ");
	printf("\n%s", str);
	// chu cai theo dong 
	printf("\nChuoi voi ki tu theo dong: ");
	for(i = 0; str[i] != '\0'; i++){
		printf("\n%c", str[i]);
	}
	// so luong 'k' trong chuoi
	for(i = 0; str[i] != '\0'; i++){
		if(str[i] == 'k'){
			count++;
		}
	}
	printf("\nSo luong ki tu 'k' trong chuoi la: %d", count);
	getch();
	return 0;
}
