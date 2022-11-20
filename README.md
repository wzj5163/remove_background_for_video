# remove_background_for_video
To remove background of video, in order to play on keynote, I try many methods,  from ffmpeg, website online tools. to iMovie.

1. Video tutorial for transparent website video for a [golf ball](https://www.youtube.com/watch?v=C67S5x7QWzc) on Mac. Output is mov. Tool: Adobe after effects(not free), Shutter Encoder. The very important step is done by Adobe after effects.
2. Use ffmpeg to replace [green background](https://www.google.com/search?client=safari&rls=en&q=Making+Transparent+Video+with+FFMPEG+by+Chroma+Keying+%7C+Tutorial&ie=UTF-8&oe=UTF-8#fpstate=ive&vld=cid:444a68c3,vid:0tA4fauFykw) with transparent background.
3. Use [iMovie](https://www.youtube.com/watch?v=KZxPHQDRiF4) to combine video and png, replace green background with selected png.
4. [Videezy](https://www.videezy.com): video resources.
5. Use ffmpeg to import images with alpha to a video with alpha in [stackoverflow](https://stackoverflow.com/questions/644684/turn-image-sequence-into-video-with-transparency), codes are `ffmpeg -i network_%03d.png -vcodec png my2.mov`. Cannot display.
6. Online tool [deposiphotos](https://cn.depositphotos.com/bgremover/upload.html), which can transform black background to green background. 
7. Use ffmpeg to output alpha mov, found in [CSDN](https://blog.csdn.net/ternence_hsu/article/details/99845214?spm=1001.2101.3001.6650.3&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-3-99845214-blog-92800740.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-3-99845214-blog-92800740.pc_relevant_default&utm_relevant_index=4), codes are ` ffmpeg -f image2 -r 10 -i network_%03d.png -vf fps=25 -vcodec png my2.mov -y `. Cannot display.
8. Combind 2 videos and make one transparent, found in [CSDN blog](https://blog.csdn.net/yu540135101/article/details/92800740?spm=1001.2101.3001.6650.3&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-3-92800740-blog-121595304.pc_relevant_aa2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-3-92800740-blog-121595304.pc_relevant_aa2&utm_relevant_index=4).
9. Use ffmpeg to import images with alpha to generate video with alpha, found in [CSDN](https://blog.csdn.net/dlhlSC/article/details/107491951), codes are `ffmpeg -r 10 -i network_%03d.png -vcodec qtrle my2.mov -y`, cannot play. ffmpeg -r 10 -i network_%03d.png -vcodec ffvhuff my2.avi -y`, cannot play. `ffmpeg -r 10 -i network_%03d.png -vcodec huffyuv my2.avi -y`, cannot play.
10. Use ffmpeg to import images to make a mov and set framerate as 10, codes are `ffmpeg -r 10 -i network_%03d.png -pix_fmt yuva420p my3film.mov`. Can work but not transparent.
11. Different formats supporting video with alpha in IOS and Android, found in [CSDN](https://blog.csdn.net/weixin_39968801/article/details/109994545?spm=1001.2101.3001.6650.2&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-2-109994545-blog-99845214.pc_relevant_3mothn_strategy_recovery&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-2-109994545-blog-99845214.pc_relevant_3mothn_strategy_recovery&utm_relevant_index=3). Seems like IOS only supports [H265](https://www.youtube.com/watch?v=aZtlwWXX8ns) with alpha channel.
12. Use ffmpeg, inputs are a mp4 and a png, output is mp4, codes use`colorchannelmixer`, found in [Youtube](https://www.youtube.com/watch?v=Aj6aMRv5M2M).
13. RiskMakes personal [website](https://www.rickmakes.com/ffmpeg-notes/) for ffmpeg.
14. Use ffmpeg to remove green background and replace it with transparent background. Use vp9, output is webm. Codes are `ffmpeg -i my2film.mp4 -c:v vp9 -filter:v "chromakey=0x000000:0.1:0.2" my1.webm -y`. Cannot play.
15. Using ffmpeg to make an H.265 file compatible with Quicktime, found in [RiskMakes website](https://www.rickmakes.com/using-ffmpeg-to-make-an-h-265-file-compatible-with-quicktime-high-sierra-and-up/), codes are `ffmpeg -i input.mp4 -codec copy -tag:v hvc1 output.mp4`. My version `ffmpeg -i my2.mov -codec copy -tag:v hvc1 my2_1.mov` cause error.
16. Use ffmpeg to create [transparent timer](https://www.rickmakes.com/creating-an-elapsed-timer-with-transparent-background-using-ffmpeg/).
17. Use ffmpeg to create [transparent scrolling credits](https://www.youtube.com/watch?v=XlRnn2u44aA).
18. Use ffmpeg to convert [pngs to a mp4](https://www.youtube.com/watch?v=thDma0lO0U8), codes are `ffmpeg -r 10 -i network_%03d.png -pix_fmt yuv420p my1.mp4`. 
19. [Chinese tutorials](https://www.youtube.com/watch?v=qf90-IeE4q8) for how to install and use ffmpeg,  very clear. 
20. Encoder [Apple ProRes](https://www.quora.com/Do-MOV-files-support-transparency) supports alpha channel and can play on Quicktime, codes are`ffmpeg -r 10 -i network_%03d.png -c:v prores:v -profile 4  -pix_fmt yuv444p10  my1.mov -y`. or `ffmpeg -r 10 -i network_%03d.png -c:v prores_ks -profile:v 4  -pix_fmt yuv444p10  my1.mov -y
`. Not transparent.

Create a background [using one png](https://stackoverflow.com/questions/25891342/creating-a-video-from-a-single-image-for-a-specific-duration-in-ffmpeg) `ffmpeg -loop 1 -i background.png -c:v libx264 -t 17 -pix_fmt yuv420p -vf scale=1320:640 my2.mp4 -y`.

Add pngs to video:
- `ffmpeg -i my2.mp4 -i network_001.png -filter_complex "[0:v][1:v]overlay" -vcodec libx264 my2_1.mp4 -y`. png too big
- `ffmpeg -i my2.mp4 -r 10 -i network_%03d.png -filter_complex "[0:v][1:v]overlay" -vcodec libx264 my2_1.mp4 -y`. only 1 png
- `ffmpeg -i my2.mp4 -framerate 10 -pattern_type glob -i "network_%03d.png" -filter_complex "[1:v][0:v]scale2ref=iw:ih[ovr]; [ovr][0:v]blend=all_mode='overlay':all_opacity=0.7[v]" -map [v] my2_1.mp4 -y` as in [here](https://superuser.com/questions/1050297/how-can-i-overlay-pngs-with-transparency-over-a-video-each-png-should-cover-on).
- `ffmpeg -i my2.mp4 -i network_001.png -filter_complex "[0:v][1:v]overlay=50:50:enable='between(t,0,1)'" -pix_fmt yuv420p -c:a copy my2_1.mp4 -y` as in [Youtube](https://www.youtube.com/watch?v=dGFXAk-KClA). Time in (0,1), scale not solved.
- `ffmpeg -i my2.mp4 -i network_001.png -filter_complex "[1]scale=50:50;[0:v][1:v]overlay=50:50:enable='between(t,0,1)'" -pix_fmt yuv420p -c:a copy my2_1.mp4 -y`, scaled, but awful.
- `ffmpeg -i background.png -i network_%03d.png -filter_complex "overlay" my2_1.mp4 -y`, works but no scaled, thanks to [this](https://www.youtube.com/watch?v=hXQU56dgqmc).
- `ffmpeg -i background.png -r 10 -i network_%03d.png -filter_complex "overlay" my2_1.mp4 -y`, change frame rate, works but no scaled.
