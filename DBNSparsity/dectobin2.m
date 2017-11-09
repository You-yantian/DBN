function y=dectobin2(innum,N)

if (innum>2)||(N == 0)%
    disp('error!');
    return;
end
count=0;
if(innum>=0)
    tempnum=innum;
    record='0';
    flag=0;
else 
    tempnum=-1*innum;
    record='1';
    flag=1;
end
   if (flag==0)       
       switch fix(tempnum)
           case 0 
               record=[record '000'];
           case 1 
               record=[record '001'];
           case 2 
               record=[record '010'];
           case 3 
               record=[record '011'];
           case 4 
               record=[record '100'];
           case 5 
               record=[record '101'];
           case 6 
               record=[record '110'];
           case 7 
               record=[record '111'];
       end
   elseif(flag==1)
       switch fix(tempnum)
           case 0 
               record=[record '111'];
           case 1 
               record=[record '110'];
           case 2
               record=[record '101'];
           case 3 
               record=[record '100'];
           case 4 
               record=[record '011'];
           case 5 
               record=[record '010'];
           case 6 
               record=[record '001'];
           case 7 
              record=[record '000'];
       end
   end
   if((tempnum-fix(tempnum))==0)
       if(flag==0)
           record=[record '000000000000'];
        elseif(flag==1)
           record=[record '111111111111'];
       end
   else
while(N)
    count=count+1;
    if(count>=N-4)
        N=0;
    end
    tempnum=tempnum*2;
    if tempnum>1
        if(flag==0)
           record=[record '1'];
        elseif(flag==1)
           record=[record '0']; 
        end
        tempnum=tempnum-1;  
    elseif(tempnum==1)
         if(flag==0)
           record=[record '1'];
        elseif(flag==1)
           record=[record '0']; 
        end
        N=0;%stop loop
    else
        if(flag==0)
           record=[record '0'];
        elseif(flag==1)
           record=[record '1']; 
        end     
    end
end
   end
%if (flag==0)
    y=record;
%elseif (flag==1)
%    record=['1' dec2bin(bin2dec(record(2:16))+1)];
%    y=record;
%end
end