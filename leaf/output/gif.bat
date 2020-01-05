SET /a count=640
for /l %%a in (1,1,%count%) do call set "Myvar=%%Myvar%% gif-%%a.gif"
gifsicle -d 3 -k 256 -O3 -l %Myvar% > anim.gif
del gif-*