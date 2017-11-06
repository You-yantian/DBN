function y=dectobin(innum,N)
%????????????
%?????innum?N
%innum?????????
%N????????????
if (innum>1)||(N == 0)%
    disp('error!');
    return;
end
count=0;
if(innum>=0)
    tempnum=innum;
    flag=0;
else 
    tempnum=-1*innum;
    flag=1;
end
record=zeros(1,N-1);
while(N)
    count=count+1;%????N
    if(count>=N-1)
        N=0;
    end
    tempnum=tempnum*2;
    if tempnum>1
        record(count)=1;
        tempnum=tempnum-1;  
    elseif(tempnum==1)
        record(count)=1;
        N=0;%stop loop
    else
       record(count)=0;     
    end
end
if (flag==0)
    y= ['0' dec2bin(bin2dec(num2str(record)))];
else
    record=dec2bin(bin2dec(num2str(~record))+1);
    y=['1' record];
end
end