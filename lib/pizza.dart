import 'package:flutter/material.dart';

enum PizzaSize {
  small,
  medium,
  large,
  extraLarge,
}

enum PizzaSauce {
  none,
  tomato,
  garlic,
  hot,
  mild,
}

enum PizzaCrust {
  classic,
  deepDish,
  panBaked,
  cross,
  newYork,
}

class Pizza {
  late final PizzaSize _size;
  late final PizzaCrust _crust;
  late final PizzaSauce _sauce;
  final List<String> _toppings = [];
  late final String _notes;
  late final double _price;
  late final String _nama;

  PizzaSize get size => _size;
  PizzaCrust get crust => _crust;
  PizzaSauce get sauce => _sauce;
  List<String> get toppings => _toppings;
  String get notes => _notes;
  double get price => _price;
  String get nama => _nama;

  void addTopping(String topping) {
    _toppings.add(topping);
  }

  void setPrice(double price) {
    _price = price;
  }

  void setNama(String nama) {
    _nama = nama;
  }

  void setSize(PizzaSize size) {
    _size = size;
  }

  void setCrust(PizzaCrust crust) {
    _crust = crust;
  }

  void setSauce(PizzaSauce sauce) {
    _sauce = sauce;
  }

  void addNotes(String note) {
    _notes = note;
  }

  String _stringfiedToppings() {
    var stringToppings = _toppings.join(', ');
    var lastComa = stringToppings.lastIndexOf(',');
    var replacment =
        ','.allMatches(stringToppings).length > 1 ? ', and' : 'and';
    return stringToppings.replaceRange(lastComa, lastComa + 1, replacment);
  }

  @override
  String toString() {
    return 'A delicius $_nama pizza with ${_crust.toString().split('.')[1]} crust coverd in ${_stringfiedToppings()}';
  }
}

abstract class PizzaBuilder {
  @protected
  late Pizza pizza;

  @protected
  late String nama;

  void createPizza() {
    pizza = Pizza();
    pizza.setNama(nama);
  }

  Pizza getPizza() {
    return pizza;
  }

  void setPizzaPrice(double price) {
    pizza.setPrice(price);
  }

  void setSize(PizzaSize size) {
    pizza.setSize(size);
  }

  void addNotes(String notes) {
    pizza.addNotes(notes);
  }

  void buildSauce();
  void buildToppings();
  void buildCrust();
}

class HawaiianPizzaBuilder extends PizzaBuilder {
  static const String pizzaName = 'Hawaiian Pizza';

  HawaiianPizzaBuilder() {
    super.nama = pizzaName;
  }

  @override
  void buildCrust() {
    pizza.setCrust(PizzaCrust.classic);
  }

  @override
  void buildSauce() {
    pizza.setSauce(PizzaSauce.mild);
  }

  @override
  void buildToppings() {
    pizza.addTopping('topping 1');
    pizza.addTopping('topping 2');
  }
}

class NewYorkPizzaBuilder extends PizzaBuilder {
  static const String pizzaName = 'NewYork Pizza';

  NewYorkPizzaBuilder() {
    super.nama = pizzaName;
  }

  @override
  void buildCrust() {
    pizza.setCrust(PizzaCrust.newYork);
  }

  @override
  void buildSauce() {
    pizza.setSauce(PizzaSauce.tomato);
  }

  @override
  void buildToppings() {
    pizza.addTopping('topping 1');
    pizza.addTopping('topping 2');
  }
}

class PizzaDirector {
  late PizzaBuilder _pizzaBuilder;

  void setPizzaBuilder(PizzaBuilder builder) {
    _pizzaBuilder = builder;
  }

  Pizza getPizza() {
    return _pizzaBuilder.getPizza();
  }

  void makePizza() {
    _pizzaBuilder.createPizza();
    _pizzaBuilder.buildCrust();
    _pizzaBuilder.buildSauce();
    _pizzaBuilder.buildToppings();
  }
}
