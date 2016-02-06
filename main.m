//
//  main.m
//  Block
//
//  Created by hairong chen on 15/12/9.
//  Copyright © 2015年 hairong chen. All rights reserved.
//

#import <Foundation/Foundation.h>
//typedef void (^blk1) ();

#define SUB(x,y) x-y
#define ACCESS_BEFORE(element,offset,value) *SUB(&element,offset) = value

char *GetMemery(char *p,int num)
{
    p = (char*)malloc(sizeof(char)* num);
    return p;
}

typedef long long llong;
bool hash[10];//标记是否使用过...
void dfs(int dep,llong val)
{
    int i;
    llong tmp;
    if(dep==9)//9位了
    {
        printf("val = %lld \n",val);
        return;
    }
    for(i=1;i<=9;++i)
    {
        if(!hash[i])
        {
            hash[i] = true;
            tmp     = val*10+i;
            
            if(tmp%(dep+1)==0)
                dfs(dep+1,tmp);
            
            hash[i] = false;
        }
    }
}


//@interface NSObject (Sark)
//+ (void)foo;
//@end
//
//@implementation NSObject (Sark)
//
//- (void)foo
//{
//    NSLog(@"IMP: -[NSObject(Sark) foo]");
//}
//
//@end

//realloc调整数组长度（增加）
char *getLine(void)
{
    const size_t sizeIncrement = 10;
    char *buffer = malloc(sizeIncrement);
    char *currentPosition = buffer;
    size_t maximumLength = sizeIncrement;
    size_t lenght = 0;
    int character;
    
    if (currentPosition == NULL) {return NULL;}
    
    while (1) {
        character = fgetc(stdin);
        if (character == '\n') {
            break;
        }
        if (++lenght >= maximumLength) {
            char *newBuffer = realloc(buffer, maximumLength +=sizeIncrement);
            
            if (newBuffer == NULL) {
                free(buffer);
                return NULL;
            }
            currentPosition = newBuffer +(currentPosition -buffer);
            buffer = newBuffer;
        }
        *currentPosition ++ = character;
    }
    *currentPosition = '\0';
    return buffer;
}

//realloc调整数组长度（减少）
char *trim(char *phrase)
{
    char *old = phrase;
    char *new = phrase;
    
    while (*old == ' ') {//跳过开头空白符:”   helloworld"
        old ++;
    }
    
    while (*old) {
        *(new++) = *(old++);
    }
    *new = '\0';
    return (char *)realloc(phrase, strlen(new)+1);
}

//display2DArray(matrix,2);
void display2DArray(int arr[][5],int rows)
{
    for (int i = 0; i <rows; i ++) {
        for (int j = 0; j<5; j++) {
            printf("%d",arr[i][j]);
        }
        printf("\n");
    }
}


//display2DArrayUnknownSize(&matrix[0][0],2,5);
void display2DArrayUnknowSize(int *arr,int rows,int cols)
{
    for (int i = 0; i <rows; i ++) {
        for (int j = 0; j<cols; j++) {
            printf("%d",*(arr+ (i*cols)+j));
            //printf("%d",(arr+i)[j]);
        }
        printf("\n");
    }
}


//分配连续内存

void mallocContinuity(){
    int rows =2;
    int columns = 5;
    int **matrix = (int **)malloc(rows *sizeof(int*));
    matrix[0] = (int *)malloc(rows *columns *sizeof(int));
    
    for (int i =1; i <rows; i ++) {
        matrix[i] = matrix[0] +i *columns ;
    }
    //  *(matrix +(i * columns)+j)= i*j;
}

//分配不连续内存
void mallocDiscontinuity(){
    int rows =2;
    int columns = 5;
    int **matrix = (int **)malloc(rows *sizeof(int*));
    
    for (int i =1; i <rows; i ++) {
        matrix[0] = (int *)malloc(columns *sizeof(int));
    }
}

//不规则数组
int (*(arr1[]))= {
    (int[]){0,1,2},
    (int[]){3,5,6},
    (int[]){4,8,9},
    //   printf("%d",arr1[i][j]);
};

int (*(arr2[]))= {
    (int[]){0,1,2,6},
    (int[]){3,5},
    (int[]){4,8,9}
};

//int rows = 0;
//for(int i =0,i<4;i++){printf(arr2[row][i]);}

//int rows = 1;
//for(int i =0,i<2;i++){printf(arr2[row][i]);}

//int rows = 2;
//for(int i =0,i<3;i++){printf(arr2[row][i]);}



int count =0;
int foo(int i){
    count ++;
    if(i==0)
    {
        return 0;
    }
    if(i ==1)
    {
        return 1;
    }
    
    return  foo(i-1)+foo(i-2);
}
#define RE(b) (!(b))
#define SUM(a,b) (a)+(b)

typedef int (fptrOperation)(const char *,const char *);

int compare(const char *s1, const char *s2){
    return strcmp(s1,s2);
}

void displayNames(char *names[],int size){
    for (int i= 0; i<size; i ++) {
        printf("%s ",names[i]);
    }
    printf("\n");
}

void sort(char *array[],int size, fptrOperation operation)
{
    int swap = 1;
    while (swap) {
        swap = 0;
        for (int i = 0; i<size -1; i ++) {
            if(operation(array[i],array[i+1])>0){
                swap  = 1;
                char *tmp = array[i];
                array[i] = array[i+1];
                array[i +1] = tmp;
            }
        }
    }
}

#pragma mark - struct
//////////////////////////////////////////////////
//struct
//////////////////////////////////////////////////

typedef struct _person{
    char *firstName;
    char *lastName;
    char *title;
    uint age;
}Person;

void initializePerson(Person *person,const char *fn,
                      const char *ln,const char *title,
                      uint age )  {
    person ->firstName = (char *)malloc(strlen(fn)+1);
    strcpy(person->firstName, fn);
    
    person ->lastName = (char *)malloc(strlen(ln)+1);
    strcpy(person->lastName, ln);
    
    person ->title = (char *)malloc(strlen(title)+1);
    strcpy(person->title, ln);
    
    person->age = age;
}

void deallocatePerson(Person *person){
    free(person->firstName);
    free(person->lastName);
    free(person->title);
}

void processPerson(){
    //    Person person;
    //    initializePerson(&person, "person", "Underwood", "Manage", 26);
    //
    //    deallocatePerson(&person);
    
    Person *ptrPerson;
    ptrPerson = (Person*)malloc(sizeof(Person));
    initializePerson(ptrPerson, "person", "Underwood", "Manage", 26);
    //...
    deallocatePerson(ptrPerson);
    free(ptrPerson);
}
#define LIST_SIZE 5
Person *list[LIST_SIZE];
void initializeList(){
    for (int i =0; i<LIST_SIZE;i++ ) {
        list[i]= NULL;
    }
}

/*
 list[i]   ptr
 |
 ↓
 Person
 
 
 list[i]   ptr
 |       |
 ↓       ↓
 NULL   Person
 */

Person *getPerson(){
    for (int i =0; i<LIST_SIZE; i++) {
        if (list[i]!=NULL) {
            Person *ptr = list[i];//ptr,与list是两个不同的指针，都指向Person
            list[i]= NULL;
            return ptr;
            
        }
    }
    Person *person = (Person *)malloc(sizeof(Person));
    return person;
}

Person *returnPerson(Person *person){
    for (int i = 0; i< LIST_SIZE; i++) {
        if (list[i]==NULL) {
            list[i]= person;
            return person;
        }
    }
    deallocatePerson(person);
    free(person);
    return NULL;
}

#pragma mark - LinkList
//////////////////////////////////////////////////
//LinkList
//////////////////////////////////////////////////
typedef void (*DISPLAY)(void*);
typedef int (*COMPARE)(void*,void*);

typedef struct _employee{
    char name[32];
    unsigned char age;
}Employee;

/*
 Node结构体定义一个节点，有两个指针，第一个是void指针，持有任意类型的数据，
 第二个是指向下一个结点指针
 */
typedef struct _node{
    void *data;
    struct _node *next;
}Node ;

/*
 LinkedList结构体表示链表, 持有指向头节点和尾节点的指针，当前指针用来辅助遍历链表
 */
typedef struct _linkedList{
    Node *head;
    Node *tail;
    Node *current;
}LinkedList;


void initializeLinkList(LinkedList *);//初始化
void addHead(LinkedList*,void *);   //增加头节点数据
void addTail(LinkedList *,void *);  //增加尾节点数据
void delete(LinkedList *,Node*);    //删除结点
Node *getNode(LinkedList *,COMPARE,void*);//返回指定节点的指针
void displayLinkedList(LinkedList *,DISPLAY);//打印链表


void initializeLinkList(LinkedList *list){
    list->head = NULL;
    list->tail = NULL;
    list->current = NULL;
    
}
/*
 1.查链表是否为空，如果空，把尾指针指向节点，然后把节点next字段赋值为NULL
 2.如果不空，将节点的next指向链表头
 3.无论哪种情况，链表头都指向节点
 */
void addHead(LinkedList *list,void *data){
    Node *node = (Node *)malloc(sizeof(Node));
    node->data = data;
    if (list->head == NULL) {
        list->tail = node;
        node->next = NULL;
    }else{
        node->next = list->head;
    }
    list->head = node;
}

/*
 1.因总是将节点添加到末尾，即该节点的next字段被赋值NULL
 2.如果链表空，head指针就是NULL,把新节点赋给head
 2.如果不空，尾节点的next指针赋为新节点
 3.无论哪种情况，链表tail指针都赋为该节点
 */
void addTail(LinkedList *list,void *data){
    Node *node = (Node *)malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;
    if (list->head == NULL) {
        list->head = node;
    }else{
        list->tail->next = node;
    }
    list->tail = node;
}

/*
 为了保持函数简单，不检查链表内的空值和传入的节点
 1.第一个if处理删除头节点，如果头节点是唯一节点，那么将头节点和尾节点置为NULL,否则，
 头节点赋为原头节点的下一节点
 2.tmp指针从头到尾遍历链表，不论是将tmp赋值为NULL，还是tmp的下一节点就是要找的节点。
 3.tmp为空，表示要找的节点不在链表中
 4.函数末尾，将节点释放
 */
void delete(LinkedList *list,Node*node){
    if (node==list->head) {
        if (list->head->next == NULL) {
            list->head=list->tail=NULL;
        }else{
            list->head=list->head->next;
        }
    }else{
        Node *tmp = list->head;
        while (tmp!=NULL && tmp->next !=node) {
            tmp = tmp->next;
        }
        if (tmp!=NULL) {
            tmp->next = node->next;
        }
    }
    free(node);
}

int compareEmployee(Employee *e1,Employee *e2){
    return strcmp(e1->name, e2->name);
}

void displayEmployee(Employee *employee){
    printf("%s\t %d\n",employee->name,employee->age);
}


Node *getNode(LinkedList *list,COMPARE compare,void *data){
    Node *node = list->head;
    while (node!=NULL) {
        if (compare(node->data,data)==0) {
            return node;
        }
        node=node->next;
    }
    return NULL;
}

void displayLinkedList(LinkedList *list,DISPLAY display){
    printf("\nLinked List\n");
    Node *current = list->head;
    while (current!=NULL) {
        display(current->data);
        current=current->next;
    }
}
#pragma mark - Queue
//////////////////////////////////////////////////
//Queue
//////////////////////////////////////////////////
typedef LinkedList Queue;
void initializeQueue(Queue *queue){
    initializeLinkList(queue);
}

void enqueue(Queue *queue,void *data){
    addHead(queue, data);
}

/*
 之前的链表没有删除尾节点的函数，deueue函数删除最后一个节点
 需要处理以下三种情况：
 1.空队列:返回空
 2.单节点队列:由else if语句处理
 3.多节点队列:由else if分支外理
 最后一种情况，用tmp指针来一个节点一个节点前进，直到到指向尾节点的前一个节点，
 然后按顺序执行下面三种操作：
 1>将尾节点赋值为tmp
 2>将tmp指针前进一个节点
 3>将尾节点的next字段置为NULL,表示后面没有节点了
 */

void *dequeue(Queue *queue){
    Node *tmp = queue->head;
    void *data;
    if (queue->head == NULL) {
        data = NULL;
    }else if(queue->head == queue->tail){
        queue->head = queue->tail = NULL;
        data = tmp->data;
        free(tmp);
    }else{
        while (tmp->next != queue->tail) {
            tmp =tmp->next;
        }
        queue->tail = tmp;
        tmp = tmp->next;
        queue->tail->next = NULL;
        data=tmp->data;
        free(tmp);
    }
    return data;
}

#pragma mark - Stack
//////////////////////////////////////////////////
//Stack
//////////////////////////////////////////////////
typedef LinkedList Stack;
void initializeStack(Stack *stack){
    initializeLinkList(stack);
}

void push(Stack *stack,void*data){
    addHead(stack, data);
}
/*
 出栈操作：先把栈的头节点赋给一个节点指针，涉及三种情况
 1.栈为空:函数返回NULL
 2.栈中有一个元素:如果节点指向尾节点，那么头节点和尾节点是同一个元素。将头节点和尾节点置为NULL,然后返回数据
 3.栈中有多个元素:将头节点赋值为链表中的下一个元素，然后返回数据
 4.在后两种情况下，节点会被释放
 */
void *pop(Stack *stack){
    Node *node = stack ->head;
    if (node == NULL) {
        return NULL;
    }else if (node == stack->tail){
        stack ->head = stack ->tail = NULL;
        void *data = node ->data;
        free(node);
        return data;
    }else{
        stack->head = stack->head->next;
        void *data = node->data;
        free(node);
        return data;
    }
}
#pragma mark - Binary Tree
//////////////////////////////////////////////////
//Binary Tree
//////////////////////////////////////////////////
/*
 指针提供一种维护三个节点之间的关系的直观、动态的方式。可以动态分配节点，将其按需插入树中。
 这里使用下面的结构体作为节点，借助void指针可以处理需要的任意类型的数据
 */
typedef struct _tree{
    void *data;
    struct _tree *left;
    struct _tree *right;
}TreeNode;

/*
 二叉查找树(插入新节点后，这个节点的所有左子节点的值都比父节点小，所有右子节点的值都比父节点的值大)
 0.insertNode函数会把一个节点插入二叉查找树，函数第一部分为新节点分配内存并把数据赋给节点，
 新节点插入树后总是叶子节点，所以将左子节点和右子节点置为NULL。
 1.根节点是以TreeNode指针的指针和形式传递的，因为需要修改传入的函数的指针，而不是指针指向的对象。
 如果树非空，进入一个无限循环，直到将新节点插入树中结束
 2.每次循环迭代都会比较新节点和当前节点，根据比较结果，将局部root指针置为左子节点或右子节点，这个
 root指针总是指向当前节点
 3.如果左子节点或右子节点为空，那么就将新节点添加为当前节点的子节点，循环结束
 
 */
void insertNode(TreeNode **root,COMPARE compare,void *data){
    TreeNode *node = (TreeNode *)malloc(sizeof(TreeNode));
    node->data = data;
    node->left = NULL;
    node->right= NULL;
    
    if (*root==NULL) {
        *root = node ;
        return;
    }
    
    while (1) {
        if (compare((*root)->data,data)>0) {
            if ((*root)->left !=NULL) {
                *root = (*root)->left;
            }else{
                (*root)->left = node;
                break;
            }
        }else{
            if ((*root)->right !=NULL) {
                *root = (*root)->right;
            }else{
                (*root)->right = node;
                break;
            }
        }
    }
}
/*
 前序：节点，往左，再往右
 中序：往左，节点，再往右
 后序：往左，往右，再节点
 所有函数的参数都是树根和作为打印函数的一个函数指针，它们都是递归的，只要传入的根节点非空就会调用自身
 不同点只在于执行三步操作的顺序
 */
void preOrder(TreeNode *root,DISPLAY display){
    if (root !=NULL) {
        display(root->data);
        preOrder(root->left,display);
        preOrder(root->right, display);
    }
}

void inOrder(TreeNode *root,DISPLAY display){
    if (root !=NULL) {
        inOrder(root->left,display);
        display(root->data);
        inOrder(root->right, display);
    }
}

void postOrder(TreeNode *root,DISPLAY display){
    if (root !=NULL) {
        postOrder(root->left,display);
        postOrder(root->right, display);
        display(root->data);
    }
}



//1.4.1
int main(int argc, const char * argv[]) {
    
    
    Employee *samuel = (Employee *)malloc(sizeof(Employee));
    strcpy(samuel->name, "samuel");
    samuel->age = 32;
    
    
    Employee *sally = (Employee *)malloc(sizeof(Employee));
    strcpy(sally->name, "sally");
    sally->age = 28;
    
    Employee *susan = (Employee *)malloc(sizeof(Employee));
    strcpy(susan->name, "susan");
    susan->age = 56;
    
    //Binary tree
    TreeNode *tree = NULL;
    insertNode(&tree, (COMPARE )compareEmployee, samuel);
    insertNode(&tree, (COMPARE )compareEmployee, sally);
    insertNode(&tree, (COMPARE )compareEmployee, susan);
    
    preOrder(tree,(DISPLAY)displayEmployee);
    inOrder(tree,(DISPLAY)displayEmployee);
    postOrder(tree,(DISPLAY)displayEmployee);
    return 0;
    
    //Stakc
    Stack stack;
    initializeLinkList(&stack);
    push(&stack, samuel);
    push(&stack, sally);
    push(&stack, susan);
    
    Employee *employee;
    for (int i =0; i<4; i++) {
        employee = (Employee *)pop(&stack);
        printf("popped %s\n",employee->name);
    }
    
    return 0;
    //Queue
    Queue queue;
    initializeLinkList(&queue);
    enqueue(&queue, samuel);
    enqueue(&queue, sally);
    enqueue(&queue, susan);
    
    void *data = dequeue(&queue);
    printf("Dequeued %s\n",((Employee *)data)->name);
    
    data = dequeue(&queue);
    printf("Dequeued %s\n",((Employee *)data)->name);
    
    data = dequeue(&queue);
    printf("Dequeued %s\n",((Employee *)data)->name);
    return 0;
    
    //LinkList
    LinkedList linkedList;
    initializeLinkList(&linkedList);
    addHead(&linkedList, samuel);
    addHead(&linkedList, sally);
    addHead(&linkedList, susan);
    
    displayLinkedList(&linkedList, (DISPLAY)displayEmployee);
    
    Node *node = getNode(&linkedList, (int(*)(void*,void*))compareEmployee, susan);
    delete(&linkedList, node);
    displayLinkedList(&linkedList, (DISPLAY)displayEmployee);
    
    return 0;
    
    //struct
    initializeList();
    Person *ptrPerson;
    ptrPerson = getPerson();
    initializePerson(ptrPerson, "Ralph", "Fitsgerald",  "Mr", 35);
    returnPerson(ptrPerson);
    
    ptrPerson = getPerson();
    initializePerson(ptrPerson, "Salph", "gitsgerald",  "Mr", 45);
    returnPerson(ptrPerson);
    
    ptrPerson = getPerson();
    initializePerson(ptrPerson, "Talph", "hitsgerald",  "Mr", 55);
    returnPerson(ptrPerson);
    
    return 0;
    
    char *names[] = {"Bob","Ted","Carol","Alice"};
    sort(names, 4, compare);
    
    displayNames(names, 4);
    char *buffer = (char *)malloc(strlen("  cat")+1);
    strcpy(buffer, " cat");
    printf("%s\n",trim(buffer));
    for (int i = 0; i <argc; i++) {
        printf("argv[%d]=%s\n",i,argv[i]);
    }
    
    return 0;
    
    //        NSLog(@"111111");
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            NSLog(@"222222");
    //        });
    //        NSLog(@"33333");
    
    //        NSLog(@"A");
    //        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //
    //            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0*NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
    //                NSLog(@"B") ;
    //            });
    //            NSLog(@"C") ;
    //        });
    //        NSLog(@"D") ;
    
    //       NSLog(@"%d",RE(@"oo"));
    //       NSLog(@"%d", SUM(2+5, 3*4));
    //        foo(4);
    //        [NSObject foo];
    //        [[NSObject new] foo];
    return 0;
    //        dfs(0,0);
    //        return 0;
    //
    //        char *str0 = NULL;
    //       char *p= GetMemery(&str0,5);
    //        strcpy(p, "hello");
    //        printf("%s",p);
    //        return 0;
    
    char *ss1       = "0123456789";
    char ss2[]      = "0123456789";
    char ss3[100]   = "0123456789";
    char ss4[100] ;
    
    char q1[]       = "abc";
    char q2[]       = "a\n";
    char *q3        = "a\n";
    char *str1      = (char *)malloc(100);
    void *str2      = (char *)malloc(100);
    
    int a22 = 8;
    printf("a22= %lu\n",sizeof(a22));
    printf("a23= %lu\n",sizeof(a22= 9));
    printf("a23= %lu\n",a22);
    
    printf("ss1= %lu\n",sizeof(ss1));
    printf("ss2= %lu\n",sizeof(ss2));
    printf("ss3= %lu\n",sizeof(ss3));
    printf("ss4= %lu\n",sizeof(ss4));
    
    printf("q1= %lu\n",sizeof(q1));
    printf("q2= %lu\n",sizeof(q2));
    printf("q3= %lu\n",sizeof(q3));
    printf("st1= %lu\n",sizeof(str1));
    printf("st2= %lu\n",sizeof(str2));
    
    return 0;
    
    
    printf("%d",(5&10) +((5^10)>>1));
    return 0;
    unsigned char a = 0xA5;
    unsigned char b = ~a>> 4+1;
    
    printf("b= %d\n",b);
    return 0;
    
    void (^blk)() = ^{
        NSLog(@"%@",@"Blocks\n");
    };
    
    blk();
    
    int square(int n) __attribute__((const));
    return 0;
}
