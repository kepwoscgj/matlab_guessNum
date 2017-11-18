function guessNum(minBound,maxBound)
fprintf('Aries made a simple game! \n');
game_finish = false;
count = 1 ;
%%
% determining the password answer
minBoundtemp = minBound ; maxBoundtemp = maxBound; 
diff = maxBoundtemp - minBoundtemp ;
if diff == 0
    anr = minBoundtemp ;
    fprintf('the password is %d. Do you want to play the game?',anr);
else 
    seed_number = randperm(diff);
    anr = minBoundtemp + seed_number(1);
end
%% input data iteration

while (~game_finish)
    gsn =inputdata_correction(minBoundtemp,maxBoundtemp); 
    if ( gsn > anr )
        maxBoundtemp = gsn ;
        game_finish = false ;
        count = count + 1 ;
    end
    if ( gsn < anr)
        minBoundtemp = gsn;
        game_finish = false;
        count = count + 1 ;
    end
    if (gsn == anr)
        game_finish = true;
        fprintf('Win!!!\nYou take %d times\n',count);
        check = input('Do you want to play again?(1:YES / 2:NO)\n','s');
        if check == '1'
            guessNum(minBound,maxBound);
        else
            fprintf('Thanks a lot,byebye~~~\n');
        end
        
            
    end

end


end

function gsn =inputdata_correction(minBound,maxBound)

    fprintf('You can enter a number between %d and %d\n',minBound,maxBound);
    gsn = input('Please enter a number: ');
    while  (gsn > maxBound ||gsn < minBound)
       fprintf('You get a wrong area!!\n');
       fprintf('You can enter a number between %d and %d\n',minBound,maxBound);
       gsn = input('Please enter a number: ');
    end


end