OPENQASM 2.0;
include "qelib1.inc";

// QFT
qreg q[4];
creg c[4];
x q[0]; 
x q[2];
barrier q;
h q[0];
cu1(pi/2) q[1],q[0];
h q[1];
cu1(pi/4) q[2],q[0];
cu1(pi/2) q[2],q[1];
h q[2];
cu1(pi/4) q[3],q[1];
cu1(pi/2) q[3],q[2];
h q[3];

// Le aplicamos la inversa de QFT

barrier q;
h q[0];
measure q[0] -> c[0];
if(c==1) u1(pi/2) q[1];
h q[1];
measure q[1] -> c[1];
if(c==1) u1(pi/4) q[2];
if(c==2) u1(pi/2) q[2];
if(c==3) u1(pi/2+pi/4) q[2];
h q[2];
measure q[2] -> c[2];
if(c==2) u1(pi/4) q[3];
if(c==3) u1(pi/4+pi/8) q[3];
if(c==4) u1(pi/2) q[3];
if(c==6) u1(pi/2+pi/4) q[3];
if(c==7) u1(pi/2+pi/4+pi/8) q[3];
h q[3];
measure q[3] -> c[3];