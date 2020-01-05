# leaf
![gif](https://github.com/FlorianPix/leaf/blob/master/leaf/output/anim.gif)

This is a processing programm that lets you draw any symmetrix leaf that you want and creates a vein growth animation for it.

## Inspiration:
[36C3 Wikipaka WG: Operation Mindfuck Vol. 3](https://www.youtube.com/watch?v=jxkyjR3VRIk&t=2546s)

[@Bleeptrack](https://twitter.com/Bleeptrack/status/1140370222458769409?ref_src=twsrc%5Etfw)

## Instructions:
To draw a leaf change the path in leaf\leaf_outline\leaf_outline.pde to the directory the file is in and then run it. To use that drawing the bool use_testPathFile in leaf\leaf.pde must be true.

To create a gif you just need to run leaf\leaf.pde which outputs all frames as png files. Those need to be converted to single gif files with the leaf/output/convert.bat. After that all the gif files can be stitched together to one file with leaf/output/gif.bat.

The bat files are very simple and can easily be replicated with bash if you need to.

There are a lot of little nobs you can tweak like the spawn rate (how many axiun are spawned every frame), the growthrate (how far the veins grow per frame) and "percent" (how much the leaf outline grows per frame).
