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
    std::cout << "Данная программа предназначена для угадывания числа от 0 до 123. \n Задаются вопросы: остается ли остаток после деления задуманного числа на 2? Остается ли остаток после деления полученного частного на 2? И так далее. Для ответа на эти вопросы пользователю необходимо ввести y(yes/да) или n(no/нет) Для решения поставленной задачи использовать алгоритм перевода десятичных чисел в двоичные путем деления на 2\n\n\n";
    bool ifend = false;
    while (!ifend) {
        int i = 0;
        char answer;
        int number[7] = {0,0,0,0,0,0,0};
        int result = 0;
        while (answer != 'y') {
            std::cout << "есть ли остаток от деления на 2?(y/n) \n";
            std::cin >> answer;
            std::cout << std::endl;
            if (answer == 'y')
                number[i] = 1;
            else
                number[i] = 0;
            i++;
            
            std::cout << "Равно ли частное 1?(y/n) \n";
            std::cin >> answer;
            std::cout << std::endl;
        }
        number[i] = 1;
        std::reverse(std::begin(number), std::end(number));
        
        
        for (i = 0; i < 7; i++){
            result += number[i] * pow(2.0,i);
        }
        
        std::cout << "Результат: " << result << "\n\n\nУгадать число еще раз?(y/n) \n";
        std::cin >> answer;
        if (answer == 'n') {
            ifend = true;
        }
    }
    
    getch();
    return 0;
}
