import 'dart:io';

class Bank {
  final String _accountName;
  final String _accountNumber;
  double _accountBalance;

  Bank(this._accountName, this._accountNumber, this._accountBalance);

  String get name {
    return _accountName;
  }

  String get number {
    return _accountNumber;
  }

  double get balance {
    return _accountBalance;
  }

  void withdrawFund(double amount) {
    _accountBalance -= amount;
  }

  void depositFund(double amount) {
    _accountBalance += amount;
  }
}

double getAmount() {
  print('Enter amount: ');
  var amount = double.parse(stdin.readLineSync());
  return amount;
}

void main(List<String> arguments) {
  var orion = Bank('Orion', '8019382493904', 0.0);
  print(
      'Welcom Mr.${orion._accountName}, What operation would you like to perform?\n');
  // Reading operation
  var operation;

  do {
    print('=' * 90);
    print('Enter 1 to check account balance');
    print('Enter 2 to deposit fund');
    print('Enter 3 to make a withdraw');
    print('Enter 0 to quit');
    print('What operation would you like to perform: ');
    operation = stdin.readLineSync();
    switch (operation) {
      case '1':
        print('Your account balance is ${orion.balance}'.toUpperCase());
        break;
      case '2':
        var amount = getAmount();
        orion.depositFund(amount);
        print('Money deposited successfully!'.toUpperCase());
        break;
      case '3':
        var amount = getAmount();
        if (amount > orion.balance) {
          print('Insufficient funds!'.toUpperCase());
        } else {
          orion.withdrawFund(amount);
          print('Money withdrawn successfully!'.toUpperCase());
        }
        break;
    }
  } while (operation != '0');

  print('Thanks for patronizing ORION BANK PLC');
}
