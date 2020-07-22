clc
clear all
close all
n=input('Enter no of processes:') % no of processes input liye han
sum=0;                           % sum ko initially 0 rkha ha
for i=1:n                        % jitne no of process han utne ka loop chalaya
    bt(i)=input('Enter burst time:')  % burst time and period enter kiye
    p(i)=input('Enter period:')
end
for i=1:n                      % ye for loop Ye check krne k liye ha k Process schedulable han k ni
    sum=sum+(bt(i)/p(i));       %% formula ha sum of burst time  divided by period.............
end         
                            % sum pehle 0 ha phr 0+(burst time/period ho
                            % ga).................jitne process han 
                            % mtlb burst time agr 2 3 4 ha and perid 4 5 6
                            % ha to (2/4)+(3/5)+(4/6)



if (sum>1)                     %% agr ye answer sum>1 ho to process is not schedulable else schedulable
    disp('These Processes are not Schedulable!!!!')
    else
    disp('These Processes are Schedulable!!!!')
end




stack=0
ct=p
flag=0

% [M I]=min(p(:))
for j=1:n             % 1 loop chala
    for i=1:n         % nested loop chala
    if(min(p))        % agr p=[3 4 5] ha to min(p) ka mtlb ha 3......jo sb se km ha..........ye condition hamesha chale gi.....kun k min hamesha p main hoga
    [M I]=min(p(:))   % is ka mtlb ha agr p=[3 4 5] ha to min of p is 3.........so M=3 and inder I=1........mtlb jo p main minimum no ha wo index 1 pe para ha
    p(I)=p(I)+ct(I)   % ct=p kr diya ha fixed....LINE 30 main.......agr p=[3 4 5] ha and minimum 3 ha to 3 ko 6 hona ha
               % p ka jo min ha us ki next deadline 6 ha to
               % p(I)+ct(I)......I index nikal aya ha minimum value ka then
               % P(I)=3+3 ...ye store ho gya ha P(I) main
    end        % IF condition khatm hoi
                
                
    
                % 
    stack=stack+bt(I)   % ab stack 1 variable ha ...initially stack=0 ha
                        % to jase hm gannt chart bnaty ha jis process ki
                        % deadline sb se km hoti ha us ka burst time aa
                        % jata ha to ab jis process ka period sb se km ha
                        % wo line 37 main check howa ha us ka burst time
                        % add ho jaye ga stack main
                        
                        
                % mtlb agr period [ 5 6 7] ha
                % to min 5 ha us burst time stack main add ho ga 
                % and p update ho ga next deadlne hogi [10 6 7]
                % phr minimum check ho ga ab minimum 6 ha to 6 2nd index pr
                % ha to 2nd process ka burst time stack main add ho ga and
                % p update ho jaye ga p=[10 12 7]............phr minimum
                % check kre ga jo min ha us ki index aye gi,,......us index
                % pr jo process ha us ka
                % ka burst time stack main add ho jaye ga and p update ho
                % jaye gi p=[10 12 14]
                % AB INNER LOOP KHATM HO JAYE GA OUTER LOOP KI @ND
                % ITERATION MAIN PHR 3 BAAR AESE CHALE GA
                        
                        
                        
                        
    if (stack>M)        %%%% agr stack, mtlb agr gannt chart bnayen to
                        % stack update ho rha hota ha agr stack main 10
                        % value ha or M deadline ha jo line 37 main ai ha
                        % ...........M ki value 9 ha to mtlb process
                        % deadline miss kr gya ha
        flag=1          % agr deadline miss kre to flag ko 1 kr do ye just break krn k liye lgaya ha
                        % jidhr flag 1 ho gya .......deadline miss ho gyi
                        % sb loops ko break kr do
        disp('Deadline missed!!!!!!!!!')
        fprintf('Deadline is missed by P%d\n',I)   % ye bta rha ha k deadline knsa process miss kr rha ha
                                                    % I us process ka index
                                                    % ha jo line 37 se aya
                                                    % ha
        break

    end
    end
    if (flag==1)
        break
    end
end