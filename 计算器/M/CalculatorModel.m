//
//  CalculatorModel.m
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

char *opset = "+-*/()#";

void InitStack(struct Sqstack *s) {
    s->top = -1;
}

void NumPush(struct Sqstack *s, float num) {
    
    if(s->top == 99) {//栈满
        return ;
    }
    s->top++;
    s -> data[s -> top] = num;
    NSLog(@"push numdata == %f", s -> data[s -> top]);
    
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

float NumGetTop(struct Sqstack *s) {
    
    if(s->top == -1) {
        return 0;
    }
    float ch;
    ch = (float)s->data[s->top];
    return ch;
    
}

char Pop(struct Sqstack *s, char x) {
    
    if(s->top == -1)
        return 0;
    x = (char)s->data[s->top];
    NSLog(@"pop --- %c", x);
    --(s->top);
    return x;
    
}

float NumPop(struct Sqstack *s) {
    
    float x;
    if(s->top == -1)
        return 0;
    x = (float)s->data[s->top];
    NSLog(@"pop --- %f", x);
    --(s->top);
    return x;
    
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
    char *opset = "+-*/()#";
    
    //用来进行比较运算符优先级的矩阵,3代表'=',2代表'>',1代表'<',0代表不可比
    int  cmp[7][7] = {
        { 2, 2, 2, 2, 2, 1, 1 },
        { 2, 2, 2, 2, 2, 1, 1 },
        { 1, 1, 2, 2, 2, 1, 1 },
        { 1, 1, 2, 2, 2, 1, 1 },
        { 2, 2, 2, 2, 3, 1, 0 },
        { 1, 1, 1, 1, 0, 1, 1 },
        { 2, 2, 2, 2, 2, 0, 3 }  };

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

float Count(float x1, char op, float x2) {
    float val = 0;
    switch(op) {
        case '+': val = x1 + x2; break;
        case '-': val = x1 - x2; break;
        case '*': val = x1 * x2; break;
        case '/': val = x1 / x2; break;
    }
    NSLog(@"val ===  %f", val);
    return val;
}

- (void)Cal{
    
    char ch, x = '\0', op = '\0';
    int i = 0;
    float data, a1, a2, val;
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
            int flag = 0;
            while(!In(ch, opset)){//读入的不是运算符，是操作数
                if (ch == '.') {
                    flag = 1;
                    i++;
                    ch = [_getCal characterAtIndex:i];
                    NSLog(@"ch == %c", ch);
                    continue;
                }
                if (flag) {
                    float j;
                    j = (ch - '0') * pow(10, -1);
                    NSLog(@"%f", j);
                    data = data + j;
                    NSLog(@"point data == %f", data);
                    flag++;
                } else {
                    data = data * 10 + ch - '0';//读入操作数的各位数码，并转化为十进制数data
                }
                i++;
                ch = [_getCal characterAtIndex:i];
                NSLog(@"ch == %c", ch);
            }
            NumPush(Num, data);//操作数入栈
        } else {
            if(ch == ')') {
                op = Pop(Oper, op);
                a2 = NumPop(Num);
                a1 = NumPop(Num);
                val = Count(a1, op, a2);
                NumPush(Num, val);
                op = Pop(Oper, op);//让左括号出栈
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
                    x = Pop(Oper, x);
                    i++;
                    ch = [_getCal characterAtIndex:i];
                    NSLog(@"ch == %c", ch);
                    break;
                case '<':
                    op = Pop(Oper, op);
                    a2 = NumPop(Num);
                    a1 = NumPop(Num);
                    val = Count(a1, op, a2);
                    NumPush(Num, val);
                    break;
            }
        }
    }
    NSLog(@"NumGetTop(Num) ==  %f", NumGetTop(Num));
    _answer = [NSNumber numberWithFloat:NumGetTop(Num)];
    
}



@end
