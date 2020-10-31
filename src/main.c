#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern void bubble_sort(void);

// �������� �������� To
int getTo(char* string, int previous_result){
    int result = previous_result;

    if (strstr(string, "--to=") != NULL) {
        if (previous_result != -1) result = -2; // �������� ���������� ������ ���
        else result = atoi(string+5); // ���������� ����� ��� �������� ��������� �� 5 (����� "--to=")
    }

    return result;
}

// �������� �������� From
int getFrom(char* string, int previous_result){
    int result = previous_result;

    if (strstr(string, "--from=") != NULL) {
        if (previous_result != -1) result = -2; // �������� ���������� ������ ���
        else result = atoi(string+7); // ���������� ����� ��� �������� ���������� �� 7 (����� "--from=")
    }

    return result;
}

int main(int argc, char** argv)
{
    int main_array[100]; // 100 ���������
    int from = -1; // -1 - ���������� �� ����������
    int to = -1;
    int main_result = 0; // ���������� ���������, ������������� � ���������� � ���������� ���� �������
    int wrong_nums_size=0, cleared_mass_size=0;//������ �������� � ������������� ������� � ������ ���������� �������
    int* cleared_mass[100], cleared_mass_wihout_sorting[100], wrong_nums[100]; //��������� �� ���������� � ������� ����� ������ � ������ � ������������� ������� ����������� � ����������
    int array_size=0;
    int j=0, k=0; //�������� ��� ������ � ����� ���������  � ������� cleared_mass � wrong_nums

    if (argc < 2) return -1; // ������� ����� 1 ���������
    if (argc > 3) {return -2; exit(-2);} // ������� ����� 2-� ����������


    for (int i = 0; i < argc; ++i) {
        to = getTo(argv[i], to);
        from = getFrom(argv[i], from);
    }

    if ((from == -2) || (to == -2)) return -3; // ���� �� ���������� ������ ����� 1 ����
    if (((from == -1) && (to == -1)) || (from > to)) return -4; // ������� 2 ������������ ���������

    printf("Enter array's elements. 0 ends entering of elements: \n");
    for (int i = 0; i < 100; ++i) {
        scanf("%d", &main_array[i]);
        if (main_array[i] == 0) break; // 0 - ����������� ���������� �����
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
