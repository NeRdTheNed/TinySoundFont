echo Building \'example1-linux-`uname -m`\' ...
gcc -Wall example1.c -lm -ldl -lpthread -o example1-linux-`uname -m`
echo Building \'example2-linux-`uname -m`\' ...
gcc -Wall example2.c -lm -ldl -lpthread -o example2-linux-`uname -m`
echo Building \'example3-linux-`uname -m`\' ...
gcc -Wall example3.c -lm -ldl -lpthread -o example3-linux-`uname -m`
echo Done!
