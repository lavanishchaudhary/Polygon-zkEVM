pragma circom 2.0.0;

template MyCircuit () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;  

   //Declaration of intermediate signals or signal from gates 
   signal x;
   signal y;

   //Declaration of final signal output
   signal output Q;

   //components gates used to create MyCircuit
   component andGate=AND();
   component notGate=NOT();
   component orGate=OR();

   //circuit logic
   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notGate.in <== b;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;
   Q <== orGate.out;

   //Value of Q when input a=0 & b=1;
   log("Q equal to:", Q);

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = MyCircuit();