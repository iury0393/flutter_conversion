// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$selectedValueFromDropdownAtom = Atom(
      name: '_HomeControllerBase.selectedValueFromDropdown', context: context);

  @override
  String get selectedValueFromDropdown {
    _$selectedValueFromDropdownAtom.reportRead();
    return super.selectedValueFromDropdown;
  }

  @override
  set selectedValueFromDropdown(String value) {
    _$selectedValueFromDropdownAtom
        .reportWrite(value, super.selectedValueFromDropdown, () {
      super.selectedValueFromDropdown = value;
    });
  }

  late final _$getConversionAsyncAction =
      AsyncAction('_HomeControllerBase.getConversion', context: context);

  @override
  Future<ConversionModel> getConversion() {
    return _$getConversionAsyncAction.run(() => super.getConversion());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  String setDropDownValue(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setDropDownValue');
    try {
      return super.setDropDownValue(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedValueFromDropdown: ${selectedValueFromDropdown}
    ''';
  }
}
