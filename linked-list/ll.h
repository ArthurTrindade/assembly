typedef struct node_t {
  int data;
  struct node_t *next;
} node_t;

typedef struct list_t {
  node_t *head;
} list_t;

list_t *list_new();
void list_insert(list_t *l, int data);
void list_print(list_t *l);
void list_free(list_t *l);