extension NumberVerifier on String {
  bool get checkTryPars {
    // Null or empty string is not a number
    if (this == null || this.isEmpty) {
      
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = num.tryParse(this);

    if (number == null) {
      
      return false;
    }
    
    return true;
  }
}
