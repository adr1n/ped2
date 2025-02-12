import math
a = float(input("digite a: " ))
b = float(input("digite b: " ))

x = float(max(a,b))
y = float(min(a,b))

rad = max((0.875*x + 0.5*y), y)

rad1 = math.sqrt(pow(a,2)+pow(b,2))

print(rad)
print(rad1)

# H = int hipo(int a, int b) {
# x = max(a, b);
# y = min(a, b);
# t3 = x >> 3;
# t4 = y >> 1;
# t5 = x – t3;
# t6 = t4 + t5;
# t7 = max(t6, x);
# return t7;}
