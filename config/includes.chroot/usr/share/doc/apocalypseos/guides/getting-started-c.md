# Getting Started with C

C is the language of operating systems, embedded devices, and high-performance software. It gives you direct control over hardware and memory.

## Your First Program

Create `hello.c`:

```c
#include <stdio.h>

int main(void) {
    printf("Hello from ApocalypseOS!\n");
    return 0;
}
```

Compile and run:

```bash
gcc -o hello hello.c
./hello
```

## Compilation Flags

```bash
# Standard compilation
gcc -o program program.c

# With warnings (always use this)
gcc -Wall -Wextra -o program program.c

# With debugging symbols (for GDB)
gcc -g -Wall -Wextra -o program program.c

# Optimized build
gcc -O2 -Wall -o program program.c

# Multiple source files
gcc -Wall -o program main.c utils.c network.c
```

## Variables and Types

```c
#include <stdio.h>
#include <stdbool.h>

int main(void) {
    int count = 42;
    float temperature = 98.6f;
    double precise_value = 3.14159265358979;
    char letter = 'A';
    char name[] = "Survivor";
    bool is_secure = true;

    printf("Count: %d\n", count);
    printf("Name: %s\n", name);
    printf("Secure: %s\n", is_secure ? "yes" : "no");

    return 0;
}
```

## Functions

```c
#include <stdio.h>

int calculate_water(int people, int days) {
    return people * 3 * days;  // 3 liters per person per day
}

void print_status(const char *message) {
    printf("[ApocalypseOS] %s\n", message);
}

int main(void) {
    int water = calculate_water(4, 30);
    printf("Water needed: %d liters\n", water);
    print_status("All systems operational");
    return 0;
}
```

## Pointers and Memory

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    // Stack allocation
    int x = 10;
    int *ptr = &x;
    printf("Value: %d, Address: %p\n", *ptr, (void *)ptr);

    // Heap allocation
    char *buffer = malloc(256);
    if (buffer == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    strncpy(buffer, "Dynamically allocated string", 255);
    buffer[255] = '\0';
    printf("%s\n", buffer);

    free(buffer);  // Always free what you malloc
    return 0;
}
```

## File I/O

```c
#include <stdio.h>

int main(void) {
    // Write
    FILE *fp = fopen("log.txt", "w");
    if (fp == NULL) {
        perror("Failed to open file");
        return 1;
    }
    fprintf(fp, "Day 1: Systems online\n");
    fprintf(fp, "Day 2: Backup complete\n");
    fclose(fp);

    // Read
    fp = fopen("log.txt", "r");
    if (fp == NULL) {
        perror("Failed to open file");
        return 1;
    }
    char line[256];
    while (fgets(line, sizeof(line), fp) != NULL) {
        printf("%s", line);
    }
    fclose(fp);

    return 0;
}
```

## Makefiles

Create a `Makefile` for your project:

```makefile
CC = gcc
CFLAGS = -Wall -Wextra -g
TARGET = program
SOURCES = main.c utils.c
OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: clean
```

Run with:

```bash
make          # Build
make clean    # Clean
```

## Debugging with GDB

```bash
# Compile with debug symbols
gcc -g -o program program.c

# Start GDB
gdb ./program

# Common GDB commands:
# run          - start the program
# break main   - set breakpoint at main
# next         - step over
# step         - step into
# print x      - print variable x
# backtrace    - show call stack
# quit         - exit
```

## Memory Analysis with Valgrind

```bash
valgrind --leak-check=full ./program
```

## Next Steps

- Read header files in `/usr/include/` to understand the standard library
- Use `man 3 printf` to read documentation for any C function
- Ask your local AI: `ollama run codellama "Explain linked lists in C"`
