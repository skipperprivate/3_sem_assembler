#include "stdafx.h"
#include "cstring"
#include <conio.h>
#include <cstdio>
#include <iostream>

using namespace std;

extern "C" void __cdecl GLASDEL(char *str, int *num, int len);
extern "C" void __cdecl RESULT(char *s) //Печать итоговой строчки
{
	cout << "Передача управления в C++\n" << endl;
	cout << "Итоговая строка: " << s << endl;
}



int main()
{
	setlocale(LC_CTYPE, "Rus");

	int slov = 1, k = 0;  // slov = количество слов в строке, k = число введеных на удаление гласных слов
	char str[255];        // строка
	int help = 0;         // вспомогательная переменная
	bool check = true;    // флаг правильности ввода номера слова на удаление гласных

	cout << "Введите строку\n";
	cin.get(str, 255);

	cout << "Ваша строка\n";
	cout << str << '\n';
	cout << "Длина строки: " << strlen(str) << '\n';


	// Считаем количество слов
	for (int i = 0; i < strlen(str); i++)
	{
		if (str[i] == ' ') slov++;
	}

	// Массив для хранения слов, в которых нужно удалить все гласные
	int *num = new int[slov];
	cout << "слов: " << slov << endl;

	cout << "Введите номера слов в которых хотите удалить гласные буквы\n";
	cout << "Для окончания ввода введите 0\n";

	for (int i = 0, a = 1; a != 0; i++)
	{
		cin >> a;
		check = true;

		for (int j = 0; j < k; j++)       // Проверка на повторное вхождение в массив номеров слов
			if (num[j] == a) check = false;

		if (a != 0 && a <= slov && a > -1 && check != false)
		{
			num[k] = a;
			k++;
		}
	}

	for (int i = 0; i < k - 1; i++)      // Сортировка номеров слов
		for (int j = k - 1; j > i; j--)
			if (num[i] > num[j])
			{
				help = num[i];
				num[i] = num[j];
				num[j] = help;
			}


	/*	for (int i = 0; i < k; i++)
	{
	cout << num[i] << endl;
	}
	*/
	cout << "Передача управления в ассемблер" << endl << endl;
	GLASDEL(str, num, strlen(str));

	cout << endl;
	delete[] num;
	system("pause");
	return 0;
}

