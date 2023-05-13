#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_EXPR_SIZE 100

char associativity(char operator) {
    switch (operator) {
        case '+':
        case '-':
        case '*':
        case '/':
            return 'L';
        case '^':
            return 'R';
        default:
            return 'N';
    }
};

// Function to return precedence of operators
int precedence(char operator) {
    switch (operator) {
        case '+':
        case '-':
            return 1;
        case '*':
        case '/':
            return 2;
        case '^':
            return 3;
        default:
            return -1;
    }
}

// Function to check if the scanned character
// is an operator
int isOperator(char ch) {
    return (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^');
}

// Main function to convert infix expression
// to postfix expression
char *infixToPostfix(char *infix) {
    int i, j;
    int len = strlen(infix);
    char *postfix = (char *)malloc(sizeof(char) * (len + 1));
    char stack[MAX_EXPR_SIZE];
    int top = -1;

    for (i = 0, j = 0; i < len; i++) {
        if (infix[i] == ' ' || infix[i] == '\t')
            continue;

        // If the scanned character is operand
        // add it to the postfix expression
        if (isalnum(infix[i])) {
            postfix[j++] = infix[i];
        }

        // if the scanned character is '('
        // push it in the stack
        else if (infix[i] == '(') {
            stack[++top] = infix[i];
        }

        // if the scanned character is ')'
        // pop the stack and add it to the
        // output string until empty or '(' found
        else if (infix[i] == ')') {
            while (top > -1 && stack[top] != '(')
                postfix[j++] = stack[top--];
            if (top > -1 && stack[top] != '(')
                return "Invalid Expression";
            else
                top--;
        }

        // If the scanned character is an operator, check for precedence and associativity of current operator with top of stack operator and do the following:
        else if (isOperator(infix[i])) {
            if (precedence(stack[top]) < precedence(infix[i])) {
                stack[++top] = infix[i];  // Push current operator on stack
            } else if (precedence(stack[top]) > precedence(infix[i])) {
                int flag = 0;
                while (true) {
                    if (precedence(stack[top]) > precedence(infix[i])) {
                        postfix[j++] = stack[top--];
                    } else if (associativity(infix[i]) == 'L' && precedence(stack[top]) == precedence(infix[i])) {
                        postfix[j++] = stack[top--];  // Pop and add to output string
                        stack[++top] = infix[i];      // Push current operator on stack
                        flag = 1;
                        break;
                    } else if (associativity(infix[i]) == 'R' && precedence(stack[top]) == precedence(infix[i])) {
                        stack[++top] = infix[i];
                        break;
                    }
                }
                if (flag == 0) {
                    stack[++top] = infix[i];  // Push current operator on stack
                }
            } else if (precedence(stack[top]) == precedence(infix[i])) {
                if (associativity(infix[i]) == 'R' && precedence(stack[top]) == precedence(infix[i])) {
                    stack[++top] = infix[i];
                } else if (associativity(infix[i]) == 'L' && precedence(stack[top]) == precedence(infix[i])) {
                    postfix[j++] = stack[top--];  // Pop and add to output string
                    stack[++top] = infix[i];      // Push current operator on stack
                }
            }
        }
    }

    // Pop all remaining elements from the stack
    while (top > -1) {
        if (stack[top] == '(') {
            return "Invalid Expression";
        }
        postfix[j++] = stack[top--];
    }
    postfix[j] = '\0';
    return postfix;
}

// Driver code
int main() {
    char infix[MAX_EXPR_SIZE] = "a+b*(c^d-e)^(f+g*h)-i";

    // Function call
    char *postfix = infixToPostfix(infix);
    printf("%s\n", postfix);
    free(postfix);
    return 0;
}