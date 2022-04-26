import 'package:stacked/stacked.dart';

class ActionButtonsService with ReactiveServiceMixin{

    ActionButtonsService() {
      
    listenToReactiveValues([
      _isBackspaceEnabled, 
      _isNextEnabled, 
      _isResultEnabled, 
      _isClearEnabled, 
      _isBackEnabled, 
      _isResetEnabled
    ]);
  }

  final ReactiveValue<bool> _isBackspaceEnabled = ReactiveValue<bool>(true);
  final ReactiveValue<bool> _isNextEnabled = ReactiveValue<bool>(true);
  final ReactiveValue<bool> _isResultEnabled = ReactiveValue<bool>(true);
  final ReactiveValue<bool> _isClearEnabled = ReactiveValue<bool>(true);
  final ReactiveValue<bool> _isBackEnabled = ReactiveValue<bool>(true);
  final ReactiveValue<bool> _isResetEnabled = ReactiveValue<bool>(true);
}