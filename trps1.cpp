#include <stdio.h>
#include <math.h>
#include <string>
#include <conio.h>
#include <iostream>

using namespace std;


struct Tm{
	unsigned short int day;
	unsigned short int month;
	unsigned short int year;
};


struct Man{
	unsigned short int kod;
	string FIO;
	Tm b_day;
};


int dih_search(unsigned short int *m, const  unsigned short int n, const unsigned short int val) {

	unsigned short int low = 0;
	unsigned short int high = 0;
	unsigned short int mid = 0;

	high = n-1;

	while (low < high) {

	  mid = low + (high - low) / 2;
	  if (val <= m[mid])
		high = mid;
	  else
		low = mid + 1;

	  if (m[high] == val)
		return high;
	}

	return -1;
}



void Sort(int* arr,int n){
	for(int i=1;i<n;i++){
		for(int j=i; j>0 && arr[j-1]>arr[j];j--){
			int tmp=arr[j-1];
			arr[j-1]=arr[j];
			arr[j]=tmp;
		}
	}
}




 int main()
{
   const unsigned short int M = 8;

   unsigned short int mas[M] = {1,2,3,4,5,6,7,8};

   string test = "jdfjd";
	Man e;
	Man str[M];
	unsigned short int i = 0;

	for (i = 0; i < M; i++){

	   str[i].kod = i;
	   str[i].FIO = "Oleg Oleg Oleg";
	   str[i].b_day.day = 1 + rand()%31;
	   str[i].b_day.month = 1 + rand()%12;
	   str[i].b_day.year = -3000 + rand()%3000;

	}


	dih_search(mas,M,3);


	cout<<sizeof(mas)<<"\n";
	cout<<dih_search(mas,M,3)<<"\n";

	getch();

	return 0;
}
