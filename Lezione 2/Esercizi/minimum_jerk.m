clear
ti=0;
prompt={'Movimento [cm]', 'Tempo [s]'};
dlgtitle='Minimum jerk';
dims=[1 35];
answer=inputdlg(prompt,dlgtitle,dims);
s=str2double(answer{1});
tf=str2double(answer{2});
T=[tf.^3 tf.^4 tf.^5 ; 3*tf.^2 4*tf.^3 5*tf.^4 ; 6*tf 12*tf.^2 20*tf.^3];
N=[s 0 0]';
X=inv(T)*N;
disp(['x(t) = ' num2str(X(1)) '*t^3 + ' num2str(X(2)) '*t^4 + ' num2str(X(3)) '*t^5']);