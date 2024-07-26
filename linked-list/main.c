#include <stdio.h>
#include "ll.h"


int main() {

  list_t *l1 = list_new();

  list_insert(l1, 10);
  list_insert(l1, 20);
  list_insert(l1, 30);
  list_insert(l1, 40);

  list_print(l1);

  list_free(l1);

  return 0;
}