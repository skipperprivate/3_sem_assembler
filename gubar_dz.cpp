//
//  main.cpp
//  dz1
//
//  Created by Виталий Малахов on 30.04.2018.
//  Copyright © 2018 VitalyMalakhov. All rights reserved.
//

#pragma hdrstop
#pragma argsused

#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <stdio.h>

#include <iostream>
#include <math.h>

int _tmain(int argc, _TCHAR* argv[]) {
    std::cout << "Данная программа предназначена для угадывания числа от 0 до 123. \n Задаются вопросы: остается ли остаток после деления задуманного числа на 2? Остается ли остаток после деления полученного частного на 2? И так далее. Для ответа на эти вопросы пользователю необходимо ввести y(yes/да) или n(no/нет) Для решения поставленной задачи использовать алгоритм перевода десятичных чисел в двоичные путем деления на 2\n\n\n";
    bool ifend = false;
    char an1;
    
    while (!ifend) {
        int i = 0;
        char answer,an1;
        int number[7] = {0,0,0,0,0,0,0};
        int result = 0;
        std::cout << "Является ли число меньше 2?(y/n) \n";
        std::cin >> an1;
        
        if (an1 == 'y') {
            answer = 'y';
        }
        else{
            an1 = 'n';
        }
        while (answer != 'y') {
            std::cout << "есть ли остаток от деления на 2?(y/n) \n";
            std::cin >> answer;
            std::cout << std::endl;
            
            if (answer == 'y')
                number[i] = 1;
            else
                number[i] = 0;
            //i++;
            
            std::cout << "Равно ли частное 1?(y/n) \n";
            std::cin >> answer;
            std::cout << std::endl;
            
            //if ((an1 == 'n')&&(answer == 'n')&&(i == 0))
            //  goto exit1;
            
            // if ((an1 == 'y')&&(answer == 'y')&&(i == 0))
            //   goto exit1;
            
            i++;
            
        }
        number[i] = 1;
        if (an1 == 'y') {
            std::cout << "есть ли остаток от деления на 2?(y/n) \n";
            std::cin >> answer;
            if (answer == 'y') {
                result = 1;
            }
            else{
                result = 0;
            }
        }
        else{
            for (i = 0; i < 7; i++){
                result += number[i] * pow(2.0,i);
            }
        }
        // exit1:
        
        
        std::cout << "Результат: " << result << "\n\n\nУгадать число еще раз?(y/n) \n";
        std::cin >> answer;
        if (answer == 'n') {
            ifend = true;
        }
    }
    return 0;
}
