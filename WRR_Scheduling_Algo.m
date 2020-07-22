clc
clear all
close all
n=input('Enter no of processes:')   %input from user .......no of processes
tat=zeros(1,n);                   % tat is turnaround time is main agr n=3 ha to tat=0 0 0.....jitna n ha utne zeros daal dega
wt=zeros(1,n);                    %wt waiting time ha
b=0;
t=0;
flag=0;
for i=1:n                       % input burst time and time quantum or time slice for each process
    
    bt(i)=input('Enter Burst time;')
    qt(i)=input('Enter time slice;')
end

rem_time=[bt];             % 1 variable bnaya remaining time ka jo initially 
                            % burst time k equal ha....ye update ho ga
                            % mtlb hr process ka jitna slice ha wo burst
                            % time se minus ho jaye ga
                            % agr bt=[2 3 4] ha and quantum=[1 2 2 ] ha to
                            % remaining time update ho k [2-1 3-2
                            % 4-2]======[1 1 2] reh jaye ga
for i=1:n               
    if(rem_time(i)>0)       % ye condition just flag ko 1 krne k liye lgayi ha 
                            % ta k while loop chl sky.........khass zrorat
                            % ni thi iski
        flag=1
    end
end
while(flag==1)              % while condition flag==1 ha tb chale gi and immediately =0 ho jaye gi
    flag=0
for i=1:n                  %NESTED FOR loop lga diya
    if(rem_time(i)>=qt(i))   % ye condition just is liye lgayi k pta chlta rhy k konsa process chl rha 
                            % and rem-time=[3 4 5] ha and qt=[2 2 1]ha tb
                            % ye check kre ga and agy chaly ga wrna if ni
                            % execute hogi............ELSE HOGI execute
                            
                            %%%Ye kaam is liye kiya ha k suppose
                            %%%rem_time=[1 3 4] and time slice=[2 2 2] ha then
                            % rem_time - slice hota ha to 1-2=-1 to ye
                            % negative value ho jaye gi is liye ELSE
                            % coondition chale gi sirf is case k liye
        fprintf('P%d\n',i)
        for j=1:n           % for i k ander for j nested loop lga diya 
                            % ab ye j==i is liye kr rhy ha k waiting time
                            % nikaal sken mtlb aese k agr rem_time=[4 5 6]
                            % ha and slice [2 2 2] ha to 1st process chala
                            % us ka rem_time-slice howa then rem_time=[2 5
                            % 6] ho gya .......................Lekin jo
                            % next process aaye ga wo 2 second wait krne k
                            % baad aaye ga is liye else main waiting time
                            % ko quantum main add kr rhy han
            if(j==i)
                rem_time(i)=rem_time(i)-qt(i)   % rem time - slice hoga ...hr baar update hoga
            else if(rem_time(j)>0)
                    wt(j)=wt(j)+qt(j)
                end
            end
        end
    else if(rem_time(i)>0)     %ab ye condition aa gyi jis main rem_time=[1 2 3] ha and
                               % slice [2 2 2] ha ab agr rem_time-slice ho
                               % to negative answer aaye ga 
            fprintf('P%d\n',i)
            for j=1:n
              if(j==i)
                rem_time(i)=0;        % isi liye rem_time negative ni hony dena 0 kr dena ha          
              else if(rem_time(j)>0)
                    wt(j)=wt(j)+rem_time(i)   
                  end 
              end
            end
        end
    end
end
 for i=1:n
        if(rem_time(i)>0)
            flag=1
        end
    end
end

for i=1:n
    tat(i)=wt(i)+bt(i);   % turnaround time nikaal liya
                           % baki sb print kiya ha
end
disp('Process   Burst time  Waiting time    TurnAround time')
for i=1:1:n
    fprintf('P%d\t\t\t%d\t\t\t%d\t\t\t\t%d\n',(i),bt(i),wt(i),tat(i));
    b=b+wt(i);
    t=t+tat(i);
end
fprintf('Average waiting time: %f\n',(b/n));
fprintf('Average turn around time: %f\n',(t/n));



