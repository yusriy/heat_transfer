clc;
2 clear;
3 printf(”\t\t\tChapter4 example9\n\n\n”);
4 rou =.5*1000;
5 cp =837;
6 k=0.128;
7 alpha=0.049e-5;
8 // let Fo=0.5 and dx=0.05
9 dt=0.5*(0.05)^2/alpha;
10 printf(”\nThe time increment is %.3f hr”,dt/3600);
11 p=1;
12 m=6;
13 A=2*eye(6,6);
￼14 n=1;
15 N=1;
16 for
17
18 19
20 end
21 for
22 23 24
j=1:n
for i=1:6
T(i,j)=20;
end
n=1:7
for i=1:4
B(i+1,n)=T(i+2,n)+T(i,n); B(1,n)=T(i+1,n)+200;
B(6,n)=2*T(i+1,n);
26 end
27 Temp=inv(A)*B(:,n); // temperature at the different
points
28 printf(”\nThe temperature at different points after %d time interval are:”,n);
29 T(:,n+1)=Temp;
30 disp(T(:,n+1));
31 end
32 time=n*dt;
33 printf(”\nThe required time is %.2f hr”,time/3600);
34 x=0:5:30;
35 plot(x,[200;T(:,2)]);
36 a1=gca();
37 a1.data_bounds=[0,0;30,200];
38 xtitle(’(a) After 0.709 hr’,’T degree C’,’x, cm’);
39 newticks=a1.x_ticks;
40 newticks (2) =[0;10;20;30];
41 newticks(3)=[ ’0 ’; ’10 ’; ’20 ’; ’30 ’];
42 a1.x_ticks=newticks;
43 newticks1=a1.y_ticks;
44 newticks1(2)=[0;50;100;150;200];
45 newticks1(3)=[ ’0 ’; ’50 ’; ’100 ’; ’150 ’; ’200 ’];
46 a1.y_ticks=newticks1;
47 plot(x,[200;T(:,3)]);
48 a2=gca();
49 hl=legend([ ’ After 2(0.709) hr ’; ’ After (0.709) hr ’
              ]);
50 a2.data_bounds=[0,0;30,200];
51 xtitle(’(b) After 2(0.709) hr ’,’T degree C’,’x, cm’
);
52 newticks=a2.x_ticks;
53 newticks (2) =[0;10;20;30];
54 newticks(3)=[ ’0 ’; ’10 ’; ’20 ’; ’30 ’];
55 a2.x_ticks=newticks;
56 newticks1=a2.y_ticks;
57 newticks1(2)=[0;50;100;150;200];
58 newticks1(3)=[ ’0 ’; ’50 ’; ’100 ’; ’150 ’; ’200 ’];
54
59 a2.y_ticks=newticks1;
60 filename=’(b) After 2(0.709) hr ’;
61 clf();
62 plot(x,[200;T(:,4)],x,[200;T(:,3)]);
63 a3=gca();
64 hl=legend([ ’ After 3(0.709) hr ’; ’ After 2(0.709) hr ’
              ]);
65 a3.data_bounds=[0,0;30,200];
66 xtitle(’(c) After 3(0.709) hr ’,’T degree C’,’x, cm’
);
67 newticks=a3.x_ticks;
68 newticks (2) =[0;10;20;30];
69 newticks(3)=[ ’0 ’; ’10 ’; ’20 ’; ’30 ’];
70 a3.x_ticks=newticks;
71 newticks1=a3.y_ticks;
72 newticks1(2)=[0;50;100;150;200];
73 newticks1(3)=[ ’0 ’; ’50 ’; ’100 ’; ’150 ’; ’200 ’];
74 a3.y_ticks=newticks1;
75 clf();
76 plot(x,[200;T(:,5)],x,[200;T(:,4)]);
77 a4=gca();
78 hl=legend([ ’ After 4(0.709) hr ’; ’ After 3(0.709) hr ’
              ]);
79 a4.data_bounds=[0,0;30,200];
80 xtitle(’(d) After 4(0.709) hr ’,’T degree C’,’x, cm’
);
81 newticks=a4.x_ticks;
82 newticks (2) =[0;10;20;30];
83 newticks(3)=[ ’0 ’; ’10 ’; ’20 ’; ’30 ’];
84 a4.x_ticks=newticks;
85 newticks1=a4.y_ticks;
86 newticks1(2)=[0;50;100;150;200];
87 newticks1(3)=[ ’0 ’; ’50 ’; ’100 ’; ’150 ’; ’200 ’];
88 a4.y_ticks=newticks1;
89 clf();
90 plot(x,[200;T(:,6)],x,[200;T(:,5)]);
91 a5=gca();
92 hl=legend([ ’ After 5(0.709) hr ’; ’ After 4(0.709) hr ’
              55
              ]);
93 a5.data_bounds=[0,0;30,200];
94 xtitle(’(e) After 5(0.709) hr ’,’T degree C’,’x, cm’
);
95 newticks=a5.x_ticks;
96 newticks (2) =[0;10;20;30];
97 newticks(3)=[ ’0 ’; ’10 ’; ’20 ’; ’30 ’];
98 a5.x_ticks=newticks;
99 newticks1=a5.y_ticks;
100 newticks1(2)=[0;50;100;150;200];
101 newticks1(3)=[ ’0 ’; ’50 ’; ’100 ’; ’150 ’; ’200 ’];
102 a5.y_ticks=newticks1;
103 clf();
104 plot(x,[200;T(:,7)]);
105 a6=gca();
106 a6.data_bounds=[0,0;30,200];
107 xtitle(’(f) After 7(0.709) hr ’,’T degree C’,’x, cm’
);
108 newticks=a6.x_ticks;
109 newticks (2) =[0;10;20;30];
110 newticks(3)=[ ’0 ’; ’10 ’; ’20 ’; ’30 ’];
111 a6.x_ticks=newticks;
112 newticks1=a6.y_ticks;
113 newticks1(2)=[0;50;100;150;200];
114 newticks1(3)=[ ’0 ’; ’50 ’; ’100 ’; ’150 ’; ’200 ’];
115 a6.y_ticks=newticks1;