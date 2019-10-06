//
//  CalculatorModel.m
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

char opset[10] = {'+', '-', '*', '/', '(', ')', '#'};

//用来进行比较运算符优先级的矩阵,3代表'=',2代表'>',1代表'<',0代表不可比
int  cmp[7][7] = {
    { 2, 2, 2, 2, 2, 1, 1 },
    { 2, 2, 2, 2, 2, 1, 1 },
    { 1, 1, 2, 2, 2, 1, 1 },
    { 1, 1, 2, 2, 2, 1, 1 },
    { 2, 2, 2, 2, 3, 1, 0 },
    { 1, 1, 1, 1, 0, 1, 1 },
    { 2, 2, 2, 2, 2, 0, 3 }  };


void InitStack(struct Sqstack *s) {
    s->top = -1;
}

void NumPush(struct Sqstack *s, char ch) {
    
    if(s->top == 99) {//栈满
        return ;
    }
    s->top++;
    s -> data[s -> top] = ch;
    NSLog(@"push numdata == %d", s -> data[s -> top]);
    
    return ;
    
}

void OperPush(struct Sqstack *s, char ch) {
    
    if(s->top == 99) {//栈满
        return ;
    }
    s->top++;
    s -> data[s -> top] = ch;
    NSLog(@"push operdata == %c", s -> data[s -> top]);
    
    return ;
    
}

char GetTop(struct Sqstack *s) {
    
    if(s->top == -1) {
        return 0;
    }
    char ch;
    ch = (char)s->data[s->top];
    return ch;
    
}

int Pop(struct Sqstack *s, char x) {
    
    if(s->top == -1)
        return 0;
    x = (char)s->data[s->top];
    --(s->top);
    return 1;
    
}

int In(char ch, char operArr[10]) {
    
    for(int i = 0; i < 7; i++) {
        if(ch == operArr[i]) {
            return 1;
        }
    }
    return 0;
    
}

char Compare(char oper1, char oper2) {
    int m = 0, n = 0, i, ans;
    for(i = 0; i < 7; i++) {
        if(oper1 == opset[i]) {
            m = i;
        }
        if(oper2 == opset[i]) {
            n = i;
        }
    }
    ans = cmp[m][n];
    switch (ans) {
        case 1:
            return (char)('<');
        case 2:
            return (char)('>');
        case 3:
            return (char)('=');
        default:
            printf("表达式错误!\n");
            break;
    }
    return 'E';
}

int Count(int x1, char op, int x2) {
    int val = 0;
    switch(op) {
        case '+': val = x1 + x2; break;
        case '-': val = x1 - x2; break;
        case '*': val = x1 * x2; break;
        case '/': val = x1 / x2; break;
    }
    return val;
}

- (void)Cal{
    
    char ch, x = '\0', op = '\0', a1 = '\0', a2 = '\0', val;
    int data, i = 0;
    struct Sqstack *Num = (struct Sqstack*) malloc(sizeof(struct Sqstack)); //初始化操作数栈
    InitStack(Num);
    struct Sqstack *Oper = (struct Sqstack*) malloc(sizeof(struct Sqstack)); //初始化运算符栈
    InitStack(Oper);
    OperPush(Oper, '#');//在运算符栈中加入终止符为了进行比较，结束运算
    ch = [_getCal characterAtIndex:i];
    NSLog(@"ch == %c", ch);
    while(ch != '#' || GetTop(Oper) != '#') {
        //opset为运算符集合
        if(!In(ch, opset)) {//如果读入的是操作数
            data = ch - '0';
            i++;
            ch = [_getCal characterAtIndex:i];
            NSLog(@"ch == %c", ch);
            while(!In(ch, opset)){//读入的不是运算符，是操作数
                data = data * 10 + ch - '0';//读入操作数的各位数码，并转化为十进制数data
                i++;
                ch = [_getCal characterAtIndex:i];
                NSLog(@"ch == %c", ch);
            }
            NumPush(Num, data);//操作数入栈
        } else {
            if(ch == ')') {
                Pop(Oper, op);
                Pop(Num, a2);
                Pop(Num, a1);
                val = Count(a1, op, a2);
                NumPush(Num, val);
                Pop(Oper, op);//让左括号出栈
                i++;
                ch = [_getCal characterAtIndex:i];
                NSLog(@"ch == %c", ch);
                continue;
            }
            switch(Compare(GetTop(Oper), ch)) {
                case '>':
                    OperPush(Oper, ch);
                    i++;
                    ch = [_getCal characterAtIndex:i];
                    NSLog(@"ch == %c", ch);
                    break;
                case '=':
                    Pop(Oper, x);
                    i++;
                    ch = [_getCal characterAtIndex:i];
                    NSLog(@"ch == %c", ch);
                    break;
                case '<':
                    Pop(Oper, op);
                    Pop(Num, a2);
                    Pop(Num, a1);
                    val = Count(a1, op, a2);
                    NumPush(Num, val);
                    break;
            }
        }
    }
    _answer = [NSNumber numberWithChar:GetTop(Num)];
    
}



@end
