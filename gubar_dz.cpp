#pragma hdrstop
#pragma argsused

#ifdef _WIN32
#include <tchar.h>
#else
  typedef char _TCHAR;
  #define _tmain main
#endif

#include <stdio.h>
#include <conio.h>
#include <iostream>
#include <math.h>

 int _tmain(int argc, _TCHAR* argv[]) {
	int i = 0;
	char answer;
	int number[7] = {0,0,0,0,0,0,0};
	int result = 0;


	for (i = 0; i < 7; i++){
		std::cout << "есть ли остаток от деления на 2?(y/n) \n";
		std::cin >> answer;
		std::cout << std::endl;

		if (answer == 'y')
			number[6-i] = 1;
		else
			number[6-i] = 0;
	}

	for (i = 0; i < 7; i++){
		result += number[i] * pow(2.0,i);
	}

	std::cout << "see the result - " << result << "\n";

	getch();
	return 0;
}
