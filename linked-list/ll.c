#include <stdio.h>
#include <stdlib.h>

#include "ll.h"

node_t *node_new(int data) {

  node_t *n = malloc(sizeof(node_t));

  n->data = data;
  n->next = NULL;

  return n;
}

list_t *list_new() {

  list_t *new_list = malloc(sizeof(list_t));

  new_list->head = NULL;

  return new_list;
}

void list_insert(list_t *l, int data) {

  node_t *new_node = node_new(data);

  if (l->head == NULL) {
    l->head = new_node;
    return;
  }

  node_t *aux = l->head;
  while (aux->next != NULL) {
    aux = aux->next;
  }

  aux->next = new_node;
}

void list_print(list_t *l) {
  node_t *n = l->head;

  while (n != NULL) {
    printf("%d -> ", n->data);
    n = n->next;
  }
}

