mkdir SDtemp
copy *@2x*.png SDtemp
copy *@2x*.jpg SDtemp
mogrify -format png -resize 50%% SDtemp/*@2x*.png
mogrify -format jpg -resize 50%% SDtemp/*@2x*.jpg
mogrify -format jpg -resize 50%% SDtemp/*@2x*.jpeg
pushd SDtemp

setlocal enableDelayedExpansion
for %%a in (*.png) do (
    set "filename=%%~nxa"
    set "purged_filename=!filename:@2x=!"
    ren %%~nxa !purged_filename!
)

setlocal enableDelayedExpansion
for %%a in (*.jpg) do (
    set "filename=%%~nxa"
    set "purged_filename=!filename:@2x=!"
    ren %%~nxa !purged_filename!
)

setlocal enableDelayedExpansion
for %%a in (*.jpeg) do (
    set "filename=%%~nxa"
    set "purged_filename=!filename:@2x=!"
    ren %%~nxa !purged_filename!
)

endlocal
move *.png ..
move *.jpg ..
move *.jpeg ..
popd

rmdir /s /q SDtemp