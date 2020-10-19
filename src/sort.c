#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

void bubble_sort(int* mass, int* mass_without_sorting, int demension, int counter)
{
int tmp;
bool noSwap;
for (int i = demension - 1; i >= 0; i--)
{
    noSwap = 1;
    for (int j = 0; j < i; j++)
    {
        if (mass[j] > mass[j + 1])
        {
            tmp = mass[j];
            mass[j] = mass[j + 1];
            mass[j + 1] = tmp;
            noSwap = 0;
        }
    }
    if (noSwap == 1)
        break;
}
for(int i = 0; i < demension; i++)
    if(mass[i] != mass_without_sorting[i])
    counter++;
printf("\tSorted: ");
for(int i = 0; i < demension; i++)
printf("%d ", mass[i]);
  printf("\n");
printf("Number of elements, involved in sorting  and changing position: %d", counter);
}
