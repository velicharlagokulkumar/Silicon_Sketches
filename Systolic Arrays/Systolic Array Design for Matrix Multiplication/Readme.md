## Systolic Array Design for 4x4 Matrix Multiplication

Design a simple 4x4 systolic array using SystemVerilog. The array should take two 4x4 staggered matrices as input and produce a 4x4 matrix as output, representing the matrix multiplication result.

Constraints:

    • The design should handle only 4x4 matrices.

    • Inputs and outputs should be unsigned integers.

    • The module should be synchronous with a clock and reset.

#### Processing Element Block 
<img width="205" height="170" alt="image" src="https://github.com/user-attachments/assets/bb5f6d38-deb6-4fab-b9fe-3e202f11b60a" />

#### Matrix Data Feeding into the PE Array
<img width="472" height="371" alt="image" src="https://github.com/user-attachments/assets/88068bf2-ae58-4dfc-87ab-edfb25496697" />
<img width="635" height="580" alt="image" src="https://github.com/user-attachments/assets/cc719f08-0e36-4a32-8974-5f7034161fad" />


#### RTL  
<img width="1047" height="648" alt="image" src="https://github.com/user-attachments/assets/0a1f7dbb-81e7-4886-9723-fa0a6d066de4" /> 

### MATLAB
<img width="403" height="161" alt="image" src="https://github.com/user-attachments/assets/3028f0b7-bcc5-46e7-9354-c3eadef7c4fc" />

