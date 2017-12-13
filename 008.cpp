#include <cstdint>
#include <fstream>
#include <iostream>
#include <string>

std::string input(void)
{
    std::ifstream file("txt/008.txt");
    std::string input, line;

    while (std::getline(file, line))
    {
        input += line;
    }

    return input;
}

std::int64_t product_at(int pos, std::string digits)
{
    std::int64_t product = 1;
    int i;

    for (i = 0; i < 13; ++i)
    {
        product *= digits[pos + i] - '0';
    }

    return product;
}

int main(void)
{
    std::int64_t largest, product;
    unsigned int i;
    std::string digits(input());

    for (i = 0; i <= digits.size() - 13; ++i)
    {
        product = product_at(i, digits);

        if (product > largest)
        {
            largest = product;
        }
    }

    std::cout << largest << std::endl;

    return 0;
}
