clc
clear all
close all
n=input('Enter no of processes:')
sum=0;
for i=1:n
    bt(i)=input('Enter burst time:')
    p(i)=input('Enter period:')
end
for i=1:n
    sum=sum+(bt(i)/p(i));
end
if (sum>1)
    disp('These Processes are not Schedulable!!!!')
else
    disp('These Processes are Schedulable!!!!')
end
stack=0
flag=0
[M I]=min(p(:))

for i=1:n
    for j=i+1:n
        if(p(i)>p(j))
            temp=p(i)
            p(i)=p(j)
            p(j)=temp
            temp1=bt(i)
            bt(i)=bt(j)
            bt(j)=temp1
        end
    end
end
per=p
b_t=bt
ct=p
new=p-p
for k=1:n
    for i=1:n
        for j=1:n
            if (per(j)==min(per(:)))
            stack=stack+b_t(j)
%                 if(stack<per(j))
%                     ssss=1
%                 end
                if (stack>per(j))
                 flag=1
                disp('Deadline missed!!!!!!!!!')
                fprintf('Deadline is missed by P%d\n',j)
                break
                end
             per(j)=per(j)+ct(j)
             new(j)=new(j)+ct(j)
        if(flag==1)
            break
        end
        end
        end
    if(stack<min(new(:)))
            z=min(new(:))-stack
            stack=stack+z
        end
    if(flag==1)
            break
    end      
    end
    if(flag==1)
            break
        end
end