// Specify the circom version being used
pragma circom 2.0.0;

// Define a template for the logical AND operation
template AND(input x, input y, output out) {
    // Compute the logical AND of inputs x and y
    out <== x * y;
}

// Define a template for the logical NOT operation
template NOT(input in, output out) {
    // Compute the logical negation of input in
    out <== 1 - in;
}

// Define a template for the logical OR operation
template OR(input x, input y, output out) {
    // Compute the logical OR of inputs x and y
    out <== x + y - x * y;
}

// Define the main circuit template
template Circuit(input a, input b, output q) {
    // Declare intermediate signals
    signal x;
    signal y;

    // Compute the logical AND of inputs a and b
    AND(a, b, x);
    
    // Compute the logical negation of input b
    NOT(b, y);
    
    // Compute the logical OR of signals x and y
    OR(x, y, q);
}

// Instantiate the main circuit template
component main = Circuit();
