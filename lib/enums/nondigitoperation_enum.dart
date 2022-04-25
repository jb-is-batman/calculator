
enum NonDigitOperation {
  decimal, negative 
}

extension ExtraFunctionality on NonDigitOperation
{

  String get symbol
  {
    switch (this)
    {
      case NonDigitOperation.negative:
        return "-";
      case NonDigitOperation.decimal:
        return ".";
    }
  }
}