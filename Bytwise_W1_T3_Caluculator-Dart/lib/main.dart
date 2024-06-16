import 'dart:io';



int addition ()
{
  int first_num;
  int second_num;
  int sum;

  print('Enter First Number');
  first_num=int .parse(stdin.readLineSync()!);
  print('Enter Second Number');
  second_num=int .parse(stdin.readLineSync()!);

  sum=first_num+second_num;
  print('Result is : ');
  return sum;
}
int subtraction ()
{
  int first_num;
  int second_num;
  int sum;

  print('Enter First Number');
  first_num=int .parse(stdin.readLineSync()!);
  print('Enter Second Number');
  second_num=int .parse(stdin.readLineSync()!);

  sum=first_num-second_num;
  print('Result is : ');
  return sum;
}

int multiplication()
{
  int first_num;
  int second_num;
  int sum;

  print('Enter First Number');
  first_num=int .parse(stdin.readLineSync()!);
  print('Enter Second Number');
  second_num=int .parse(stdin.readLineSync()!);

  sum=first_num*second_num;
  print('Result is : ');
  return sum;
}

double division()
{
  double first_num;
  double second_num;
  double sum;

  print('Enter First Number');
  first_num=double .parse(stdin.readLineSync()!);
  print('Enter Second Number');
  second_num=double .parse(stdin.readLineSync()!);
  if(second_num==0)
    {
      print('invalid input! : Denominator cannot be zero');
      return 0;
    }

  sum=first_num / second_num;
  print('Result is : ');
  return sum;
}




void main()
{

  print('---------------------------');
  print('Welcome to Calculator!');


  String? operation;
  do
  {
    print('---------------------------');
    print('Select one of the following operations:');
    print(' + Addition');
    print(' - Subtraction');
    print(' * Multiplication');
    print(' / Division');
    print(' 0 End');
    print('---------------------------');
    operation=stdin.readLineSync();
    print('---------------------------');
    switch (operation) {
      case '+':
        {
          print('Addition');
          print(addition());

        }
      case'-':
        {
          print('Subtraction');
          print(subtraction());
        }
      case'*':
        {
          print('Multiplication');
          print(multiplication());
        }
      case '/':
        {
          print('Division');
          print(division());
        }
      case '0':
        {
          print('Exiting Calculator!');
          break;
        }
        default:
          {
            print('invalid operation');
          }

    }
  }
  while(operation!='0');





}