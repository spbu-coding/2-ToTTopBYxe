#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern void bubble_sort(void);

// Получаем параметр To
int getTo(char* string, int previous_result){
    int result = previous_result;

    if (strstr(string, "--to=") != NULL) {
        if (previous_result != -1) result = -2; // Параметр встретился второй раз
        else result = atoi(string+5); // распознаем цифры при смещении указателя на 5 (длина "--to=")
    }

    return result;
}

// Получаем параметр From
int getFrom(char* string, int previous_result){
    int result = previous_result;

    if (strstr(string, "--from=") != NULL) {
        if (previous_result != -1) result = -2; // Параметр встретился второй раз
        else result = atoi(string+7); // распознаем цифры при смещении указателся на 7 (длина "--from=")
    }

    return result;
}

int main(int argc, char** argv)
{
    int main_array[100]; // 100 элементов
    int from = -1; // -1 - переменная не определена
    int to = -1;
    int main_result = 0; // количество элементов, участвовавших в сортировке и изменивших свою позицию
    int wrong_nums_size=0, cleared_mass_size=0;//размер массиива с неподходящими числами и размер очищенного массива
    int* cleared_mass[100], cleared_mass_wihout_sorting[100], wrong_nums[100]; //очищенный от невходящих в границы чисел массив и массив с неподходящими числами невошедшими в сортировку
    int array_size=0;
    int j=0, k=0; //счетчики для записи в цикле элементов  в массивы cleared_mass и wrong_nums

    if (argc < 2) return -1; // введено менее 1 параметра
    if (argc > 3) {return -2; exit(-2);} // введено более 2-х параметров


    for (int i = 0; i < argc; ++i) {
        to = getTo(argv[i], to);
        from = getFrom(argv[i], from);
    }

    if ((from == -2) || (to == -2)) return -3; // один из параметров введен более 1 раза
    if (((from == -1) && (to == -1)) || (from > to)) return -4; // введены 2 неправильных параметра

    printf("Enter array's elements. 0 ends entering of elements: \n");
    for (int i = 0; i < 100; ++i) {
        scanf("%d", &main_array[i]);
        if (main_array[i] == 0) break; // 0 - заканчивает считывание чисел
        array_size++;
    }

    for(int i = 0; i < array_size; i ++)
        if(from!=-1 && from!=-2)
        {
            if(to!=-1 && to!=-2)
            {
             if(main_array[i] <= from || main_array[i] >= to)
             {
              wrong_nums_size++;
              wrong_nums[j] = main_array[i];
              j++;
             }
             else
             {
              cleared_mass_size++;
              cleared_mass[k] = &main_array[i];
              cleared_mass_wihout_sorting[k] = main_array[i];
              k++;
             }
            }
            else
            {
             if(main_array[i] <= from)
             {
              wrong_nums_size++;
              wrong_nums[j] = main_array[i];
              j++;
             }
             else
             {
              cleared_mass_size++;
              cleared_mass[k] = &main_array[i];
              cleared_mass_wihout_sorting[k] = main_array[i];
              k++;
             }
            }
        }
        else {
            if(to!=-1 && to!=-2)
            {
              if(main_array[i] >= to)
             {
              wrong_nums_size++;
              wrong_nums[j] = main_array[i];
              j++;
             }
             else
             {
              cleared_mass_size++;
              cleared_mass[k] = &main_array[i];
              cleared_mass_wihout_sorting[k] = main_array[i];
              k++;
             }
            }
            else
            {
              cleared_mass_size++;
              cleared_mass[k] = &main_array[i];
              cleared_mass_wihout_sorting[k] = main_array[i];
              k++;
            }
            }

    printf("Params: ");
    for(int i = 1; i < argc; i++)
    {
        printf("%s ", argv[i]);
    }
    printf("\tInput: ");
    for(int i = 0; i < array_size; i++)
    {
        printf("%d ", main_array[i]);
    }
    printf("\nStdout: ");
    if(from >= 0)

    for(int i = 0; i < wrong_nums_size; i++)
    {
        if(wrong_nums[i] < from)
            printf("%d ", wrong_nums[i]);
    }
    printf("\tStderr: ");
    if(to >= 0)
    for(int i = 0; i < wrong_nums_size; i++)
    {
        if(wrong_nums[i] > to)
            printf("%d ", wrong_nums[i]);
    }

    printf("\tReduced: ");
    for(int i = 0; i < cleared_mass_size; i++)
    {
     printf("%d ", cleared_mass[i]);
    }

    // Sort Function in assembler
    bubble_sort(cleared_mass, cleared_mass_wihout_sorting, cleared_mass_size, main_result);
    return main_result;
}
