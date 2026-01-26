## Systolic Array Design for 4x4 Matrix Multiplication

Design a simple 4x4 systolic array using SystemVerilog. The array should take two 4x4 staggered matrices as input and produce a 4x4 matrix as output, representing the matrix multiplication result.

Constraints:

    • The design should handle only 4x4 matrices.

    • Inputs and outputs should be unsigned integers.

    • The module should be synchronous with a clock and reset.

#### Processing Element Block 
<img width="205" height="170" alt="image" src="https://github.com/user-attachments/assets/bb5f6d38-deb6-4fab-b9fe-3e202f11b60a" />

#### Matrix Data Feeding into the PE Array
<img width="5216" height="4996" alt="gk-Page-136" src="https://github.com/user-attachments/assets/a6cb70e7-a144-4c05-8b2a-80677ae50edc" />

#### Resource Summary
<img width="366" height="176" alt="image" src="https://github.com/user-attachments/assets/6b702d8f-bb87-483b-b064-04ca8bf56911" />

    • 8 Multipliers -> 8 DSPS

#### RTL  
<img width="1047" height="648" alt="image" src="https://github.com/user-attachments/assets/0a1f7dbb-81e7-4886-9723-fa0a6d066de4" /> 

### MATLAB
<img width="403" height="161" alt="image" src="https://github.com/user-attachments/assets/3028f0b7-bcc5-46e7-9354-c3eadef7c4fc" />

