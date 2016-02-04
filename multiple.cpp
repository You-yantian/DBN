function result=multiple(x,y)

global countmul countzero;

accuracy=2^-15;
result=zeros(size(x,1),size(y,2));
 for a=1:size(x,1)
      for c=1:size(y,2)
            for b=1:size(x,2)
                     tempvalue=x(a,b)*y(b,c);  
                     countmul=countmul+1;
               if tempvalue<accuracy  
                      countzero=countzero+1;
                      %tempvalue=0;
               end
                  result(a,c)=result(a,c)+tempvalue;
            end
      end
 end
end
